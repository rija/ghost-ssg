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

## Usage

1. First, create an ``.env`` file in the project directory, in which you give a value to the ``REMOTE_URL`` variable:

```
$ cp env-sample .env
```
Then edit .env file to assign a value to ``REMOTE_URL``

2. Start the two servers (the blog editor and the preview server)

```
$ docker-compose build export publish
$ docker-compose up -d editor preview
```
Ghost is now available at http://localhost:2368

3. Export the content of Ghost as static file for preview

```
$ docker-compose run --rm export
```

A preview of the static website can be viewed at http://localhost:9999

4. Export the content of Ghost as static files for publishing

```
$ docker-compose run --rm publish
```

The static pages are in the ``site`` directory ready to be published to your remote web site
