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

echo ":: Checking Flutter installation for symlinks"
find "$HOME/flutter" -type l | head -20 || echo "No symlinks in Flutter SDK"

flutter --version

echo ":: Pre-caching web artifacts"
flutter precache --web

echo ":: Pub get"
flutter pub get

echo ":: Building Flutter web (release)"
# Build to a temporary directory outside build/
flutter build web --release --output /tmp/flutter_web_output

echo ":: Debugging - checking for symlinks and special files"
find /tmp/flutter_web_output -type l -ls || echo "No symlinks found"
ls -la /tmp/flutter_web_output | head -50

echo ":: Cleaning up build artifacts"
# Remove macOS resource fork files, Flutter internal files, and other potentially problematic files
find /tmp/flutter_web_output -name "._*" -type f -delete 2>/dev/null || true
find /tmp/flutter_web_output -name ".DS_Store" -type f -delete 2>/dev/null || true
find /tmp/flutter_web_output -name ".last_build_id" -type f -delete 2>/dev/null || true
# Remove any Flutter metadata that might contain references
find /tmp/flutter_web_output -name "*.packages" -type f -delete 2>/dev/null || true
find /tmp/flutter_web_output -name ".dart_tool" -type d -exec rm -rf {} + 2>/dev/null || true
find /tmp/flutter_web_output -name ".packages" -type f -delete 2>/dev/null || true

# Move to Cloudflare's expected location
echo ":: Moving to build/web for Cloudflare"
mkdir -p build
mv /tmp/flutter_web_output build/web

echo ":: Build finished. Output -> build/web"
