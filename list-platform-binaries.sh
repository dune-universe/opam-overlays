#!/bin/sh -e

case $1 in
-targets)
  echo duniverse/ocamlformat/src/ocamlformat.exe duniverse/duniverse/bin/duniverse.exe duniverse/dune-release/bin/main.exe
  ;;
-packages)
  echo ocamlformat duniverse dune-release
  ;;
*)
  echo unknown option
  exit 1
esac
