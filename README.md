# docker-mailserver-roundcube
This is a Docker image for Roundcube WebUI. The project is part of the 
[docker-mailserver](https://github.com/technicalguru/docker-mailserver) project but can run separately 
without the other components. However, a database server is always required to store data. 

Related images:
* [docker-mailserver](https://github.com/technicalguru/docker-mailserver) - The main project, containing composition instructions
* [docker-mailserver-postfix](https://github.com/technicalguru/docker-mailserver-postfix) - Postfix/Dovecot image (mailserver component)
* [docker-mailserver-opendkim](https://github.com/technicalguru/docker-mailserver-opendkim) - OpenDKIM image (DKIM signing milter component)
* [docker-mailserver-postfixadmin](https://github.com/technicalguru/docker-mailserver-postfixadmin) - Image for PostfixAdmin (Web UI to manage mailboxes and domain in Postfix)
* [docker-mailserver-amavis](https://github.com/technicalguru/docker-mailserver-amavis) - Amavis, ClamAV and SpamAssassin (provides spam and virus detection)

# Tags
The following versions are available from DockerHub. The image tag matches the Roundcube version.

* [1.6.9.0, 1.6.9, 1.6, 1, latest](https://hub.docker.com/repository/docker/technicalguru/mailserver-roundcube) - [Dockerfile](https://github.com/technicalguru/docker-mailserver-roundcube/blob/1.6.9.0/Dockerfile)
* [1.5.2.0, 1.5.2, 1.5](https://hub.docker.com/repository/docker/technicalguru/mailserver-roundcube) - [Dockerfile](https://github.com/technicalguru/docker-mailserver-roundcube/blob/1.5.2.0/Dockerfile)
* [1.4.11.0, 1.4.11, 1.4](https://hub.docker.com/repository/docker/technicalguru/mailserver-roundcube) - [Dockerfile](https://github.com/technicalguru/docker-mailserver-roundcube/blob/1.4.11.0/Dockerfile)

# Features
* Database and Roundcube setup from environment variables

# License
_docker-mailserver-roundcube_  is licensed under [GNU LGPL 3.0](LICENSE.md). As with all Docker images, these likely also contain other software which may be under other licenses (such as Bash, etc from the base distribution, along with any direct or indirect dependencies of the primary software being contained).

As for any pre-built image usage, it is the image user's responsibility to ensure that any use of this image complies with any relevant licenses for all software contained within.

# Prerequisites
The following components must be available at runtime:
* [MySQL >8.0](https://hub.docker.com/\_/mysql) or [MariaDB >10.4](https://hub.docker.com/\_/mariadb) - used as database backend for domains and mailboxes. 

# Usage

## Environment Variables
_docker-mailserver-roundcube_  requires various environment variables to be set. The container startup will fail when the setup is incomplete.

| **Variable** | **Description** | **Default Value** |
|------------|---------------|-----------------|
| `RC_DB_HOST` | The hostname or IP address of the database server |  |
| `RC_DB_USER` | The name of the database user. **Attention!** You shall not use an administrator account. |  |
| `RC_DB_PASS` | The password of the database user |  |
| `RC_DB_NAME` | The name of the database | |
| `RC_DES_KEY` | This key is used to encrypt the users IMAP password which is stored in the session record (and the client cookie if remember password is enabled). Please, provide a string of exactly 24 chars. | |
| `RC_IMAP_SERVER_NAME` | The hostname of the IMAP server for picking up e-mails. | |
| `RC_SMTP_SERVER_NAME` | The hostname of the SMTP server fpr sending e-mails. | |
| `RC_DEFAULT_DOMAIN` | The default mail domain to be used. This saves typing effort when logging in for this domain as you only need to input the mailbox name. | |

## Ports
_docker-mailserver-roundcube_  exposes port 80 (the WebUI). No TLS support is built in. So you shall put your container behind an Ingress or Reverse Proxy that enforces HTTPS.

## Running the Container
The [main mailserver project](https://github.com/technicalguru/docker-mailserver) has examples of container configurations:
* [with docker-compose](https://github.com/technicalguru/docker-mailserver/tree/master/examples/docker-compose)
* [with Kubernetes YAML files](https://github.com/technicalguru/docker-mailserver/tree/master/examples/kubernetes)
* [with HELM charts](https://github.com/technicalguru/docker-mailserver/tree/master/examples/helm-charts)

## Bootstrap and Setup
Once you have started your Roundcube container successfully, follow these instruction to setup your instance:

1. Login to your database and create the Roundcube user with password and the appropriate database (values from your enviroment variables).
1. Log into the container and edit file `/var/www/html/config/config.inc.php`. Enable the installer by setting `$config['enable_installer'] = true;` (line 113).
1. Navigate in your browser to `/installer/`.
1. Check the setup and click Next.
1. Check that the database config is OK at "DSN".
1. Click the "Initialize database" button to create the DB schema.
1. Test the SMTP and IMAP configs and make adjustments if required
1. Log into the container and edit file `/var/www/html/config/config.inc.php` again. Disable the installer by setting `$config['enable_installer'] = false;` (line 113).

Now you can navigate to `/` in your browser and login with your mail account credentials.

# Additional Roundcube customization
You can further customize `config.inc.php`. Please follow these instructions:

1. Get a copy of the file from the `/var/www/html` folder. 
1. Customize your configuration file.
1. Provide your customized file back into the `/var/www/html` by using a volume mapping.

# Increase Upload size for attachments
The attachment size is controlled by the PHP configuration. The file must be placed in `/usr/local/etc/php/conf.d/`:

```
upload_max_filesize = 20M
post_max_size = 20M
```

For Kubernetes using the HELM chart, create the following ConfigMap:

```
apiVersion: v1
kind: ConfigMap
metadata:
  name: mailserver-roundcube-upload
data:
  upload.ini: |-
    upload_max_filesize = 10M
    post_max_size = 10M
```

Add the following lines to your HELM values.yaml file:

```
additionalContainerSpec:
  volumeMounts:
  - mountPath: /usr/local/etc/php/conf.d/upload.ini
    name: roundcube-upload-config
    subPath: upload.ini
additionalPodSpec:
  volumes:
  - name: roundcube-upload-config
    configMap:
      name: mailserver-roundcube-upload
```


# Issues
This Docker image is mature and supports my own mailserver in production. There are no known issues at the moment.


# Contribution
Report a bug, request an enhancement or pull request at the [GitHub Issue Tracker](https://github.com/technicalguru/docker-mailserver-roundcube/issues). Make sure you have checked out the [Contribution Guideline](CONTRIBUTING.md)


