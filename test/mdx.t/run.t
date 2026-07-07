Test that opam-monorepo can generate a lockfile and build mdx.

  $ opam-monorepo lock > error.log 2>&1 || (cat error.log && false)
  $ opam-monorepo pull > error.log 2>&1 || (cat error.log && false)
  $ dune build --root . @execute > error.log 2>&1 || (cat error.log && fale)
