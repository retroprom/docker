#!/bin/bash

time docker build \
	images/ios-1700 \
	-f Dockerfile \
	-t retroprom/cisco-1720:latest \
	--build-arg OPTIONS="-P 1700 -t 1720" \
	--build-arg IMAGE="c1700-k9o3sy7-mz.123-23.bin" \
	"$@"

time docker build \
    images/ios-2600 \
    -f Dockerfile \
    -t retroprom/cisco-2610:latest \
    --build-arg OPTIONS="-P 2600 -t 2610 -r 64" \
    --build-arg IMAGE="c2600-ik9o3s3-mz.123-23.bin" \
    "$@"

time docker build \
    images/ios-2600 \
    -f Dockerfile \
    -t retroprom/cisco-2611:latest \
    --build-arg OPTIONS="-P 2600 -t 2611 -r 64" \
    --build-arg IMAGE="c2600-ik9o3s3-mz.123-23.bin" \
    "$@"

time docker build \
    images/ios-2600 \
    -f Dockerfile \
    -t retroprom/cisco-2620:latest \
    --build-arg OPTIONS="-P 2600 -t 2620 -r 64" \
    --build-arg IMAGE="c2600-ik9o3s3-mz.123-23.bin" \
    "$@"

time docker build \
    images/ios-2600 \
    -f Dockerfile \
    -t retroprom/cisco-2621:latest \
    --build-arg OPTIONS="-P 2600 -t 2621 -r 64" \
    --build-arg IMAGE="c2600-ik9o3s3-mz.123-23.bin" \
    "$@"

time docker build \
    images/ios-2600xm \
    -f Dockerfile \
    -t retroprom/cisco-2610xm:latest \
    --build-arg OPTIONS="-P 2600 -t 2610xm -r 128" \
    --build-arg IMAGE="c2600-adventerprisek9-mz.124-17.bin" \
    "$@"

time docker build \
    images/ios-2600xm \
    -f Dockerfile \
    -t retroprom/cisco-2620xm:latest \
    --build-arg OPTIONS="-P 2600 -t 2620xm -r 128" \
    --build-arg IMAGE="c2600-adventerprisek9-mz.124-17.bin" \
    "$@"

time docker build \
    images/ios-2600xm \
    -f Dockerfile \
    -t retroprom/cisco-2650xm:latest \
    --build-arg OPTIONS="-P 2600 -t 2650xm -r 128" \
    --build-arg IMAGE="c2600-adventerprisek9-mz.124-17.bin" \
    "$@"
    
time docker build \
    images/ios-2691 \
    -f Dockerfile \
    -t retroprom/cisco-2691:latest \
    --build-arg OPTIONS="-P 2691 -r 128" \
    --build-arg IMAGE="c2691-adventerprisek9_sna-mz.124-13b.bin" \
    "$@"

time docker build \
    images/ios-3620 \
    -f Dockerfile \
    -t retroprom/cisco-3620:latest \
    --build-arg OPTIONS="-P 3600 -t 3620 -r 64" \
    --build-arg IMAGE="c3620-ik9s-mz.122-40a.bin" \
    "$@"

time docker build \
	images/ios-3640 \
	-f Dockerfile \
	-t retroprom/cisco-3640:latest \
	--build-arg OPTIONS="-P 3600 -t 3640 -r 128" \
	--build-arg IMAGE="c3640-jk9s-mz.124-16.bin" \
	"$@"

time docker build \
	images/ios-3660 \
	-f Dockerfile \
	-t retroprom/cisco-3660:latest \
	--build-arg OPTIONS="-P 3600 -t 3660 -r 128" \
	--build-arg IMAGE="c3660-ik9o3s-mz.124-13b.bin" \
	"$@"

time docker build \
    images/ios-7200 \
    -f Dockerfile \
    -t retroprom/cisco-7200-100:latest \
    --build-arg OPTIONS="-P 7200 -t npe-100 -r 128" \
    --build-arg IMAGE="c7200-jk9s-mz.124-13b.bin" \
    "$@"

time docker build \
    images/ios-7200 \
    -f Dockerfile \
    -t retroprom/cisco-7200-150:latest \
    --build-arg OPTIONS="-P 7200 -t npe-150 -r 128" \
    --build-arg IMAGE="c7200-jk9s-mz.124-13b.bin" \
    "$@"

time docker build \
    images/ios-7200 \
    -f Dockerfile \
    -t retroprom/cisco-7200-175:latest \
    --build-arg OPTIONS="-P 7200 -t npe-175 -r 128" \
    --build-arg IMAGE="c7200-jk9s-mz.124-13b.bin" \
    "$@"

time docker build \
    images/ios-7200 \
    -f Dockerfile \
    -t retroprom/cisco-7200-200:latest \
    --build-arg OPTIONS="-P 7200 -t npe-200 -r 128" \
    --build-arg IMAGE="c7200-jk9s-mz.124-13b.bin" \
    "$@"

time docker build \
    images/ios-7200 \
    -f Dockerfile \
    -t retroprom/cisco-7200-225:latest \
    --build-arg OPTIONS="-P 7200 -t npe-225 -r 128" \
    --build-arg IMAGE="c7200-jk9s-mz.124-13b.bin" \
    "$@"

time docker build \
    images/ios-7200 \
    -f Dockerfile \
    -t retroprom/cisco-7200-300:latest \
    --build-arg OPTIONS="-P 7200 -t npe-300 -r 128" \
    --build-arg IMAGE="c7200-jk9s-mz.124-13b.bin" \
    "$@"

time docker build \
	images/ios-7200 \
	-f Dockerfile \
	-t retroprom/cisco-7200-400:latest \
	--build-arg OPTIONS="-P 7200 -t npe-400 -r 128" \
	--build-arg IMAGE="c7200-jk9s-mz.124-13b.bin" \
	"$@"

