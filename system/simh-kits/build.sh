#!/bin/bash

set -e

if ! [ -d download ]; then
    ./download.sh
fi

./extract.sh

docker build build/id32-unix-v6 -f Dockerfile -t retroprom/simh-kit-id32-unix-v6 --build-arg SIMULATOR=id32
docker build build/id32-unix-v7 -f Dockerfile -t retroprom/simh-kit-id32-unix-v7 --build-arg SIMULATOR=id32
docker build build/pdp11-rsts-v7 -f Dockerfile -t retroprom/simh-kit-pdp11-rsts-v7 "$@"
docker build build/pdp11-rt11-v4 -f Dockerfile -t retroprom/simh-kit-pdp11-rt11-v4 "$@"
docker build build/pdp11-rt11-v5 -f Dockerfile -t retroprom/simh-kit-pdp11-rt11-v5 "$@"
docker build build/pdp11-unix-v5 -f Dockerfile -t retroprom/simh-kit-pdp11-unix-v5 "$@"
docker build build/pdp11-unix-v6 -f Dockerfile -t retroprom/simh-kit-pdp11-unix-v6 "$@"
docker build build/pdp11-unix-v7 -f Dockerfile -t retroprom/simh-kit-pdp11-unix-v7 "$@"

# remove old images (for rename)
for n in id32-unix-v6 id32-unix-v7 pdp11-rsts-v7 pdp11-rt11-v4 pdp11-rt11-v5 pdp11-unix-v5 pdp11-unix-v6 pdp11-unix-v7; do
    docker image rm -f "retroprom/simh-$n:latest"
done

