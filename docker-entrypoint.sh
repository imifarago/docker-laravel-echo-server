#!/bin/sh
set -e

# laravel-echo-server init
if [[ "$1" == 'init' ]]; then
    set -- laravel-echo-server "$@"
fi

# laravel-echo-server <command>
if [[ "$1" == 'start' ]] || [[ "$1" == 'client:add' ]] || [[ "$1" == 'client:remove' ]]; then
    APP_KEY=`tr -dc A-Za-z0-9 </dev/urandom | head -c 32 ; echo ''`
    APP_ID=`tr -dc A-Za-z0-9 </dev/urandom | head -c 16 ; echo ''`

    echo -e "Random generated app id & key. Ignore if you set in .env manually:\n"
    echo -e "App KEY: $APP_KEY\n"
    echo -e "App ID: $APP_ID\n"
    echo -e "\n\n"

    sed -i \
        -e "s|#PLACEHOLDER_AUTH_HOST#|${ECHO_AUTH_HOST:-http://localhost}|i" \
        -e "s|#PLACEHOLDER_AUTH_ENDPOINT#|${ECHO_AUTH_ENDPOINT:-/api/broadcasting/auth}|i" \
        -e "s|#PLACEHOLDER_APP_ID#|${ECHO_APP_ID:-$APP_ID}|i" \
        -e "s|#PLACEHOLDER_APP_KEY#|${ECHO_APP_KEY:-$APP_KEY}|i" \
        -e "s|#PLACEHOLDER_DATABASE#|${ECHO_DATABASE:-redis}|i" \
        -e "s|#PLACEHOLDER_REDIS_HOST#|${ECHO_REDIS_HOST:-redis}|i" \
        -e "s|#PLACEHOLDER_REDIS_PORT#|${ECHO_REDIS_PORT:-6379}|i" \
        -e "s|#PLACEHOLDER_REDIS_KEYPREFIX#|${ECHO_REDIS_KEYPREFIX:-redis_database_}|i" \
        -e "s|#PLACEHOLDER_REDIS_OPTS_DB#|${ECHO_REDIS_OPTS_DB:-0}|i" \
        -e "s|#PLACEHOLDER_DEV_MODE#|${ECHO_DEV_MODE:-false}|i" \
        -e "s|#PLACEHOLDER_HOST#|${ECHO_HOST:-null}|i" \
        -e "s|#PLACEHOLDER_PORT#|${ECHO_PORT:-6001}|i" \
        -e "s|#PLACEHOLDER_PROTOCOL#|${ECHO_PROTOCOL:-http}|i" \
        -e "s|#PLACEHOLDER_SUBSCRIBERS_HTTP#|${ECHO_SUBSCRIBER_HTTP:-true}|i" \
        -e "s|#PLACEHOLDER_SUBSCRIBERS_REDIS#|${ECHO_SUBSCRIBER_REDIS:-true}|i" \
        -e "s|#PLACEHOLDER_API_ORIGIN_CORS#|${ECHO_API_ORIGIN_CORS:-false}|i" \
        -e "s|#PLACEHOLDER_API_ORIGIN_ALLOW#|${ECHO_API_ORIGIN_ALLOW:-}|i" \
        -e "s|#PLACEHOLDER_API_ORIGIN_METHODS#|${ECHO_API_ORIGIN_METHODS:-}|i" \
        -e "s|#PLACEHOLDER_API_ORIGIN_HEADERS#|${ECHO_API_ORIGIN_HEADERS:-}|i" \
        /app/laravel-echo-server.json

    set -- laravel-echo-server "$@"
fi

if [[ "${1#-}" != "$1" ]]; then
    set -- laravel-echo-server "$@"
fi

exec "$@"
