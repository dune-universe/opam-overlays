Test that opam-monorepo can generate a lockfile Real World OCaml.
We're not building it because it's not ported to OCaml 5 yet.

  $ if [ ! -d book/ ]; then git clone https://github.com/realworldocaml/book.git; fi > /dev/null
  $ rm ../../../.git
  $ cd book && opam-monorepo lock --opam-repositories='[file://$OPAM_MONOREPO_CWD/../../opam-repository,file://$OPAM_MONOREPO_CWD/../../opam-overlays]'
  ==> Using 1 locally scanned package as the target.
  ==> Found 169 opam dependencies for the target package.
  ==> Querying opam database for their metadata and Dune compatibility.
  ==> Calculating exact pins for each of them.
  ==> Wrote lockfile with 133 entries to $TESTCASE_ROOT/book/rwo.opam.locked. You can now run opam monorepo pull to fetch their sources.
  $ opam-monorepo pull
  ==> Using lockfile $TESTCASE_ROOT/book/rwo.opam.locked
  Successfully pulled 133/133 repositories
