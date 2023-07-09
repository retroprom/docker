#!/bin/bash

set -e

docker build . -f Dockerfile -t retroprom/klh10-its:latest "$@"

