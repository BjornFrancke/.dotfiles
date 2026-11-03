# Environment variables and PATH configuration

# Editors
export EDITOR='nvim'
export VISUAL='nvim'

# NVM
#export NVM_DIR="$HOME/.nvm"

# Dprint (formatting)
export DPRINT_INSTALL="$HOME/.dprint"


# PATH configuration
# Using typeset -U to remove duplicates
typeset -U path

path=(
    "$HOME/.local/bin"
    "$HOME/.yarn/bin"
    "$HOME/.config/yarn/global/node_modules/.bin"
    "$HOME/Go/bin"
    "$DPRINT_INSTALL/bin"
    "/opt/homebrew/opt/ruby/bin"
    "/opt/homebrew/opt/ruby@3.1/bin"
    "/opt/homebrew/lib/ruby/gems/3.1.0/bin"
    "$HOME/Library/Application Support/Herd/bin"
    $path
)

export AWS_PROFILE=onomondo

# Ripgrep / fzf
export RIPGREP_CONFIG_PATH="$HOME/.ripgreprc"
export FZF_DEFAULT_COMMAND='fd --type f --hidden --exclude .git'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
