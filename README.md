# Dune overlays

`dune-universe/opam-overlays` is an opam repository containing package
definitions of dune ports of existing packages from the main default repository
that haven't been ported yet or won't be ported upstream in the near future.

It complements
[`ocaml/opam-repository`](https://github.com/ocaml/opam-repository) and does
not attempt to replace it.

It's meant to be used by the [`opam-monorepo`](https://github.com/ocamllabs/dune-universe)
tool to allow you to vendor your dependencies and build your entire project using
`dune` only.

All packages' versions in this repository are suffixed with a `+dune` to
distinguish them from the upstream variants. That means that the
`opam-overlays` port of package `abc` version `X.Y.Z` is available on this repo
as `abc` version `X.Y.Z+dune`.

## Port a new package/version to dune on `opam-overlays`

The typical workflow to port an existing package `pkg`, version `X.Y.Z` to dune
and publish it on `opam-overlays` would be the following:

1. Create a fork of the upstream package `pkg` repo on dune-universe.
2. Create a branch `dune-universe-vX.Y.Z` pointing to the upstream `X.Y.Z`
   release tag.
3. Work on the actual port. Make sure the opam file has been properly updated
   and that dune is now part of the package `depends` field. The build
   instructions should also be updated to use dune. To ease the release process,
   the `dev-repo` and `homepage` should point to the dune-universe fork. It is
   also recommended to remove the `doc` field for similar reasons.
   Once it is ready, create a PR to merge your port into the
   `dune-universe-vX.Y.Z` branch of the dune-universe fork.
4. Once the PR is reviewed and merged, tag the head commit of the
   `dune-universe-v.X.Y.Z` with `vX.Y.Z+dune`. You should use annotated tags as
   this is what dune-release expect. You can do this by running
   `dune-release tag vX.Y.Z+dune` or `git tag -a vX.Y.Z+dune`.
5. Use `dune-release` to release the port to this repo as described in the
   below section.

Note that this requires you to be a member of the `dune-universe` organisation
to follow all the steps described here. If you'd like to submit a new port as an
external contributor, please open an issue on this repository with the name of
the package and the version you wish to port. `dune-universe` maintainers will
be happy to help you with the admin work so that you can submit the PR described
in `3`. Once the PR is merged, `dune-universe` maintainers will take care of the
release.

## Fixing an existing port

If there is an issue with an existing port that we need to fix, we do not remove
the previous port. Doing so would invalidate previously created lockfiles or
any reference to the original release tarball.
We release the fix as a new, higher version of the port so that it is picked
by the solver instead.

Please follow the steps described below to create a new, fixed port of
`pkg.X.Y.Z+dune`:
1. Open a PR to merge the fix into the `dune-universe-vX.Y.Z` branch of the
   dune-universe fork.
2. Once the PR is reviewed and merged, tag the head commit of
   `dune-universe-vX.Y.Z` with `vX.Y.Z+dune2` (or `+dune3`, `+dune4`, etc.).
3. Use `dune-release` to release the port to this repo as described in the
   below section.

## Releasing to this repo using dune-release

### Preliminary steps

If this is the first time you are releasing to `dune-universe/opam-overlays`
you will need to do the following first:
1. Clone this repository on your machine
2. Fork this repo on Github

### Releasing

Once your dune port is ready and you tagged it with `vX.Y.Z+dune`, you can run
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
