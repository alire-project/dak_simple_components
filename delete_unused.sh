#!/bin/bash

[ "$1" != "" ] || { echo Give gpr file; exit 1; }

{ 
  ls 
  cat $1 | grep -E '.*ad(s|b)' | sed 's/"//g; s/,//; s/(//; s/[[:space:]]//g' | sort -u 
} | sort | uniq -u | parallel -j1 '[ -f {} ] && git rm {}'
