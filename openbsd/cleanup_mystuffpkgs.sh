#!/bin/sh -x
# remove pkgs installed from mystuff/

verbose=1
dryrun=1

SCRIPT="`basename $0`"

echo $SCRIPT;

for dir in /usr/ports/mystuff/*/*; do (cd "$dir" && make deinstall clean); done

true
