#!/bin/bash

set -e

get() {
  wget -c -O download/$1 http://simh.trailing-edge.com/kits/$1
}

mkdir -p download

get iu6swre.zip
get iu7swre.zip
get rstsv7gen.tar.Z
get rstsv7swre.tar.Z
get rt11swre.tar.Z
get rtv53swre.tar.Z
get uv5swre.zip
get uv6swre.zip
get uv7swre.zip

sha256sum -c SHA256SUMS

