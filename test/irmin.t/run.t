Test that opam-monorepo can generate a lockfile (do not build)

  $ opam-monorepo lock > /dev/null 2>&1
  $ opam-monorepo pull > /dev/null 2>&1
