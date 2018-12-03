#!/usr/bin/env bash

DIR=$(dirname $BASH_SOURCE)
# Remove existing conda, if any, and pre-pend this conda
export PATH="$DIR/anaconda3/bin:$(echo $PATH | tr ':' '\n' | grep -v conda | tr '\n' ':')"
# Run the given arguments
"$@"
