Test that opam-monorepo can generate a lockfile and build mdx.

  $ opam-monorepo lock > /dev/null 2>&1
  $ opam-monorepo pull > /dev/null 2>&1
  $ dune build
  $ dune exec ocaml-mdx -- --version > /dev/null
