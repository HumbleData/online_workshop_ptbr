#!/usr/bin/env bash
# Sync the workshop content from PyLadiesSalvador/humbledata-iniciantes-ptbr main
# into conteudo/. Run from the root of this repo.
set -euo pipefail

UPSTREAM="https://github.com/PyLadiesSalvador/humbledata-iniciantes-ptbr.git"
UPSTREAM_BRANCH="main"
WORK=$(mktemp -d)
trap 'rm -rf "$WORK"' EXIT

echo "Cloning $UPSTREAM ($UPSTREAM_BRANCH)..."
git clone --depth=1 --branch "$UPSTREAM_BRANCH" "$UPSTREAM" "$WORK/upstream"

echo "Refreshing conteudo/..."
rm -rf conteudo/notebooks conteudo/solutions conteudo/data conteudo/media
mkdir -p conteudo/notebooks
cp "$WORK/upstream"/*.ipynb conteudo/notebooks/
cp -R "$WORK/upstream/solutions" conteudo/solutions
cp -R "$WORK/upstream/data" conteudo/data
cp -R "$WORK/upstream/media" conteudo/media

echo
echo "Done. Review with:"
echo "  git status"
echo "  git diff --stat"
