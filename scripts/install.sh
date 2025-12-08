#!/bin/bash

# Dotfiles Install Script
# Creates symlinks defined in symlinks.sh

set -e

DOTFILES="$HOME/dotfiles"

# Source symlink mappings
source "$DOTFILES/symlinks.sh"

# Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
BLUE='\033[0;34m'
NC='\033[0m'

# Expand ~ to $HOME
expand_path() {
    echo "${1/#\~/$HOME}"
}

echo ""
echo "🔗 Dotfiles Installer"
echo "====================="
echo ""

# Check for --force flag
FORCE=false
if [[ "$1" == "--force" ]]; then
    FORCE=true
    echo -e "${YELLOW}Force mode: will overwrite existing files${NC}"
    echo ""
fi

for mapping in "${SYMLINKS[@]}"; do
    source_path="${mapping%%:*}"
    target_path="${mapping#*:}"

    full_source="$DOTFILES/$source_path"
    full_target=$(expand_path "$target_path")
    name=$(basename "$source_path")

    # Check source exists
    if [[ ! -e "$full_source" ]]; then
        echo -e "${RED}✗${NC} $name - source not found: $full_source"
        continue
    fi

    # Create parent directory if needed
    target_dir=$(dirname "$full_target")
    if [[ ! -d "$target_dir" ]]; then
        mkdir -p "$target_dir"
        echo -e "${BLUE}→${NC} Created directory: $target_dir"
    fi

    # Handle existing target
    if [[ -L "$full_target" ]]; then
        current=$(readlink "$full_target")
        if [[ "$current" == "$full_source" ]]; then
            echo -e "${GREEN}✓${NC} $name (already linked)"
            continue
        else
            if [[ "$FORCE" == true ]]; then
                rm "$full_target"
            else
                echo -e "${YELLOW}!${NC} $name - symlink exists pointing elsewhere"
                echo "       Current:  $current"
                echo "       Expected: $full_source"
                echo "       Run with --force to overwrite"
                continue
            fi
        fi
    elif [[ -e "$full_target" ]]; then
        if [[ "$FORCE" == true ]]; then
            backup="$full_target.backup.$(date +%Y%m%d%H%M%S)"
            mv "$full_target" "$backup"
            echo -e "${YELLOW}→${NC} Backed up existing file to: $backup"
        else
            echo -e "${YELLOW}!${NC} $name - file exists (not a symlink)"
            echo "       Run with --force to backup and replace"
            continue
        fi
    fi

    # Create symlink
    ln -s "$full_source" "$full_target"
    echo -e "${GREEN}✓${NC} $name → $full_target"
done

echo ""
echo -e "${GREEN}Done!${NC} Run 'dotfiles health' to verify."
