#!/bin/bash

time docker build . \
     --network host \
     -f Dockerfile.simple-debian \
     -t "retro-basilisk:debian" \
     --build-arg SIMPLE_PKG="basilisk2" \
     "$@"
