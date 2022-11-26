#!/bin/bash

time docker build \
	images/ios-1700 \
	-f Dockerfile \
	-t retroprom/cisco-1720:latest \
	--build-arg OPTIONS="-P 1700 -t 1720" \
	--build-arg IMAGE="c1700-k9o3sy7-mz.123-23.bin" \
	"$@"
    
time docker build \
    images/ios-2691 \
    -f Dockerfile \
    -t retroprom/cisco-2691:latest \
    --build-arg OPTIONS="-P 2691" \
    --build-arg IMAGE="c2691-adventerprisek9_sna-mz.124-13b.bin" \
    "$@"

time docker build \
    images/ios-3620 \
    -f Dockerfile \
    -t retroprom/cisco-3620:latest \
    --build-arg OPTIONS="-P 3600 -t 3620" \
    --build-arg IMAGE="c3620-ik9s-mz.122-40a.bin" \
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

time docker build \
	images/ios-7200 \
	-f Dockerfile \
	-t retroprom/cisco-7200:latest \
	--build-arg OPTIONS="-P 7200" \
	--build-arg IMAGE="c7200-jk9s-mz.124-13b.bin" \
	"$@"

