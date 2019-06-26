#!/bin/sh -e

case $1 in
-targets)
  echo duniverse/ocamlformat/src/ocamlformat.exe duniverse/duniverse/bin/duniverse.exe
  ;;
-packages)
  echo ocamlformat duniverse
  ;;
*)
  echo unknown option
  exit 1
esac
