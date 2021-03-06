# Contributing to Mailserver Project

:+1::tada: First off, thanks for taking the time to contribute! :tada::+1:

The following is a set of guidelines for contributing to mailserver and its packages. These are mostly guidelines, not rules. Use your best judgment, and feel free to propose changes to this document in a pull request.

#### Table Of Contents

[I don't want to read this whole thing, I just have a question!!!](#i-dont-want-to-read-this-whole-thing-i-just-have-a-question)

[What should I know before I get started?](#what-should-i-know-before-i-get-started)
  * [Mailserver and Packages](#mailserver-and-packages)
  * [Design Decisions](#design-decisions)

[How Can I Contribute?](#how-can-i-contribute)
  * [Reporting Bugs](#reporting-bugs)
  * [Suggesting Enhancements](#suggesting-enhancements)

[Styleguides](#styleguides)
  * [Git Commit Messages](#git-commit-messages)
  * [Documentation Styleguide](#documentation-styleguide)

[Additional Notes](#additional-notes)
  * [Issue and Pull Request Labels](#issue-and-pull-request-labels)

## I don't want to read this whole thing I just have a question!!!

> Please file an issue labelled **`help wanted`** to ask a question. There is no message board at this point.

## What should I know before I get started?

### Mailserver and Packages

Mailserver is an open source project &mdash; it's made up of [5 repositories](https://github.com/technicalguru?tab=repositories&q=docker-mailserver&type=&language=). When you initially consider contributing to Mailserver, you might be unsure about which of those 5 repositories implements the functionality you want to change or report a bug for. This section should help you with that.

Mailserver is intentionally modular. Its main mail-related functions are separated which come from individual packages. Here's a list:

* [docker-mailserver](https://github.com/technicalguru/docker-mailserver) - Provides help, guidance and examples how to orchestrate the Docker images
* [docker-mailserver-postfix](https://github.com/technicalguru/docker-mailserver-postfix) - Implements the core mailing functionality to send and receive messages.
* [docker-mailserver-opendkim](https://github.com/technicalguru/docker-mailserver-opendkim) - Implements the DKIM signing functionality.
* [docker-mailserver-postfixadmin](https://github.com/technicalguru/docker-mailserver-postfixadmin) - Provides administration function for domains and mailboxes
* [docker-mailserver-amavis](https://github.com/technicalguru/docker-mailserver-amavis) - Provides mail scanners to detect viruses and spam
* [docker-mailserver-roundcube](https://github.com/technicalguru/docker-mailserver-roundcube) - A webmail interface that lets you pick-up, read, manage and send e-mails

### Design Decisions

When a significant decision is taken in how to maintain the project and what can or cannot be supported, it will be documented it in the [technicalguru/docker-mailserver repository](https://github.com/technicalguru/docker-mailserver). If you have a question around how to do things, check to see if it is documented there. If it is *not* documented there, please open a new issue there.

## How Can I Contribute?

### Reporting Bugs

This section guides you through submitting a bug report for Mailserver. Following these guidelines helps to understand your report :pencil:, reproduce the behavior :computer: :computer:, and find related reports :mag_right:.

Before creating bug reports, please check [this list](#before-submitting-a-bug-report) as you might find out that you don't need to create one. When you are creating a bug report, please [include as many details as possible](#how-do-i-submit-a-good-bug-report). 

> **Note:** If you find a **Closed** issue that seems like it is the same thing that you're experiencing, open a new issue and include a link to the original issue in the body of your new one.

#### Before Submitting A Bug Report

* **Determine [which repository the problem should be reported in](#mailserver-and-packages)**.
* **Perform a [cursory search](https://github.com/search?q=+is%3Aissue+user%3Atechnicalguru)** to see if the problem has already been reported. If it has **and the issue is still open**, add a comment to the existing issue instead of opening a new one.

#### How Do I Submit A (Good) Bug Report?

Bugs are tracked as [GitHub issues](https://guides.github.com/features/issues/). After you've determined [which repository](#mailserver-and-packages) your bug is related to, create an issue on that repository and provide the following information.

Explain the problem and include additional details to help reproducing the problem:

* **Use a clear and descriptive title** for the issue to identify the problem.
* **Describe the exact steps which reproduce the problem** in as many details as possible. For example, start by explaining how you started the containers, e.g. which command exactly you used in the terminal, or how you started it otherwise. When listing steps, **don't just say what you did, but explain how you did it**. For example, if you sent out an e-mail, explain how you submitted it to the mailserver, what client you have used and how your client was configured to use the interface.
* **Provide specific examples to demonstrate the steps**. Include links to files or GitHub projects, or copy/pasteable snippets, which you use in those examples. If you're providing snippets in the issue, use [Markdown code blocks](https://help.github.com/articles/markdown-basics/#multiple-lines).
* **Describe the behavior you observed after following the steps** and point out what exactly is the problem with that behavior.
* **Explain which behavior you expected to see instead and why.**
* **Include log files and screen shots** which show you following the described steps and clearly demonstrate the problem.
* **If the problem wasn't triggered by a specific action**, describe what you were doing before the problem happened and share more information using the guidelines below.

Provide more context by answering these questions:

* **Can you reproduce the problem?**
* **Did the problem start happening recently** (e.g. after updating to a new version of Mailserver) or was this always a problem?
* If the problem started happening recently, **can you reproduce the problem in an older version of Mailserver?** What's the most recent version in which the problem doesn't happen? You can download older versions of Mailserver from the releases pages of the individual packages.
* **Can you reliably reproduce the issue?** If not, provide details about how often the problem happens and under which conditions it normally happens.

Include details about your configuration and environment:

* **Which versions of Mailserver components are you using?** You can get the exact versions by checking out the Docker image tags, e.g. running `docker ps --format "{{.ID}}: {{.Image}}"|grep mailserver` in your terminal, or - for Kubernetes - `kubectl get pods --all-namespaces -o yaml|grep "image: technicalguru/mailserver"`.
* **Are you running Mailserver in a Kubernetes cluster?** If so, which Kubernetes version are you using and which Ingress controller and network plugin are installed?
* **Are you using custom configuration files?** If so, provide the contents of those files, preferably in a [code block](https://help.github.com/articles/markdown-basics/#multiple-lines) or with a link to a [gist](https://gist.github.com/).

> **Attention!** Do not include any password or secret in your issue description or its attachments. Blank them out as `******` or replace them by `mypassword` instead.


### Suggesting Enhancements

This section guides you through submitting an enhancement suggestion for Mailserver, including completely new features and minor improvements to existing functionality. Following these guidelines helps to understand your suggestion :pencil: and find related suggestions :mag_right:.

Before creating enhancement suggestions, please check [this list](#before-submitting-an-enhancement-suggestion) as you might find out that you don't need to create one. When you are creating an enhancement suggestion, please [include as many details as possible](#how-do-i-submit-a-good-enhancement-suggestion). 

#### Before Submitting An Enhancement Suggestion

* **Determine [which repository the enhancement should be suggested in](#mailserver-and-packages).**
* **Perform a [cursory search](https://github.com/search?q=+is%3Aissue+user%3Atechnicalguru)** to see if the enhancement has already been suggested. If it has, add a comment to the existing issue instead of opening a new one.

#### How Do I Submit A (Good) Enhancement Suggestion?

Enhancement suggestions are tracked as [GitHub issues](https://guides.github.com/features/issues/). After you've determined [which repository](#mailserver-and-packages) your enhancement suggestion is related to, create an issue on that repository and provide the following information:

* **Use a clear and descriptive title** for the issue to identify the suggestion.
* **Provide a step-by-step description of the suggested enhancement** in as many details as possible.
* **Provide specific examples to demonstrate the steps**. Include copy/pasteable snippets which you use in those examples, as [Markdown code blocks](https://help.github.com/articles/markdown-basics/#multiple-lines).
* **Describe the current behavior** and **explain which behavior you expected to see instead** and why.
* **Explain why this enhancement would be useful** to most Mailserver users and isn't something that can or should be implemented as custom configuration.
* **List some other mailserver implementation and configurations where this enhancement exists.**
* **Specify which version of Mailserver you're using.** You can get the exact versions by checking out the Docker image tags, e.g. running `docker ps --format "{{.ID}}: {{.Image}}"|grep mailserver` in your terminal, or - for Kubernetes - `kubectl get pods --all-namespaces -o yaml|grep "image: technicalguru/mailserver"`.
* **Are you running Mailserver in a Kubernetes cluster?** If so, which Kubernetes version are you using and which Ingress controller and network plugin are installed?

## Styleguides

### Git Commit Messages

* Use the present tense ("Add feature" not "Added feature")
* Use the imperative mood ("Move cursor to..." not "Moves cursor to...")
* Limit the first line to 72 characters or less
* Reference issues and pull requests liberally after the first line
* When only changing documentation, include `[ci skip]` in the commit title
* Consider starting the commit message with an applicable emoji:
    * :art: `:art:` when improving the format/structure of the code
    * :racehorse: `:racehorse:` when improving performance
    * :non-potable_water: `:non-potable_water:` when plugging memory leaks
    * :memo: `:memo:` when writing docs
    * :penguin: `:penguin:` when fixing something on Linux
    * :apple: `:apple:` when fixing something on macOS
    * :checkered_flag: `:checkered_flag:` when fixing something on Windows
    * :bug: `:bug:` when fixing a bug
    * :fire: `:fire:` when removing code or files
    * :green_heart: `:green_heart:` when fixing the CI build
    * :white_check_mark: `:white_check_mark:` when adding tests
    * :lock: `:lock:` when dealing with security
    * :arrow_up: `:arrow_up:` when upgrading dependencies
    * :arrow_down: `:arrow_down:` when downgrading dependencies
    * :shirt: `:shirt:` when removing linter warnings

### Documentation Styleguide

Use the [Markdown](https://daringfireball.net/projects/markdown) syntax for documentation files.

## Additional Notes

### Issue and Pull Request Labels

This section lists the labels we use to help us track and manage issues and pull requests. Labels are used across all Mailserver repositories.

[GitHub search](https://help.github.com/articles/searching-issues/) makes it easy to use labels for finding groups of issues or pull requests you're interested in. For example, you might be interested in [open issues across Mailserver which are labeled as bugs, but still need to be reliably reproduced](https://github.com/search?utf8=%E2%9C%93&q=is%3Aopen+is%3Aissue+user%3Amailserver+label%3Abug+label%3Aneeds-reproduction) or perhaps [open pull requests in `technicalguru/docker-mailserver-postfix` which haven't been reviewed yet](https://github.com/search?utf8=%E2%9C%93&q=is%3Aopen+is%3Apr+repo%3Atechnicalguru%2Fdocker-mailserver-postfix+comments%3A0). To help you find issues and pull requests, each label is listed with search links for finding open items with that label across all Mailserver repositories. We  encourage you to read about [other search filters](https://help.github.com/articles/searching-issues/) which will help you write more focused queries.

The labels are loosely grouped by their purpose, but it's not required that every issue have a label from every group or that an issue can't have more than one label from the same group.

Please open an issue on `technicalguru/docker-mailserver` if you have suggestions for new labels, and if you notice some labels are missing on some repositories, then please open an issue on that repository.

#### Type of Issue and Issue State

| Label name | Search :mag_right: | Description |
| --- | --- | --- |
| `enhancement` | [search][search-mailserver-label-enhancement] | Feature requests. |
| `bug` | [search][search-mailserver-label-bug] | Confirmed bugs or reports that are very likely to be bugs. |
| `question` | [search][search-mailserver-label-question] | Questions more than bug reports or feature requests (e.g. how do I do X). |
| `feedback` | [search][search-mailserver-label-feedback] | General feedback more than bug reports or feature requests. |
| `help-wanted` | [search][search-mailserver-label-help-wanted] | The author or maintainer would appreciate help from the community in resolving these issues. |
| `beginner` | [search][search-mailserver-label-beginner] | Less complex issues which would be good first issues to work on for users who want to contribute to Mailserver. |
| `more-information-needed` | [search][search-mailserver-label-more-information-needed] | More information needs to be collected about these problems or feature requests (e.g. steps to reproduce). |
| `needs-reproduction` | [search][search-mailserver-label-needs-reproduction] | Likely bugs, but haven't been reliably reproduced. |
| `blocked` | [search][search-mailserver-label-blocked] | Issues blocked on other issues. |
| `duplicate` | [search][search-mailserver-label-duplicate] | Issues which are duplicates of other issues, i.e. they have been reported before. |
| `wontfix` | [search][search-mailserver-label-wontfix] | The maintainer has decided not to fix these issues for now, either because they're working as intended or for some other reason. |
| `invalid` | [search][search-mailserver-label-invalid] | Issues which aren't valid (e.g. user errors). |
| `package-idea` | [search][search-mailserver-label-package-idea] | Feature request which might be good candidates for new packages, instead of extending Mailserver packages. |
| `wrong-repo` | [search][search-mailserver-label-wrong-repo] | Issues reported on the wrong repository. |

#### Topic Categories

| Label name | Search :mag_right: | Description |
| --- | --- | --- |
| `documentation` | [search][search-mailserver-label-documentation] | Related to any type of documentation. |
| `performance` | [search][search-mailserver-label-performance] | Related to performance. |
| `security` | [search][search-mailserver-label-security] | Related to security. |
| `ui` | [search][search-mailserver-label-ui] | Related to visual design. |
| `crash` | [search][search-mailserver-label-crash] | Reports of Docker image completely crashing. |
| `network` | [search][search-mailserver-label-network] | Related to network problems or working with remote files (e.g. on network drives). |
| `git` | [search][search-mailserver-label-git] | Related to Git functionality (e.g. problems with gitignore files or with showing the correct file status). |

#### Pull Request Labels

| Label name | Search :mag_right: | Description
| --- | --- | --- |
| `work-in-progress` | [search][search-mailserver-label-work-in-progress] | Pull requests which are still being worked on, more changes will follow. |
| `needs-review` | [search][search-mailserver-label-needs-review] | Pull requests which need code review, and approval from maintainers. |
| `under-review` | [search][search-mailserver-label-under-review] | Pull requests being reviewed by maintainers. |
| `requires-changes` | [search][search-mailserver-label-requires-changes] | Pull requests which need to be updated based on review comments and then reviewed again. |
| `needs-testing` | [search][search-mailserver-label-needs-testing] | Pull requests which need manual testing. |

[search-mailserver-label-enhancement]: https://github.com/search?q=is%3Aopen+is%3Aissue+user%3Atechnicalguru+label%3Aenhancement
[search-mailserver-label-bug]: https://github.com/search?q=is%3Aopen+is%3Aissue+user%3Atechnicalguru+label%3Abug
[search-mailserver-label-question]: https://github.com/search?q=is%3Aopen+is%3Aissue+user%3Atechnicalguru+label%3Aquestion
[search-mailserver-label-feedback]: https://github.com/search?q=is%3Aopen+is%3Aissue+user%3Atechnicalguru+label%3Afeedback
[search-mailserver-label-help-wanted]: https://github.com/search?q=is%3Aopen+is%3Aissue+user%3Atechnicalguru+label%3Ahelp-wanted
[search-mailserver-label-beginner]: https://github.com/search?q=is%3Aopen+is%3Aissue+user%3Atechnicalguru+label%3Abeginner
[search-mailserver-label-more-information-needed]: https://github.com/search?q=is%3Aopen+is%3Aissue+user%3Atechnicalguru+label%3Amore-information-needed
[search-mailserver-label-needs-reproduction]: https://github.com/search?q=is%3Aopen+is%3Aissue+user%3Atechnicalguru+label%3Aneeds-reproduction
[search-mailserver-label-triage-help-needed]: https://github.com/search?q=is%3Aopen+is%3Aissue+user%3Atechnicalguru+label%3Atriage-help-needed
[search-mailserver-label-windows]: https://github.com/search?q=is%3Aopen+is%3Aissue+user%3Atechnicalguru+label%3Awindows
[search-mailserver-label-linux]: https://github.com/search?q=is%3Aopen+is%3Aissue+user%3Atechnicalguru+label%3Alinux
[search-mailserver-label-mac]: https://github.com/search?q=is%3Aopen+is%3Aissue+user%3Atechnicalguru+label%3Amac
[search-mailserver-label-documentation]: https://github.com/search?q=is%3Aopen+is%3Aissue+user%3Atechnicalguru+label%3Adocumentation
[search-mailserver-label-performance]: https://github.com/search?q=is%3Aopen+is%3Aissue+user%3Atechnicalguru+label%3Aperformance
[search-mailserver-label-security]: https://github.com/search?q=is%3Aopen+is%3Aissue+user%3Atechnicalguru+label%3Asecurity
[search-mailserver-label-ui]: https://github.com/search?q=is%3Aopen+is%3Aissue+user%3Atechnicalguru+label%3Aui
[search-mailserver-label-api]: https://github.com/search?q=is%3Aopen+is%3Aissue+user%3Atechnicalguru+label%3Aapi
[search-mailserver-label-crash]: https://github.com/search?q=is%3Aopen+is%3Aissue+user%3Atechnicalguru+label%3Acrash
[search-mailserver-label-auto-indent]: https://github.com/search?q=is%3Aopen+is%3Aissue+user%3Atechnicalguru+label%3Aauto-indent
[search-mailserver-label-encoding]: https://github.com/search?q=is%3Aopen+is%3Aissue+user%3Atechnicalguru+label%3Aencoding
[search-mailserver-label-network]: https://github.com/search?q=is%3Aopen+is%3Aissue+user%3Atechnicalguru+label%3Anetwork
[search-mailserver-label-uncaught-exception]: https://github.com/search?q=is%3Aopen+is%3Aissue+user%3Atechnicalguru+label%3Auncaught-exception
[search-mailserver-label-git]: https://github.com/search?q=is%3Aopen+is%3Aissue+user%3Atechnicalguru+label%3Agit
[search-mailserver-label-blocked]: https://github.com/search?q=is%3Aopen+is%3Aissue+user%3Atechnicalguru+label%3Ablocked
[search-mailserver-label-duplicate]: https://github.com/search?q=is%3Aopen+is%3Aissue+user%3Atechnicalguru+label%3Aduplicate
[search-mailserver-label-wontfix]: https://github.com/search?q=is%3Aopen+is%3Aissue+user%3Atechnicalguru+label%3Awontfix
[search-mailserver-label-invalid]: https://github.com/search?q=is%3Aopen+is%3Aissue+user%3Atechnicalguru+label%3Ainvalid
[search-mailserver-label-package-idea]: https://github.com/search?q=is%3Aopen+is%3Aissue+user%3Atechnicalguru+label%3Apackage-idea
[search-mailserver-label-wrong-repo]: https://github.com/search?q=is%3Aopen+is%3Aissue+user%3Atechnicalguru+label%3Awrong-repo
[search-mailserver-label-editor-rendering]: https://github.com/search?q=is%3Aopen+is%3Aissue+user%3Atechnicalguru+label%3Aeditor-rendering
[search-mailserver-label-build-error]: https://github.com/search?q=is%3Aopen+is%3Aissue+user%3Atechnicalguru+label%3Abuild-error
[search-mailserver-label-error-from-pathwatcher]: https://github.com/search?q=is%3Aopen+is%3Aissue+user%3Atechnicalguru+label%3Aerror-from-pathwatcher
[search-mailserver-label-error-from-save]: https://github.com/search?q=is%3Aopen+is%3Aissue+user%3Atechnicalguru+label%3Aerror-from-save
[search-mailserver-label-error-from-open]: https://github.com/search?q=is%3Aopen+is%3Aissue+user%3Atechnicalguru+label%3Aerror-from-open
[search-mailserver-label-installer]: https://github.com/search?q=is%3Aopen+is%3Aissue+user%3Atechnicalguru+label%3Ainstaller
[search-mailserver-label-auto-updater]: https://github.com/search?q=is%3Aopen+is%3Aissue+user%3Atechnicalguru+label%3Aauto-updater
[search-mailserver-label-deprecation-help]: https://github.com/search?q=is%3Aopen+is%3Aissue+user%3Atechnicalguru+label%3Adeprecation-help
[search-mailserver-label-electron]: https://github.com/search?q=is%3Aopen+is%3Aissue+user%3Atechnicalguru+label%3Aelectron
[search-mailserver-label-work-in-progress]: https://github.com/search?q=is%3Aopen+is%3Apr+user%3Atechnicalguru+label%3Awork-in-progress
[search-mailserver-label-needs-review]: https://github.com/search?q=is%3Aopen+is%3Apr+user%3Atechnicalguru+label%3Aneeds-review
[search-mailserver-label-under-review]: https://github.com/search?q=is%3Aopen+is%3Apr+user%3Atechnicalguru+label%3Aunder-review
[search-mailserver-label-requires-changes]: https://github.com/search?q=is%3Aopen+is%3Apr+user%3Atechnicalguru+label%3Arequires-changes
[search-mailserver-label-needs-testing]: https://github.com/search?q=is%3Aopen+is%3Apr+user%3Atechnicalguru+label%3Aneeds-testing

[beginner]:https://github.com/search?utf8=%E2%9C%93&q=is%3Aopen+is%3Aissue+label%3Abeginner+label%3Ahelp-wanted+user%3Atechnicalguru+sort%3Acomments-desc
[help-wanted]:https://github.com/search?q=is%3Aopen+is%3Aissue+label%3Ahelp-wanted+user%3Atechnicalguru+sort%3Acomments-desc+-label%3Abeginner

