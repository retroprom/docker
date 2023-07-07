#!/bin/bash
set -e
"$@"
tmux kill-session -t "${TMUX_SESSION}"
