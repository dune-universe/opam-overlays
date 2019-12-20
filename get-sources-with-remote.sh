#!/bin/sh

opam repo set-url default git://github.com/dune-universe/opam-repository#duniverse
opam update

for pkg in `./list-overrides.sh`; do
  opam source $pkg --dir="sources/$pkg"
done
