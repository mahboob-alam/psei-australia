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

echo ":: Debugging - checking for symlinks and special files"
find build/web -type l -ls || echo "No symlinks found"
find build/web -name "*.packages" -type f || echo "No .packages files"
find build/web -name ".dart_tool" -type d || echo "No .dart_tool directories"
ls -laR build/web | head -100

echo ":: Cleaning up build artifacts"
# Remove macOS resource fork files, Flutter internal files, and other potentially problematic files
find build/web -name "._*" -type f -delete 2>/dev/null || true
find build/web -name ".DS_Store" -type f -delete 2>/dev/null || true
find build/web -name ".last_build_id" -type f -delete 2>/dev/null || true
# Remove any Flutter metadata that might contain references
find build/web -name "*.packages" -type f -delete 2>/dev/null || true
find build/web -name ".dart_tool" -type d -exec rm -rf {} + 2>/dev/null || true
find build/web -name ".packages" -type f -delete 2>/dev/null || true

# Use tar to create a completely clean copy with all symlinks dereferenced
echo ":: Creating clean output directory using tar"
cd build
tar chf - web | tar xf - --transform='s/^web/web_clean/'
rm -rf web
mv web_clean web
cd ..

echo ":: Build finished. Output -> build/web"
