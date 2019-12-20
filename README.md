# Dune overlays

`dune-universe/opam-overlays` is an opam repository containing all package
definitions of dune ports of existing packages from the main default repository
that haven't been or won't be ported upstream in a near future.

It's meant to be used by the `duniverse` tool to allow you to vendor your
dependencies and build your entire project using `dune` only.

There is a merged repository that the `duniverse` tool uses which is a standalone
opam repository at <https://github.com/dune-universe/opam-repository> (in the
`duniverse` branch).

All packages' versions in this repository are suffixed with a `+dune` to
distinguish them from the upstream variants. That means that the
`opam-overlays` port of package `abc` version `X.Y.Z` is available on this repo
as `abc` version `X.Y.Z+dune`.

## Port a new package/version to dune on `opam-overlays`

The typical workflow to port an existing package to dune and publish it on
`opam-overlays` would be the following:

1. Create a fork of the upstream package `abc`
2. Port it to dune on a specific branch `dune-universe-vX.Y.Z`, where `X.Y.Z` corresponds to the upstream
   version you're dunifying. Make sure the opam file has been properly updated and that dune is now part of the package
   `depends` field and the `dev-repo` field is set to your fork.
3. Open a PR to `opam-overlays` adding a `packages/abc/abc.X.Y.Z+dune/opam` containing:
```
url {
  src: "git+https://github.com/<you_username>/abc#<branch_name>"
}
```

Remove any older versions of a package, since we only maintain a single one per
package here.  All packages must also be coinstallable simultaneously, which is
verified by the CI.

## Release an existing port to `opam-overlays`

This is basically done by jumping straight to the above step `4` using the tag
or branch under which the dune port lives in the forked repo.

If the opam file's `dev_repo` and `depends` haven't been properly updated, make
sure to fix it in the `packages/abc/abc.X.Y.Z+dune/opam`.

## Deleting a package

When the dune version is merged upstream to
https://github.com/ocaml/opam-repository, simply remove the port here.

## Support

Note that the packages on this repository are _not_ the official packages and
may deviate significantly since they modify the build system.  Use these at
your own risk, and do not contact upstream authors with issues specific to the
patches contained here.
