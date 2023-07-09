#!/bin/bash

set -e

get() {
  mkdir -p "download/$1"
  wget -c -O "download/$1/$2" "https://github.com/davygoat/simh-os32/releases/download/$1/$2"
}

mkdir -p download

get v1.1 os32doc.zip
get v1.1 os32kit.zip

sha256sum -c SHA256SUMS

