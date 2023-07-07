#!/bin/bash
set -e
echo "\nWAITING FOR SIMULATOR\n"
tmux wait-for "sim-ready"
clear
exec "$@"
