#!/bin/bash

set -e 

docker build unix-v7 -f Dockerfile -t retroprom/unix-v7 "$@"
