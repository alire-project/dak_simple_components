#!/bin/bash

[ "$1" != "" ] || { echo Give gpr file; exit 1; }

cat $1 | grep -E '.*ad(s|b)' | sed -E 's/.*"(.+)".*/\1/' | sort -u
