#!/bin/sh
set -eu
git checkout gh-pages
version="$(git tag | sort -Vr|head -n1)"
git checkout "$version" -- *.md doc/*.md
if git status --porcelain | grep -q '^[ MAD]'; then
	git commit -am "Update gh-pages to $version"
	git push origin gh-pages
fi
git checkout master