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
# Create a clean directory with resolved symlinks
TEMP_BUILD="build/web_temp"
mkdir -p "$TEMP_BUILD"

# Use tar to copy files and automatically resolve symlinks
(cd build/web && tar chf - .) | (cd "$TEMP_BUILD" && tar xf -)

# Replace the original directory
rm -rf build/web
mv "$TEMP_BUILD" build/web

echo ":: Build finished. Output -> build/web"
