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

# Copy all files and directories, dereferencing symlinks
# Using find with cp to ensure all symlinks are resolved
cd build/web
find . -type f -exec sh -c 'mkdir -p "'"$TEMP_BUILD"'/$(dirname "$1")" && cp -L "$1" "'"$TEMP_BUILD"'/$1"' _ {} \;
find . -type d -exec mkdir -p "$TEMP_BUILD/{}" \;
cd ../..

# Replace the original directory
rm -rf build/web
mv "$TEMP_BUILD" build/web

echo ":: Build finished. Output -> build/web"
