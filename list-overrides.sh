#!/bin/sh -e

if [ "$1" = "-bare" ]; then
  find packages -type d -exec basename {} \; -mindepth 2 -maxdepth 2 | awk -F '.' '{print $1}' | sort | uniq
elif [ "$1" = "-distinct" ]; then 
  find packages -type d -exec basename {} \; -mindepth 2 -maxdepth 2 | sort -r | awk -F '.' '{ st = index($0,".");print substr($0,st+1) " " $1}' | uniq -f 1 | awk -F ' ' '{print $2 "." $1}' | sort
else
  find packages -type d -exec basename {} \; -mindepth 2 -maxdepth 2 | sort
fi
