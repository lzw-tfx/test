#!/usr/bin/env bash
# Wrapper to run the bundled app and set QT plugin path correctly when needed.
set -e
DIR="$(cd "$(dirname "$0")" && pwd)"
BUNDLE_DIR="$DIR/.."/dist/workbook
cd "$BUNDLE_DIR"

# Try to find platforms dir included by PyInstaller
if [ -d "./PyQt6/Qt/plugins/platforms" ]; then
    export QT_QPA_PLATFORM_PLUGIN_PATH="$(pwd)/PyQt6/Qt/plugins/platforms"
fi

# Try running the executable (names: workbook or main)
if [ -x "./workbook" ]; then
    ./workbook "$@"
elif [ -x "./main" ]; then
    ./main "$@"
else
    echo "Executable not found in $BUNDLE_DIR"
    ls -la
    exit 1
fi
