#!/bin/bash

set -e

docker build build/os32-v1.1 -f Dockerfile.release -t retroprom/simh-os32:v1.1 "$@"
docker tag retroprom/simh-os32:v1.1 retroprom/simh-os32:latest

