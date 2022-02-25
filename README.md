# Laravel Echo Server docker
 
Laravel echo server docker image based on nodejs 17 and alpine linux 

## GitHub
https://github.com/imifarago/docker-laravel-echo-server 

## For :whispers version we use this version of the echo server:
https://github.com/tthdvd/laravel-echo-server 

# DockerHub
https://hub.docker.com/r/imifarago/laravel-echo-server 

## Port
Listens on 6001. 

## Config
Mount `laravel-echo-server.json` file as bind volume to `/app/laravel-echo-server.json`. But do not use different port than 6001 because of health check! 
Or set environment variables: 

### .env parameters

* `ECHO_AUTH_HOST` Laravel URL (http://localhost)
* `ECHO_AUTH_ENDPOINT` Laravel Auth endpoint path /api/broadcasting/auth
* `ECHO_APP_ID` random generated app id, it generates when not set
* `ECHO_APP_KEY` random generated app key, it generates when not set
* `ECHO_DATABASE` redis or sqlite
* `ECHO_REDIS_HOST` redis hostname or ip address
* `ECHO_REDIS_PORT` default 6379
* `ECHO_REDIS_KEYPREFIX` redis key prefix, use underscore after, for example: my_app_database_
* `ECHO_REDIS_OPTS_DB` database number in redis to use, default 0
* `ECHO_DEV_MODE` default false
* `ECHO_HOST` default null
* `ECHO_PROTOCOL` default http
* `ECHO_SUBSCRIBER_HTTP` default true
* `ECHO_SUBSCRIBER_REDIS` default true
* `ECHO_API_ORIGIN_CORS` default false
* `ECHO_API_ORIGIN_ALLOW` default empty string
* `ECHO_API_ORIGIN_METHODS` default empty string
* `ECHO_API_ORIGIN_HEADERS` default empty string

## Run
`docker run --env-file <env> imifarago/laravel-echo-server:latest` 
`docker run --env-file <env> imifarago/laravel-echo-server:whispers` 
 
Or instead of `--env-file` mount `laravel-echo-server.json` into `/app/laravel-echo-server.json` 
