#!/bin/bash
# Installation script for JSasta syntax highlighting in Zed editor

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
SOURCE_DIR="$SCRIPT_DIR/languages/jsasta"

# Determine the Zed config directory based on OS
if [[ "$OSTYPE" == "darwin"* ]]; then
    # macOS
    ZED_CONFIG_DIR="$HOME/Library/Application Support/Zed/languages"
elif [[ "$OSTYPE" == "linux-gnu"* ]]; then
    # Linux
    ZED_CONFIG_DIR="${XDG_CONFIG_HOME:-$HOME/.config}/zed/languages"
else
    echo "Unsupported operating system: $OSTYPE"
    echo "Please manually copy the jsasta directory to your Zed languages directory"
    exit 1
fi

DEST_DIR="$ZED_CONFIG_DIR/jsasta"

echo "JSasta Syntax Highlighting Installer for Zed"
echo "=============================================="
echo ""
echo "Source: $SOURCE_DIR"
echo "Destination: $DEST_DIR"
echo ""

# Check if source directory exists
if [ ! -d "$SOURCE_DIR" ]; then
    echo "Error: Source directory not found: $SOURCE_DIR"
    exit 1
fi

# Create Zed languages directory if it doesn't exist
if [ ! -d "$ZED_CONFIG_DIR" ]; then
    echo "Creating Zed languages directory..."
    mkdir -p "$ZED_CONFIG_DIR"
fi

# Check if destination already exists
if [ -d "$DEST_DIR" ] || [ -L "$DEST_DIR" ]; then
    echo "Warning: JSasta language configuration already exists at:"
    echo "  $DEST_DIR"
    echo ""
    read -p "Do you want to overwrite it? (y/N): " -n 1 -r
    echo
    if [[ ! $REPLY =~ ^[Yy]$ ]]; then
        echo "Installation cancelled."
        exit 0
    fi

    echo "Removing existing installation..."
    rm -rf "$DEST_DIR"
fi

# Ask user for installation method
echo ""
echo "Installation method:"
echo "  1) Copy files (recommended for most users)"
echo "  2) Create symlink (for development/testing)"
echo ""
read -p "Choose method (1 or 2): " -n 1 -r
echo

case $REPLY in
    1)
        echo "Copying files..."
        cp -r "$SOURCE_DIR" "$DEST_DIR"
        echo "✓ Files copied successfully"
        ;;
    2)
        echo "Creating symlink..."
        ln -s "$SOURCE_DIR" "$DEST_DIR"
        echo "✓ Symlink created successfully"
        echo "  Note: Changes to the source files will be reflected immediately"
        ;;
    *)
        echo "Invalid choice. Installation cancelled."
        exit 1
        ;;
esac

echo ""
echo "Installation complete!"
echo ""
echo "Next steps:"
echo "  1. Restart Zed editor"
echo "  2. Open a .jsa file"
echo "  3. Enjoy syntax highlighting!"
echo ""
echo "If highlighting doesn't work:"
echo "  - Make sure your file has the .jsa extension"
echo "  - Try manually selecting 'JSasta' from the language menu"
echo "  - Check Zed logs: View → Debug → Show Logs"
echo ""
