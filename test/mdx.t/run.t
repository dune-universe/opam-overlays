Test that opam-monorepo can generate a lockfile and build mdx.

  $ opam-monorepo lock > /dev/null 2>&1
  $ opam-monorepo pull > /dev/null 2>&1
  $ dune build --root . @execute > /dev/null 2>&1
