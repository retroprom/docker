#!/bin/bash

#time docker build . \
#	-f Dockerfile.dynamips-alpine \
#	-t 'retro-dynamips:alpine' \
#	 --network host \
#	"$@"

time docker build . \
	-f Dockerfile.dynamips-debian \
	-t 'retro-dynamips:debian' \
	--network host \
	"$@"

