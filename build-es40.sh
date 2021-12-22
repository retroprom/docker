#!/bin/bash

#time docker build . \
#	--network host \
#	-f Dockerfile.es40-alpine \
#	-t "retro-es40:alpine" \
#	"$@"

time docker build . \
	--network host \
	-f Dockerfile.es40-debian \
	-t "retro-es40:debian" \
	"$@"
