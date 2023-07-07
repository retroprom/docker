#!/bin/bash
set -e
# Defaults
if [ -z "${HERCULES_CONFIG}" ]; then HERCULES_CONFIG="hercules.ini"; fi
if [ -z "${HERCULES_SCRIPT}" ]; then HERCULES_SCRIPT="hercules.rc";  fi
if [ -z "${HERCULES_LOG}"    ]; then HERCULES_LOG="hercules.log"; fi
# Execute
exec hercules -f "${HERCULES_CONFIG}" -r "${HERCULES_SCRIPT}" > "${HERCULES_LOG}"
