#!/bin/bash

# Symlink Mappings
# Format: "source:target"
# - source: relative to dotfiles directory
# - target: absolute path (~ will be expanded)
#
# Used by:
# - scripts/health-check.sh (verify symlinks)
# - scripts/install.sh (create symlinks)

SYMLINKS=(
    # Editors
    "nvim:~/.config/nvim"
    "helix:~/.config/helix"
    "zed:~/.config/zed"
    "cursor:~/.config/cursor"

    # Terminal multiplexers
    "tmux/tmux.conf:~/.tmux.conf"
    "zellij:~/.config/zellij"

    # Terminal emulators
    "ghostty/config:~/Library/Application Support/com.mitchellh.ghostty/config"
    "iterm/com.googlecode.iterm2.plist:~/Library/Preferences/com.googlecode.iterm2.plist"

    # Shell
    "zshrc/.zshrc:~/.zshrc"
    "p10k/.p10k.zsh:~/.p10k.zsh"

    # Tools
    "yazi:~/.config/yazi"
    "lazygit/config.yml:~/Library/Application Support/lazygit/config.yml"
    "karabiner:~/.config/karabiner"
)
