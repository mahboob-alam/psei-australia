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

echo ":: Cleaning up build artifacts"
# Remove macOS resource fork files, Flutter internal files, and other potentially problematic files
find build/web -name "._*" -type f -delete 2>/dev/null || true
find build/web -name ".DS_Store" -type f -delete 2>/dev/null || true
find build/web -name ".last_build_id" -type f -delete 2>/dev/null || true

# Use tar to create a completely clean copy with all symlinks dereferenced
echo ":: Creating clean output directory using tar"
cd build
tar chf - web | tar xf - --transform='s/^web/web_clean/'
rm -rf web
mv web_clean web
cd ..

echo ":: Build finished. Output -> build/web"
