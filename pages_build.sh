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
# Build to a custom output directory to avoid any conflicts
flutter build web --release --output output_web

echo ":: Cleaning up build artifacts"
# Remove macOS resource fork files, Flutter internal files, and other potentially problematic files
find output_web -name "._*" -type f -delete 2>/dev/null || true
find output_web -name ".DS_Store" -type f -delete 2>/dev/null || true
find output_web -name ".last_build_id" -type f -delete 2>/dev/null || true

# Copy to standard build/web location for Cloudflare
mkdir -p build
mv output_web build/web

echo ":: Build finished. Output -> build/web"
