#!/bin/bash

time docker build \
	images/ios-7200 \
	-f Dockerfile \
	-t retroprom/cisco-7200:latest \
	--build-arg OPTIONS="-P 7200" \
	--build-arg IMAGE="c7200-jk9s-mz.124-13b.bin" \
	"$@"

time docker build \
	images/ios-3640 \
	-f Dockerfile \
	-t retroprom/cisco-3640:latest \
	--build-arg OPTIONS="-P 3600 -t 3640" \
	--build-arg IMAGE="c3640-jk9s-mz.124-16.bin" \
	"$@"

time docker build \
	images/ios-3660 \
	-f Dockerfile \
	-t retroprom/cisco-3660:latest \
	--build-arg OPTIONS="-P 3600 -t 3660" \
	--build-arg IMAGE="c3660-ik9o3s-mz.124-13b.bin" \
	"$@"

