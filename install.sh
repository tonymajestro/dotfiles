#!/bin/bash
set -e

GHOSTTY_DIR="ghostty/.config/ghostty"
GHOSTTY_DEV_CONFIG_FILE="config.dev"

# Detect OS type
OS_TYPE="$(uname)"

# Set ghostty fish shell
if [[ "$OS_TYPE" == "Darwin" ]]; then
  echo "Running on macOS"
  COMMAND="/opt/homebrew/bin/fish --login --interactive"
elif [[ "$OS_TYPE" == "Linux" ]]; then
  COMMAND="/usr/bin/fish --login --interactive"
else
  echo "Unknown OS: $OS_TYPE"
fi

echo "Writing ghostty config to $GHOSTTY_DIR/$GHOSTTY_DEV_CONFIG_FILE"
echo "command = $COMMAND" >"$GHOSTTY_DIR/$GHOSTTY_DEV_CONFIG_FILE"

echo "Installation complete."
