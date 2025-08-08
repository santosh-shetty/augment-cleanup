#!/bin/bash

echo "🔧 Augment AI Cleanup Script (VSCode) - Starting..."

# === 1. Close VSCode if running ===
echo "🛑 Checking if VSCode is running..."
if pgrep -x "code" > /dev/null; then
    echo "📛 VSCode is running. Attempting to close it..."
    pkill -f "code"
    sleep 2
else
    echo "✅ VSCode is not running."
fi

# === 2. Define paths ===
USER_HOME="$HOME"
EXT_DIR="$USER_HOME/.vscode/extensions"
GLOBAL_STORAGE_DIR="$USER_HOME/.config/Code/User/globalStorage"
WORKSPACE_STORAGE_DIR="$USER_HOME/.config/Code/User/workspaceStorage"

# === 3. Remove Augment extension(s) ===
echo "🧹 Removing Augment extension(s)..."
find "$EXT_DIR" -maxdepth 1 -type d -name "augment.vscode-augment-*" -exec rm -rf {} \;

# === 4. Remove Augment global storage ===
echo "🧹 Removing Augment globalStorage directory..."
rm -rf "$GLOBAL_STORAGE_DIR/augment.vscode-augment"

# === 5. Remove Augment workspace storage directories ===
echo "🧹 Searching for Augment workspace storage folders..."
if [ -d "$WORKSPACE_STORAGE_DIR" ]; then
    find "$WORKSPACE_STORAGE_DIR" -type d -path "*/Augment.vscode-augment" -exec rm -rf {} +
    echo "✅ Workspace storage cleanup done."
else
    echo "⚠️ workspaceStorage directory not found."
fi

echo "🎉 Cleanup complete. You may now restart VSCode if needed."
