#!/bin/sh -ex

OPAM_REPO=$1

if [ ! -d "$OPAM_REPO" ]; then
  echo Usage: $0 opam-repo-dir
  exit 1
fi

git -C $OPAM_REPO checkout master
git -C $OPAM_REPO pull upstream master
git -C $OPAM_REPO checkout -B duniverse
git -C $OPAM_REPO pull upstream master
rsync -av packages/ $OPAM_REPO/packages/
git -C $OPAM_REPO add packages/
git -C $OPAM_REPO commit -a -m "sync to dune-universe/opam-overlays@`git rev-parse HEAD`"
git -C $OPAM_REPO push origin +duniverse

