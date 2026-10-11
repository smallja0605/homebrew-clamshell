#!/bin/bash
# Points the cask at a new Clamshell release:   ./update.sh 0.2.0
# Downloads that release's zip, computes its SHA-256 and rewrites `version` and `sha256` in Casks/clamshell.rb.
set -euo pipefail
cd "$(dirname "$0")"
V="${1:?usage: update.sh <version>   e.g. update.sh 0.2.0}"
TMP="$(mktemp -d)"; trap 'rm -rf "$TMP"' EXIT
curl -fsSL -o "$TMP/c.zip" "https://github.com/smallja0605/clamshell/releases/download/v$V/Clamshell-$V.zip"
SHA="$(shasum -a 256 "$TMP/c.zip" | awk '{print $1}')"
sed -i '' -E "s/^  version \".*\"/  version \"$V\"/; s/^  sha256 \".*\"/  sha256 \"$SHA\"/" Casks/clamshell.rb
echo "cask now at $V (sha256 $SHA)"
