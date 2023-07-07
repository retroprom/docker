#!/usr/bin/env bash
set -e
# Defaults
if [ -z "${SIMH_SIMULATOR}" ]; then SIMH_SIMULATOR=pdp11; fi
# Execute
exec "${SIMH_SIMULATOR}" "${@}"
