# Environment variables and PATH configuration

# Editors
export EDITOR='nvim'
export VISUAL='nvim'

# NVM
export NVM_DIR="$HOME/.nvm"

# Dprint (formatting)
export DPRINT_INSTALL="$HOME/.dprint"


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
