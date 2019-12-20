#!/bin/sh -e

case $1 in
-targets)
  echo duniverse/ocamlformat.0.12/src/ocamlformat.exe duniverse/dune-release.1.3.3/bin/main.exe
  ;;
-packages)
  echo ocamlformat dune-release
  ;;
*)
  echo unknown option
  exit 1
esac
