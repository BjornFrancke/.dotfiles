#!/bin/bash

# macOS Settings Script
# Applies macOS defaults. Safe to re-run.
# Usage: scripts/macos.sh

set -e

if [[ "$(uname)" != "Darwin" ]]; then
    echo "This script only runs on macOS"
    exit 1
fi

echo ""
echo "🍎 macOS Settings"
echo "================="
echo ""

# Close System Settings so it doesn't override changes
osascript -e 'tell application "System Settings" to quit' 2>/dev/null || true

###############################################################################
# Input
###############################################################################

# Disable the input source indicator shown near the cursor
defaults write kCFPreferencesAnyApplication TSMLanguageIndicatorEnabled 0

###############################################################################
# Trackpad
###############################################################################

# Disable two-finger swipe to navigate back/forward
defaults write NSGlobalDomain AppleEnableSwipeNavigateWithScrolls -bool false

###############################################################################
# Finder
###############################################################################

# Use list view in all Finder windows by default
# (icnv = icon, clmv = column, glyv = gallery, Nlsv = list)
defaults write com.apple.finder FXPreferredViewStyle -string "Nlsv"

###############################################################################
# Apply
###############################################################################

# Restart affected processes
for app in Dock Finder SystemUIServer; do
    killall "$app" &>/dev/null || true
done

echo "✅ Done. Some changes may require logout/restart."
echo ""
