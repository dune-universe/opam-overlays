Test that opam-monorepo can generate a lockfile Real World OCaml.
We're not building it because it's not ported to OCaml 5 yet.

  $ if [ ! -d book/ ]; then git clone https://github.com/realworldocaml/book.git > /dev/null 2>&1; fi
  $ rm ../../../.git
  $ cd book && opam-monorepo lock --opam-repositories='[file://$OPAM_MONOREPO_CWD/../../opam-repository,file://$OPAM_MONOREPO_CWD/../../opam-overlays]' > /dev/null
  $ opam-monorepo pull > /dev/null 2>&1
