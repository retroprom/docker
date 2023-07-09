#!/bin/bash

set -e

docker build . -f Dockerfile -t retroprom/its-klh10:latest "$@"

