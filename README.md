# Ghost-ssg

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

You need to have installed on your system already:

* Docker
* bash
* git
* bats-core (optional, for running the test suite) 

## Usage

1. First, create an ``.env`` file in the project directory, in which you give a value to the ``REMOTE_URL`` variable:

```
$ cp env-sample .env
```
Then edit .env file to assign a value to ``REMOTE_URL``

2. Start the two servers (the blog editor and the preview server)

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

5. Shutdown the servers

```
$ ./down
```

## Troubleshooting

* Show what server is up:

```
./whatsup
```

* Inspect the server logs:

```
./log
```

* Show the current versions of the dependencies

```
./versions
```

