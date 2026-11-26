#!/usr/bin/env bash
set -euo pipefail
ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
SRC="$ROOT/browser/firefox-source"
if [ ! -x "$SRC/mach" ]; then
  echo "Firefox source not found. Run scripts/bootstrap.sh first." >&2
  exit 1
fi
cd "$SRC"
export MOZCONFIG="$ROOT/mozconfig"
./mach build
./mach run
