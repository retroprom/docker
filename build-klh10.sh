#!/bin/bash

#time docker build . \
#	-f Dockerfile.klh10-alpine \
#	-t 'retro-klh10:alpine' \
#	 --network host \
#	"$@"

time docker build . \
	-f Dockerfile.klh10-debian \
	-t 'retro-klh10:debian' \
	--network host \
	"$@"

