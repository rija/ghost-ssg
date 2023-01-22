# Ghost-ssg

A docker based pipeline to publish the content of a local Ghost 4 server as static pages.

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

```
$ docker-compose build export publish
$ docker-compose up -d editor preview
$ docker-compose run --rm export
$ docker-compose run --rm publish
```