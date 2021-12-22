#!/bin/bash

#time docker build . \
#	 --network host \
#	 -f Dockerfile.qemu-alpine \
#	 -t "retro-qemu:alpine" \
#	 "$@"

time docker build . \
	 --network host \
	 -f Dockerfile.qemu-debian \
	 -t "retro-qemu:debian" \
	 "$@"
