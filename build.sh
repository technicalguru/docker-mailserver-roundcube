docker buildx build \
     --progress=plain \
     -t technicalguru/mailserver-roundcube:latest \
     -t technicalguru/mailserver-roundcube:1.6.14.0 \
     -t technicalguru/mailserver-roundcube:1.6.14 \
     -t technicalguru/mailserver-roundcube:1.6 \
     -t technicalguru/mailserver-roundcube:1 \
     --push \
     --platform linux/amd64,linux/arm64 \

#docker build -t technicalguru/mailserver-roundcube:latest .
