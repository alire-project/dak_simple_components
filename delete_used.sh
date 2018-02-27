#!/bin/bash

[ "$1" != "" ] || { echo Give gpr file; exit 1; }

cat $1 | grep -E '.*ad(s|b)' | sed 's/"//g; s/,//; s/(//; s/[[:space:]]//g' | sort -u | parallel -j1 '[ -f {} ] && git rm {}'
