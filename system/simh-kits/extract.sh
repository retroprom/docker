#!/bin/bash

set -e

sha256sum -c SHA256SUMS

pushd id32-unix-v6; unzip -u ../download/iu6swre.zip; popd
pushd id32-unix-v7; unzip -u ../download/iu7swre.zip; popd
pushd pdp11-rsts-v7; tar xfvz ../download/rstsv7gen.tar.Z; tar xfvz ../download/rstsv7swre.tar.Z; popd
pushd pdp11-rt11-v4; tar xfvz ../download/rt11swre.tar.Z; popd
pushd pdp11-rt11-v5; tar xfvz ../download/rtv53swre.tar.Z; popd
pushd pdp11-unix-v5; unzip -u ../download/uv5swre.zip; popd
pushd pdp11-unix-v6; unzip -u ../download/uv6swre.zip; popd
pushd pdp11-unix-v7; unzip -u ../download/uv7swre.zip; popd

