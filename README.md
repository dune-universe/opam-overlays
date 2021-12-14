# Dune overlays

`dune-universe/opam-overlays` is an opam repository containing all package
definitions of dune ports of existing packages from the main default repository
that haven't been or won't be ported upstream in a near future.

It's meant to be used by the [`opam-monorepo`](https://github.com/ocamllabs/dune-universe)
tool to allow you to vendor your dependencies and build your entire project
using `dune` only.

There is a merged repository at
<https://github.com/dune-universe/opam-repository> (in the `duniverse` branch).

All packages' versions in this repository are suffixed with a `+dune` to
distinguish them from the upstream variants. That means that the
`opam-overlays` port of package `abc` version `X.Y.Z` is available on this repo
as `abc` version `X.Y.Z+dune`.

## Port a new package/version to dune on `opam-overlays`

The typical workflow to port an existing package to dune and publish it on
`opam-overlays` would be the following:

1. Create a fork of the upstream package `abc`
2. Port it to dune on a specific branch `dune-universe-vX.Y.Z`, where `X.Y.Z`
   corresponds to the upstream version you're dunifying. Make sure the opam file
   has been properly updated and that dune is now part of the package `depends`
   field and the `dev-repo` and `homepage` point to your fork. It is also
   recommended to remove the `doc` field to ease the rest of the release
   process.
3. Tag it with `X.Y.Z+dune`.
4. Use `dune-release` to release your port to this repo as described in the
   below section.

## Releasing to this repo using dune-release

### Preliminary steps

If this is the first time you are releasing to `dune-universe/opam-overlays`
you will need to do the following first:
1. Clone this repository on your machine
2. Fork of this repo on Github

### Releasing

Once your dune port is ready and you tagged it with `X.Y.Z+dune`, you can run
the following:
```
dune-release --opam-repo dune-universe/opam-overlays --remote <url to your fork> --local <path-to-your-clone>
```

We strongly recommend you delete the doc field from the opam file when doing
the port as dune-release will otherwise try to publish the documentation.
This is both not needed and can lead to errors.

dune-release 2.0.0 will simplify this workflow greatly but in the meantime
please bear with us!

## Support

Note that the packages on this repository are _not_ the official packages and
may deviate significantly since they modify the build system.  Use these at
your own risk, and do not contact upstream authors with issues specific to the
patches contained here.
