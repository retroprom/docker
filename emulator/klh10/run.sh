#!/bin/bash
set -e
# Determine name of executable
export KLH10_BINARY="./kn10-${KLH10_VARIANT}"
# Copy executables
if [ ! -f "${KLH10_BINARY}" ]; then
    cp /opt/klh10-${KLH10_VARIANT}/bin/* .
fi
# Execute the emulator
exec "${KLH10_BINARY}" ${KLH10_OPTIONS} "${KLH10_STARTUP}"
