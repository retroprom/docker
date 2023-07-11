#!/bin/bash

set -e

docker build . -f Dockerfile \
	-t retroprom/its-klh10:latest \
	--build-arg ITS_TARGET=klh10 \
	"$@"

docker build . -f Dockerfile \
	-t retroprom/its-simh:latest \
	--build-arg ITS_TARGET=simh \
	"$@"

