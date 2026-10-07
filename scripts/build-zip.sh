#!/usr/bin/env bash
# Package the skill as silkvision-design.zip for upload to Claude.ai.
# The zip holds one folder, silkvision-design/, with SKILL.md at its root.
set -euo pipefail

here="$(cd "$(dirname "$0")/.." && pwd)"
stage="$(mktemp -d)"
trap 'rm -rf "$stage"' EXIT

mkdir "$stage/silkvision-design"
cp -R "$here/SKILL.md" "$here/README.md" "$here/references" "$here/assets" "$here/scripts" \
      "$stage/silkvision-design/"

rm -f "$here/silkvision-design.zip"
(cd "$stage" && zip -qrX "$here/silkvision-design.zip" silkvision-design -x '*.DS_Store')

echo "Built $here/silkvision-design.zip"
