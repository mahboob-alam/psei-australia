#!/bin/bash
set -e

# Install Flutter if not already available
if ! command -v flutter &> /dev/null; then
    echo "Installing Flutter..."
    git clone https://github.com/flutter/flutter.git -b stable --depth 1 /opt/flutter
    export PATH="/opt/flutter/bin:$PATH"
fi

# Get Flutter version
flutter --version

# Get dependencies
flutter pub get

# Build web app with no icon tree-shaking
flutter build web --release --no-tree-shake-icons

echo "Build complete!"
