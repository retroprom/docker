#!/bin/bash

set -e

if ! [ -d download ]; then
    ./download.sh
fi

./extract.sh

if [ -d build/dosvs-5pack ]; then
  docker build build/dosvs-5pack -f Dockerfile -t retroprom/hercules-dosvs-5pack:latest "$@"
fi
if [ -d build/mvs-tk3 ]; then
  docker build build/mvs-tk3 -f Dockerfile -t retroprom/hercules-mvs-tk3:latest "$@"
fi
if [ -d build/mvs-tk4 ]; then
  docker build build/mvs-tk4 -f Dockerfile -t retroprom/hercules-mvs-tk4:latest "$@"
fi
if [ -d build/vm370-ce-v1-r1.1 ]; then
  docker build build/vm370-ce-v1-r1.1 -f Dockerfile -t retroprom/hercules-vm370-ce:v1-r1.1 "$@"
  docker tag retroprom/hercules-vm370-ce:v1-r1.1 retroprom/hercules-vm370-ce:latest
fi
if [ -d build/vm370-ce-v1-r1.2 ]; then
  docker build build/vm370-ce-v1-r1.2 -f Dockerfile -t retroprom/hercules-vm370-ce:v1-r1.2 "$@"
  docker tag retroprom/hercules-vm370-ce:v1-r1.2 retroprom/hercules-vm370-ce:latest
fi
