#!/bin/sh

set -e

wget -c -O panda-dist.tar.gz http://panda.trailing-edge.com/panda-dist.tar.gz

sha256sum --check SHA256SUMS

