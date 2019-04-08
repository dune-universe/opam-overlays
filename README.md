# Dune overlays

## Dunify a package

Packages must define `dev-repo` and `url.src` like this:

```
dev-repo: "your_repo_url"
url {
	src: "git+https://your_repo/url#branch"
}
```

`dune` must be added to the dependencies:

```
depends: [
	"dune" { build }
	...
]
```
