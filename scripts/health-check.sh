#!/bin/bash

# Dotfiles Health Check
# Run this to verify your dotfiles are properly set up

DOTFILES="$HOME/dotfiles"

# Source symlink mappings
source "$DOTFILES/symlinks.sh"

# Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Counters
PASS=0
FAIL=0
WARN=0

# Helper functions
pass() {
    echo -e "${GREEN}✓${NC} $1"
    ((PASS++))
}

fail() {
    echo -e "${RED}✗${NC} $1"
    ((FAIL++))
}

warn() {
    echo -e "${YELLOW}!${NC} $1"
    ((WARN++))
}

section() {
    echo ""
    echo -e "${BLUE}━━━ $1 ━━━${NC}"
}

# Expand ~ to $HOME
expand_path() {
    echo "${1/#\~/$HOME}"
}

# Check if symlink exists and points to correct target
check_symlink() {
    local source="$1"
    local target="$2"

    local full_source="$DOTFILES/$source"
    local full_target=$(expand_path "$target")
    local name=$(basename "$source")

    if [[ -L "$full_target" ]]; then
        local actual=$(readlink "$full_target")
        if [[ "$actual" == "$full_source" ]]; then
            pass "$name"
        else
            fail "$name → wrong target"
            echo "       Expected: $full_source"
            echo "       Actual:   $actual"
        fi
    elif [[ -e "$full_target" ]]; then
        warn "$name exists but not a symlink"
    else
        fail "$name → missing"
        echo "       Run: ln -s $full_source $full_target"
    fi
}

# Check if command exists
check_command() {
    local cmd="$1"
    if command -v "$cmd" &>/dev/null; then
        pass "$cmd"
    else
        fail "$cmd"
    fi
}

echo ""
echo "🏥 Dotfiles Health Check"
echo "========================"

# ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
section "Dotfiles Directory"
# ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

if [[ -d "$DOTFILES" ]]; then
    pass "Dotfiles directory"
else
    fail "Dotfiles directory not found at $DOTFILES"
    exit 1
fi

if [[ -d "$DOTFILES/.git" ]]; then
    pass "Git repository"
else
    warn "Not a git repository"
fi

# ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
section "Symlinks"
# ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

for mapping in "${SYMLINKS[@]}"; do
    source="${mapping%%:*}"
    target="${mapping#*:}"
    check_symlink "$source" "$target"
done

# ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
section "Required Tools"
# ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

for cmd in brew git nvim tmux zsh; do
    check_command "$cmd"
done

# ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
section "Optional Tools"
# ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

for cmd in lazygit yazi zellij bat eza fzf zoxide delta rg fd; do
    check_command "$cmd"
done

# ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
section "Issues"
# ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

# Broken symlinks
broken=$(find "$DOTFILES" -type l ! -exec test -e {} \; -print 2>/dev/null)
if [[ -n "$broken" ]]; then
    fail "Broken symlinks:"
    echo "$broken" | while read -r link; do echo "       $link"; done
else
    pass "No broken symlinks"
fi

# Backup files
backups=$(find "$DOTFILES" \( -name "*.bak*" -o -name "*_backup*" \) 2>/dev/null)
if [[ -n "$backups" ]]; then
    warn "Backup files found:"
    echo "$backups" | while read -r file; do echo "       $file"; done
else
    pass "No backup files"
fi

# ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
section "Summary"
# ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

echo ""
echo -e "  ${GREEN}Passed:${NC}   $PASS"
echo -e "  ${RED}Failed:${NC}   $FAIL"
echo -e "  ${YELLOW}Warnings:${NC} $WARN"
echo ""

if [[ $FAIL -eq 0 ]]; then
    echo -e "${GREEN}✓ Dotfiles are healthy!${NC}"
else
    echo -e "${RED}✗ Some issues need attention${NC}"
fi
