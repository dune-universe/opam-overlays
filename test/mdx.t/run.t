Test that opam-monorepo can generate a lockfile and build mdx.

  $ opam-monorepo lock
  ==> Using 1 locally scanned package as the target.
  ==> Found 29 opam dependencies for the target package.
  ==> Querying opam database for their metadata and Dune compatibility.
  ==> Calculating exact pins for each of them.
  ==> Wrote lockfile with 18 entries to $TESTCASE_ROOT/opam-overlays-test-mdx.opam.locked. You can now run opam monorepo pull to fetch their sources.
  $ opam-monorepo pull
  ==> Using lockfile $TESTCASE_ROOT/opam-overlays-test-mdx.opam.locked
  Successfully pulled 18/18 repositories
  $ dune build
  $ dune exec ocaml-mdx -- --version
  2.2.0
