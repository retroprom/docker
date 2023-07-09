#!/bin/bash

set -e

./extract.sh

docker build panda-dist -f Dockerfile -t retroprom/klh10-panda "$@"

