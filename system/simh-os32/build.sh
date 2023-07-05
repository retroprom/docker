#!/bin/bash

set -e

docker build build/os32-v1.1 -f Dockerfile.release -t retroprom/simh-id32-os32:v1.1 "$@"
docker tag retroprom/simh-id32-os32:v1.1 retroprom/simh-id32-os32:latest

