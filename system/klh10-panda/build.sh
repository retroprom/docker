#!/bin/bash

set -e

docker build panda-dist -f Dockerfile -t retroprom/klh10-panda "$@"

