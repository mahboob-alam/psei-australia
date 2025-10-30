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
# Create a clean copy resolving any potential symlinks
# Use a simple cp with explicit options
if [ -d "build/web" ]; then
  TEMP_BUILD="build/web_clean"
  mkdir -p "$TEMP_BUILD"
  
  # Copy with tar - fast and reliable
  tar -C build/web -cf - . | tar -C "$TEMP_BUILD" -xf -
  
  # Replace
  rm -rf build/web
  mv "$TEMP_BUILD" build/web
fi

echo ":: Build finished. Output -> build/web"
