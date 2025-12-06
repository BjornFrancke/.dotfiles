#!/bin/bash

# ========================================
# TMUX SETUP INSTALLER
# ========================================
# This script installs and configures tmux with all plugins

set -e

echo "🚀 Installing tmux configuration..."

# Colors for output
GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Check if tmux is installed
if ! command -v tmux &> /dev/null; then
    echo -e "${YELLOW}⚠️  tmux is not installed.${NC}"
    echo "Install it with: brew install tmux"
    exit 1
fi

echo -e "${BLUE}✓ tmux found${NC}"

# Create symlink to tmux.conf
if [ -L "$HOME/.tmux.conf" ] || [ -f "$HOME/.tmux.conf" ]; then
    echo -e "${YELLOW}⚠️  ~/.tmux.conf already exists${NC}"
    read -p "Backup and replace? (y/n) " -n 1 -r
    echo
    if [[ $REPLY =~ ^[Yy]$ ]]; then
        mv "$HOME/.tmux.conf" "$HOME/.tmux.conf.backup.$(date +%Y%m%d_%H%M%S)"
        echo -e "${GREEN}✓ Backed up existing config${NC}"
    else
        echo "Skipping symlink creation"
        exit 0
    fi
fi

ln -s "$HOME/dotfiles/tmux/tmux.conf" "$HOME/.tmux.conf"
echo -e "${GREEN}✓ Created symlink: ~/.tmux.conf${NC}"

# Install TPM (Tmux Plugin Manager)
if [ ! -d "$HOME/.tmux/plugins/tpm" ]; then
    echo -e "${BLUE}📦 Installing TPM (Tmux Plugin Manager)...${NC}"
    git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
    echo -e "${GREEN}✓ TPM installed${NC}"
else
    echo -e "${BLUE}✓ TPM already installed${NC}"
fi

# Install plugins
echo -e "${BLUE}📦 Installing tmux plugins...${NC}"
~/.tmux/plugins/tpm/bin/install_plugins

echo ""
echo -e "${GREEN}✅ Tmux setup complete!${NC}"
echo ""
echo "Next steps:"
echo "1. Start tmux: tmux"
echo "2. Plugins are installed automatically"
echo "3. Press Ctrl+a then ? to see all keybindings"
echo "4. Check out KEYBINDINGS.md for a full reference"
echo ""
echo "Quick tips:"
echo "  - Prefix is Ctrl+a (not Ctrl+b)"
echo "  - Split panes: Ctrl+a | or Ctrl+a -"
echo "  - Navigate: Ctrl+h/j/k/l (works with nvim too!)"
echo "  - New window: Ctrl+a c"
echo "  - Choose session: Ctrl+a s"
