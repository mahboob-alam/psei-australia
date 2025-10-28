#!/usr/bin/env bash
set -euo pipefail

echo ":: Installing Flutter (stable) if not present"
if ! command -v flutter &> /dev/null; then
  git clone https://github.com/flutter/flutter.git -b stable "$HOME/flutter"
  export PATH="$HOME/flutter/bin:$PATH"
else
  echo "Flutter already available"
fi

export PATH="$HOME/flutter/bin:$PATH"
flutter --version

echo ":: Pre-caching web artifacts"
flutter precache --web

echo ":: Pub get"
flutter pub get

echo ":: Building Flutter web (release)"
flutter build web --release

echo ":: Resolving symlinks in build output"
# Create a temporary directory for resolved files
TEMP_DIR=$(mktemp -d)
cp -rL build/web/* "$TEMP_DIR/"
rm -rf build/web
mkdir -p build/web
cp -r "$TEMP_DIR"/* build/web/
rm -rf "$TEMP_DIR"

echo ":: Build finished. Output -> build/web"
