#!/usr/bin/env bash
set -e
if [ -z "${SIMH_SIMULATOR}" ]; then SIMH_SIMULATOR=pdp11; fi
exec "${SIMH_SIMULATOR}" "${@}"
