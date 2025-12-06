# Environment variables and PATH configuration

# Editors
export EDITOR='nvim'
export VISUAL='nvim'

# NVM
export NVM_DIR="$HOME/.nvm"

# Dprint (formatting)
export DPRINT_INSTALL="$HOME/.dprint"

# Herd PHP configurations
export HERD_PHP_84_INI_SCAN_DIR="$HOME/Library/Application Support/Herd/config/php/84/"
export HERD_PHP_82_INI_SCAN_DIR="$HOME/Library/Application Support/Herd/config/php/82/"
export HERD_PHP_74_INI_SCAN_DIR="$HOME/Library/Application Support/Herd/config/php/74/"

# PATH configuration
# Using typeset -U to remove duplicates
typeset -U path

path=(
    "$HOME/Go/bin"
    "$DPRINT_INSTALL/bin"
    "/opt/homebrew/opt/ruby/bin"
    "/opt/homebrew/opt/ruby@3.1/bin"
    "/opt/homebrew/lib/ruby/gems/3.1.0/bin"
    "$HOME/Library/Application Support/Herd/bin"
    $path
)

# Yarn global bin (evaluated at runtime)
export PATH="$(yarn global bin):$PATH"
