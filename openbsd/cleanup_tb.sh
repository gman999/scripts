#!/bin/sh -x
# clean removal of Tor Browser

ver="${ver:-7.0.4}"

#set -e

yell() { echo "$0: $*" >&2; }
die() { yell "$*"; exit 111; }
try() { "$@" || die "cannot $*"; }

echo "Removing Tor Browser $ver";

rm -rf $HOME/TorBrowser-Data;

rm -rfP /usr/local/lib/tor-browser-$ver;

pkg_delete -I tb-browser-$ver;

pkg_delete -I tor-browser-$ver;

pkg_delete -I tb-https-everywhere;

pkg_delete -I tb-noscript;

pkg_delete -I tor-launcher;

pkg_delete -I torbutton;

echo "Any TB packages left?" && pkg_info | grep -E 'tor-browser|torbutton|https-everywhere|noscript|tor-launcher'

echo "Tor Browser $ver was removed"

true
