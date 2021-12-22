#!/bin/bash

#time docker build . \
#	-f Dockerfile.hyperion-alpine \
#	-t 'retro-hyperion:alpine' \
#	 --network host \
#	"$@"

time docker build . \
	-f Dockerfile.hyperion-debian \
	-t 'retro-hyperion:debian' \
	--network host \
	"$@"

