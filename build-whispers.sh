#!/bin/bash

docker build -t imifarago/laravel-echo-server:whispers -f Dockerfile-whispers .
docker push imifarago/laravel-echo-server:whispers
