#!/usr/bin/env bash

DIR=$(readlink -f $(dirname $BASH_SOURCE))
# Remove existing conda, if any, and pre-pend this conda
export PATH="$DIR/anaconda3/bin:$(echo $PATH | tr ':' '\n' | grep -v conda | tr '\n' ':')"
# No matter what I try (env variables, overriding files, etc.) conda still
# wants to load things like channels from ~/.condarc.  This prevents conda from
# looking elsewhere, though.
export HOME="$DIR"
export TMPDIR="$DIR/tmp"
mkdir -p "$TMPDIR"
# Run the given arguments
if (( $# != 0 )); then
	"$@"
fi
