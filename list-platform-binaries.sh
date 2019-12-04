#!/bin/sh -e

case $1 in
-targets)
  echo duniverse/ocamlformat/bin/ocamlformat.exe duniverse/dune-release/bin/main.exe
  ;;
-packages)
  echo ocamlformat dune-release
  ;;
*)
  echo unknown option
  exit 1
esac
