#!/usr/bin/env bash
# Put the latest browser (WebAssembly) build of the Terrarium viewer into OUT_DIR.
#
#   scripts/fetch-viewer.sh [OUT_DIR]        # default: public/play
#
# Sources, in order:
#   1. TERRARIUM_WEB_DIR: a local build (web/build.sh in the terrarium repo, i.e. its web/ dir)
#   2. the `web-latest` release of raskell-io/terrarium (public, no token needed)
set -euo pipefail
OUT="${1:-public/play}"
REPO="raskell-io/terrarium"
TMP="$(mktemp -d)"
trap 'rm -rf "$TMP"' EXIT

rm -rf "$OUT"
mkdir -p "$OUT/pkg"

if [ -n "${TERRARIUM_WEB_DIR:-}" ]; then
    echo "Using local build in $TERRARIUM_WEB_DIR"
    cp "$TERRARIUM_WEB_DIR/index.html" "$OUT/"
    cp "$TERRARIUM_WEB_DIR/pkg/terrarium_web.js" "$TERRARIUM_WEB_DIR/pkg/terrarium_web_bg.wasm" "$OUT/pkg/"
else
    echo "Using the web-latest release"
    curl -fsSL -o "$TMP/web.tar.gz" "https://github.com/$REPO/releases/download/web-latest/terrarium-web.tar.gz"
    tar -xzf "$TMP/web.tar.gz" -C "$OUT"
fi

[ -f "$OUT/index.html" ] && [ -f "$OUT/pkg/terrarium_web_bg.wasm" ] || { echo "viewer build is incomplete" >&2; exit 1; }

# Cloudflare serves at most 25 MiB per file
size=$(wc -c < "$OUT/pkg/terrarium_web_bg.wasm")
if [ "$size" -gt 26214400 ]; then
    echo "terrarium_web_bg.wasm is $size bytes, over Cloudflare's 25 MiB per-file limit" >&2
    exit 1
fi
echo "Viewer in $OUT (wasm $((size / 1024)) KiB)"
