#!/bin/sh -x
# deinstall all mystuff/ ports

for dir in /usr/ports/mystuff/*/*; do (cd "$dir" && make deinstall clean); done

true
