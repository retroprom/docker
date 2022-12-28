#!/bin/bash

set -e

docker build pdp11-rsts-v7 -f Dockerfile -t retroprom/simh-pdp11-rsts-v7 "$@"
docker build pdp11-rt11-v4 -f Dockerfile -t retroprom/simh-pdp11-rt11-v4 "$@"
docker build pdp11-rt11-v5 -f Dockerfile -t retroprom/simh-pdp11-rt11-v5 "$@"
docker build pdp11-unix-v5 -f Dockerfile -t retroprom/simh-pdp11-unix-v5 "$@"
docker build pdp11-unix-v6 -f Dockerfile -t retroprom/simh-pdp11-unix-v6 "$@"
docker build pdp11-unix-v7 -f Dockerfile -t retroprom/simh-pdp11-unix-v7 "$@"
