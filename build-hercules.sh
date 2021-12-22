#!/bin/bash

#time docker build . \
#	-f Dockerfile.hercules-alpine \
#	-t 'retro-hercules:alpine' \
#	 --network host \
#	"$@"

time docker build . \
	-f Dockerfile.hercules-debian \
	-t 'retro-hercules:debian' \
	--network host \
	"$@"
