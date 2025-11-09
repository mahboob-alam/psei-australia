#!/bin/bash
set -e

# Install Flutter if not already available
if ! command -v flutter &> /dev/null; then
    echo "Installing Flutter..."
    cd $HOME
    git clone https://github.com/flutter/flutter.git -b stable --depth 1
    export PATH="$HOME/flutter/bin:$PATH"
    cd -
else
    echo "Flutter already installed"
fi

# Get Flutter version
flutter --version

# Enable web support
flutter config --enable-web

# Get dependencies
flutter pub get

# Build web app with no icon tree-shaking
flutter build web --release --no-tree-shake-icons

echo "Build complete!"
