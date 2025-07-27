#!/bin/bash
set -e

# Build reddittui
echo "Building reddittui application..."
mkdir -p "$BUILD_DIR"
go build -o "$BUILD_DIR/$APP_NAME" "$GO_MAIN_FILE"

# Detect OS type
OS_TYPE="$(uname)"

if [[ "$OS_TYPE" == "Darwin" ]]; then
  echo "Running on macOS"
  COMMAND="/opt/homebrew/bin/fish --login --interactive"
elif [[ "$OS_TYPE" == "Linux" ]]; then
  COMMAND="/opt/homebrew/bin/fish --login --interactive"
else
  echo "Unknown OS: $OS_TYPE"
fi

echo "Installation complete."
