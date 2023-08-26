#!/bin/bash

set -e

./extract.sh

# DOS/VS 5-pack
if [ -d build/dosvs-5pk ]; then
  docker build build/dosvs-5pk -f Dockerfile -t retroprom/hercules-dosvs-5pk:latest "$@"
fi

# MVS TK3
if [ -d build/mvs-tk3 ]; then
  docker build build/mvs-tk3 -f Dockerfile -t retroprom/hercules-mvs-tk3:latest "$@"
fi

# MVS TK4
if [ -d build/mvs-tk4 ]; then
  docker build build/mvs-tk4 -f Dockerfile -t retroprom/hercules-mvs-tk4:latest "$@"
fi

# MVS TK5
if [ -d build/mvs-tk5 ]; then
  docker build build/mvs-tk5 -f Dockerfile -t retroprom/hercules-mvs-tk5:latest "$@"
fi

# MVS CE
if [ -d build/mvs-ce-v1.0.6 ]; then
  docker build build/mvs-ce-v1.0.6 -f Dockerfile -t retroprom/hercules-mvs-ce:v1.0.6 "$@"
  docker tag retroprom/hercules-mvs-ce:v1.0.6 retroprom/hercules-mvs-ce:latest
fi

# VM/370 CE
if [ -d build/vm370-ce-v1-r1.1 ]; then
  docker build build/vm370-ce-v1-r1.1 -f Dockerfile -t retroprom/hercules-vm370-ce:v1-r1.1 "$@"
  docker tag retroprom/hercules-vm370-ce:v1-r1.1 retroprom/hercules-vm370-ce:latest
fi
if [ -d build/vm370-ce-v1-r1.2 ]; then
  docker build build/vm370-ce-v1-r1.2 -f Dockerfile -t retroprom/hercules-vm370-ce:v1-r1.2 "$@"
  docker tag retroprom/hercules-vm370-ce:v1-r1.2 retroprom/hercules-vm370-ce:latest
fi
