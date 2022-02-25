#!/bin/bash

docker build -t imifarago/laravel-echo-server:latest .
docker push imifarago/laravel-echo-server:latest
