#!/bin/sh -ex
 
docker run -it -v `pwd`/sources:/scripts/sources -v `pwd`:/scripts ocaml/opam2 bash -c "cd /scripts && ./get-sources-with-remote.sh"
