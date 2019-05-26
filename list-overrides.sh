#!/bin/sh -e

if [ "$1" = "-bare" ]; then
  find packages -type d -exec basename {} \; -mindepth 2 -maxdepth 2 | awk -F '.' '{print $1}'
else
  find packages -type d -exec basename {} \; -mindepth 2 -maxdepth 2
fi
