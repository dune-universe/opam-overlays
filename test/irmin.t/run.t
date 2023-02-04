Test that opam-monorepo can generate a lockfile and build irmin.

  $ opam-monorepo lock > /dev/null 2>&1
  $ opam-monorepo pull > /dev/null
  $ dune build
  $ dune exec irmin -- --version > /dev/null 2>&1
