# Ghost-ssg  									[![tests](https://gitlab.com/gh-rija/ghost-ssg/badges/main/pipeline.svg)](https://gitlab.com/gh-rija/ghost-ssg/-/pipelines)	[![Chat on Matrix](https://matrix.to/img/matrix-badge.svg)](https://matrix.to/#/#ghost-ssg:gitter.im)


A Docker-based pipeline to publish the content of a local Ghost 4 server as static pages.

## How it works

```
┌──────────────────────────────┐                    ┌──────────────────────────────┐                        ┌──────────────────────────────┐                  ┌──────────────────────────────┐
│                              │                    │                              │                        │                              │                  │                              │
│                              │                    │                              │                        │                              │                  │                              │
│                              │    export          │                              │      preview           │                              │   git push       │                              │
│ Post editing and management  ├────────────────────► Static pages on file system  ├────────────────────────►Site served on local web server──────────────────►Site served on GitLab Pages   │
│                              │                    │                              │                        │                              │                  │                              │
│                              │                    │                              │                        │                              │                  │                              │
└──────────────────────────────┘                    └──────────────────────────────┘                        └──────────────────────────────┘                  └──────────────────────────────┘
```

## Prerequisites

1. You need to have installed on your system already:

* Docker
* bash
* git
* bats-core (optional, for running the test suite) 

2. To publish to remote destination, you need to have a git-enabled remote static page hosting setup and configured:

| Host type | Needs done before | More infos |
| -- | -- | -- |
| Bitbucket | have created a new repository on Bitbucket.org| https://support.atlassian.com/bitbucket-cloud/docs/publishing-a-website-on-bitbucket-cloud/ |
| Codeberg | have created a new public repo named "pages" on Codeberg.org | https://docs.codeberg.org/codeberg-pages/ |
| GitHub | have followed instructions in the docs on Github.com | https://docs.github.com/en/pages/quickstart |
| GitLab | have created a new project of type "Pages/Plain HTML" on GitLab.com | https://docs.gitlab.com/ee/user/project/pages/ |

>**Disclaimer:** at time of writing, I have only tested with GitLab.com (it may work on other GitLab-based forges - like framagit.org - , not sure for the other ones)

## Usage

1. Run the setup script:

```
$ ./setup
```
Then edit .env file to assign a value to ``DEST_REPO``, ensure the value for PAGES_REPO_PATH and DEST_BRANCH are correct


2. Start the servers (the blog editor, the preview server and the backup server)

```
$ ./up
```
Ghost is now available at http://localhost:2368

3. Export the content of Ghost as static file for preview

```
$ ./preview
```

A preview of the static website can be viewed at http://localhost:9999

4. Publish the content of Ghost

```
$ ./publish
```

The static web pages are first exported in the ``public`` directory inside the directory defined by the $PAGES_REPO_PATH variable.
Then the changes are commited and pushed to the remote git repository.

7. Backup your installation

```
$ ./backup
```

This will backup the SQL database and the content directory

6. Shutdown the servers

```
$ ./down
```

## Troubleshooting

* Show what server is up:

```
$ ./whatsup
```

* Inspect the server logs:

```
$ ./log
```

* Show the current versions of the dependencies

```
$ ./versions
```

* Run the test suite

```
$ ./test
```

* Restoring from backup

```
$ ./restore
```
