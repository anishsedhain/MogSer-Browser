#!/usr/bin/env bash
set -euo pipefail
ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
SRC="$ROOT/browser/firefox-source"
mkdir -p "$ROOT/browser"
if [ ! -d "$SRC/.git" ]; then
  git clone https://github.com/mozilla-firefox/firefox.git "$SRC"
fi
cd "$SRC"
python3 python/mozboot/bin/bootstrap.py
echo
echo "Bootstrap finished. Review the prompts/output, then run:"
echo "  cd \"$SRC\" && ./mach build && ./mach run"
