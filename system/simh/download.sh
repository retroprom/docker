#!/bin/sh

set -e

wget -c -O unix-v5/uv5swre.zip http://simh.trailing-edge.com/kits/uv5swre.zip
wget -c -O unix-v6/uv6swre.zip http://simh.trailing-edge.com/kits/uv6swre.zip
wget -c -O unix-v7/uv7swre.zip http://simh.trailing-edge.com/kits/uv7swre.zip

sha256sum -c SHA256SUMS

