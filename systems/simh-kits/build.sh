#!/bin/bash

set -e

if ! [ -d download ]; then
    ./download.sh
fi

./extract.sh

docker build build/id32-unix-v6 -f Dockerfile -t retroprom/simh-id32-unix-v6 --build-arg SIMULATOR=id32 "$@"
docker build build/id32-unix-v7 -f Dockerfile -t retroprom/simh-id32-unix-v7 --build-arg SIMULATOR=id32 "$@"
docker build build/pdp8-dms -f Dockerfile -t retroprom/simh-pdp8-dms --build-arg SIMULATOR=pdp8 "$@"
docker build build/pdp8-focal -f Dockerfile -t retroprom/simh-pdp8-focal --build-arg SIMULATOR=pdp8 "$@"
docker build build/pdp8-os8 -f Dockerfile -t retroprom/simh-pdp8-os8 --build-arg SIMULATOR=pdp8 "$@"
docker build build/pdp8-tss8 -f Dockerfile -t retroprom/simh-pdp8-tss8 --build-arg SIMULATOR=pdp8 "$@"
docker build build/pdp11-rsts-v7 -f Dockerfile -t retroprom/simh-pdp11-rsts-v7 "$@"
docker build build/pdp11-rt11-v4 -f Dockerfile -t retroprom/simh-pdp11-rt11-v4 "$@"
docker build build/pdp11-rt11-v5 -f Dockerfile -t retroprom/simh-pdp11-rt11-v5 "$@"
docker build build/pdp11-unix-v5 -f Dockerfile -t retroprom/simh-pdp11-unix-v5 "$@"
docker build build/pdp11-unix-v6 -f Dockerfile -t retroprom/simh-pdp11-unix-v6 "$@"
docker build build/pdp11-unix-v7 -f Dockerfile -t retroprom/simh-pdp11-unix-v7 "$@"

