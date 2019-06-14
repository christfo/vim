#!/usr/bin/env bash
GROOT=$(git rev-parse --show-toplevel)
export CMDFILE=${1:-"$GROOT/cmd.out"}
script -f "$CMDFILE"  -c 'bash --init-file <(echo ". \"$HOME/.bashrc\"; source \"$HOME/bin/singleshot.sh\"; ")'


