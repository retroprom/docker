#!/bin/bash

set -e

docker build . -f Dockerfile \
	-t retroprom/klh10-its:latest \
	--build-arg ITS_TARGET=klh10 \
	"$@"

docker build . -f Dockerfile \
	-t retroprom/simh-its:latest \
	--build-arg ITS_TARGET=simh \
	"$@"

