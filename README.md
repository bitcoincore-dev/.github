![bips.dev logo](web/static/bips-dev-header.png)

Search, share, and save BIPs (Bitcoin Improvement Proposals)

[![Netlify Status](https://api.netlify.com/api/v1/badges/b3335c93-1302-4033-a766-ec95836b6ece/deploy-status)](https://app.netlify.com/sites/awesome-shannon-2db2d5/deploys)

`bips.dev` is a static site generated by [zola](https://github.com/getzola/zola), using the [bitcoin/bips](https://github.com/bitcoin/bips)
repo as input. The result is a site that enables a simple UI for navigating BIPs, searching, and sharing them easily via short URLs, i.e.
[`https://bips.dev/141`](https://bips.dev/141)

## Status

### Rendering

The version live on [bips.dev](https://bips.dev) shows a simple [`pandoc`](https://pandoc.org/) conversion from
mediawiki text to "GitHub-flavored" markdown, and a few things are broken. Tables seem to be the biggest problem,
with internal links and code snippets being a close second. I've tried using [`Parsoid`](https://www.mediawiki.org/wiki/Parsoid)
to convert the mediawiki to HTML, then to markdown, but it doesn't work when encountering things like top-level
`<img>` tags in the BIP source (which shouldn't be there anyway, [according to Wikimedia](https://www.mediawiki.org/wiki/Help:Formatting#HTML_tags))

### Ideas

* Visual "mind map" of BIPs and their references.

## Building

* Install [Rust](https://www.rust-lang.org/) and [zola](https://www.getzola.org/)
* `make bips`
* `./web/build/transcode-md.sh`
* `make build` or `make serve`
