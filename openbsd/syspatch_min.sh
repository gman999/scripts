#!/bin/sh -x
# for small /var, replace syspatch/*/rollback.tgz with empty file
# prevents from reapplying already applied patches

verbose=1
dryrun=1

SCRIPT="`basename $0`"

echo $SCRIPT;

for dir in /var/syspatch/*; do (cd "$dir" && rm rollback.tgz && touch rollback.tgz); done

true
