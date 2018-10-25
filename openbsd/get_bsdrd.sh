#!/bin/sh -x
# get just bsd.rd for upgrade. assumes "upgrade/" is in $HOME

#set -e

dir="${dir:-$HOME/upgrade}"
arch="${arch:-`uname -m`}"
dotver="${ver:-`uname -r`}"
# if `uname -r` isn't current snap, use second $ver
ver="${ver:-`uname -r | tr -d "."`}"
#ver="${ver:-64}"
mirror="${mirror:-https://cdn.openbsd.org/pub/OpenBSD/snapshots}"
sets="${sets:-{BUILDINFO,bsd.rd,SHA256.sig}}"

yell() { echo "$0: $*" >&2; }
die() { yell "$*"; exit 111; }
try() { "$@" || die "cannot $*"; }

try cd $dir;

try /usr/bin/ftp -ai $mirror/$arch/$sets;

/usr/bin/signify -C -p /etc/signify/openbsd-$ver-base.pub -x $dir/SHA256.sig $dir/bsd.rd;

try cp $dir/bsd.rd /;

cat $dir/BUILDINFO;

echo "now boot off of bsd.rd and start the upgrade"
