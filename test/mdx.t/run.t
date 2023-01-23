Test that opam-monorepo can generate a lockfile and build mdx.

  $ opam-monorepo lock > /dev/null
  $ opam-monorepo pull > /dev/null
  $ dune build
  $ dune exec ocaml-mdx -- --version > /dev/null
