Test that opam-monorepo can generate a lockfile (do not build)

  $ opam-monorepo lock > error.log 2>&1 || (cat error.log && false)
  $ opam-monorepo pull > error.log 2>&1 || (cat error.log && false)
