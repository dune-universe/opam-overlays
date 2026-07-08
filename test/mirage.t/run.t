Test that a few non-trivial unikernels in mirage-skeleton can resolve their dependencies

Prepare tests
  $ git clone -q --depth=1 https://github.com/mirage/mirage-skeleton.git
  $ overlays_path=$(realpath '../opam-overlays')
  $ export MIRAGE_EXTRA_REPOS="opam-overlays:file://$overlays_path,mirage-overlays:https://github.com/dune-universe/mirage-opam-overlays.git"

Try to resolve charrua dependencies
  $ cd mirage-skeleton/applications/dhcp
  $ mirage configure -t hvt
  Successfully configured the unikernel. Now run 'make' (or more fine-grained steps: 'make all', 'make depends', or 'make lock').
  $ (make lock 2> error.log | grep "lock file has been generated") || (cat error.log && false)
  The lock file has been generated. Run 'make pull' to retrieve the sources, or 'make install-switch' to install the host dependencies.

Try to resolve crypto dependencies (which include zarith)
  $ cd ../crypto
  $ mirage configure -t hvt | grep "configured the unikernel"
  Successfully configured the unikernel. Now run 'make' (or more fine-grained steps: 'make all', 'make depends', or 'make lock').
  $ (make lock 2> error.log | grep "lock file has been generated") || (cat error.log && false)
  The lock file has been generated. Run 'make pull' to retrieve the sources, or 'make install-switch' to install the host dependencies.
  $ make pull > /dev/null
  $ (make build 2> error.log | grep "Your unikernel binary is now ready") || (cat error.log && false)
  Your unikernel binary is now ready in ./dist/crypto-test.hvt
