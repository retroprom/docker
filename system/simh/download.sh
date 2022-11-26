#!/bin/bash

set -e

mkdir -p download

wget -c -O download/uv5swre.zip http://simh.trailing-edge.com/kits/uv5swre.zip
wget -c -O download/uv6swre.zip http://simh.trailing-edge.com/kits/uv6swre.zip
wget -c -O download/uv7swre.zip http://simh.trailing-edge.com/kits/uv7swre.zip

sha256sum -c SHA256SUMS

pushd unix-v5; unzip -u ../download/uv5swre.zip; popd
pushd unix-v6; unzip -u ../download/uv6swre.zip; popd
pushd unix-v7; unzip -u ../download/uv7swre.zip; popd
