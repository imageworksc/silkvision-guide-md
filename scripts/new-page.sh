#!/usr/bin/env bash
# Copy the Silk Vision starter kit into a new page project.
# Usage: scripts/new-page.sh <target-dir>
set -euo pipefail

if [ $# -ne 1 ]; then
  echo "Usage: $0 <target-dir>" >&2
  exit 1
fi

here="$(cd "$(dirname "$0")/.." && pwd)"
target="$1"

if [ -e "$target" ] && [ -n "$(ls -A "$target" 2>/dev/null)" ]; then
  echo "Refusing to overwrite: $target is not empty." >&2
  exit 1
fi

mkdir -p "$target"
cp -R "$here/assets/starter/." "$target/"

echo "Starter copied to $target"
echo "Next: replace every {{PLACEHOLDER}} in index.html and the two HERO_IMAGE URLs in css/sections.css."
