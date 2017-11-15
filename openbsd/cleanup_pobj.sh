#!/bin/sh -x
# cleanup mess in /usr/ports/pobj correctly

verbose=1
dryrun=1

SCRIPT="`basename $0`"

echo $SCRIPT;

for dir in /usr/ports/mystuff/*/*; do (cd "$dir" && make clean=all); done

true
