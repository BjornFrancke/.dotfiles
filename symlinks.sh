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

    # Terminal multiplexers
    "tmux/tmux.conf:~/.tmux.conf"
    "zellij:~/.config/zellij"

    # Terminal emulators
    "ghostty/config.ghostty:~/Library/Application Support/com.mitchellh.ghostty/config.ghostty"

    # Shell
    "zshrc/.zshrc:~/.zshrc"
    "p10k/.p10k.zsh:~/.p10k.zsh"

    # Tools
    "fastfetch:~/.config/fastfetch"
    "yazi:~/.config/yazi"
    "lazygit/config.yml:~/Library/Application Support/lazygit/config.yml"
    "karabiner:~/.config/karabiner"
    "ripgrep/ripgreprc:~/.ripgreprc"
)
