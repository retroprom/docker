#!/bin/bash

#time docker build . \
#	-f Dockerfile.hyperion-alpine \
#	-t 'hyperion:alpine' \
#	 --network host \
#	"$@"

time docker build . \
	-f Dockerfile.hyperion-debian \
	-t 'hyperion:debian' \
	--network host \
	"$@"

