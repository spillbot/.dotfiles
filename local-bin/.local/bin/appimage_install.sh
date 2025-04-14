#!/bin/bash

# Prompt the user for input
read -p "Enter the original AppImage filename (including extension, e.g., Obsidian.AppImage): " appimage_name
read -p "Enter a short name for the application (e.g., obsidian): " short_name

# Define paths
APPIMAGE_SOURCE="$/home/michael/Downloads/$appimage_name"
APPIMAGE_DEST="/home/michael/.local/bin/$short_name"
DESKTOP_ENTRY="/home/michael/.local/share/applications/$short_name.desktop"
# ICON_PATH="/home/michael/.local/share/icons/$short_name.png"
# ICON_URL="https://raw.githubusercontent.com/obsidianmd/obsidian-releases/master/logo.png"

# Ensure necessary directories exist
mkdir -p "/home/michael/.local/bin"
mkdir -p "/home/michael/.local/share/applications"
mkdir -p "/home/michael/.local/share/icons"

# Move and set permissions
if [ -f "$APPIMAGE_SOURCE" ]; then
    mv "$APPIMAGE_SOURCE" "$APPIMAGE_DEST"
    chmod +x "$APPIMAGE_DEST"
    echo "AppImage moved to ~/.local/bin/$short_name and made executable."
else
    echo "Error: AppImage not found in ~/Downloads."
    exit 1
fi

# Create .desktop entry
cat > "$DESKTOP_ENTRY" <<EOL
[Desktop Entry]
Name=$short_name
Exec=$APPIMAGE_DEST
#Icon=$ICON_PATH
Type=Application
Categories=Utility;TextEditor;
Terminal=false
StartupWMClass=$short_name
EOL

echo "Desktop entry created at $DESKTOP_ENTRY."

# Download icon (optional)
# wget -O "$ICON_PATH" "$ICON_URL" &>/dev/null && echo "Icon downloaded successfully." || echo "Failed to download icon."
# Refresh application database

update-desktop-database "/home/michael/.local/share/applications/"
echo "Desktop database updated."

echo "Installation complete! You can now find '$short_name' in your application menu."
