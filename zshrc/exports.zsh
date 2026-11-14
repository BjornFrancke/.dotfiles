# Environment variables and PATH configuration

# Editors
export EDITOR='nvim'
export VISUAL='nvim'

# NVM
#export NVM_DIR="$HOME/.nvm"

# Dprint (formatting)
export DPRINT_INSTALL="$HOME/.dprint"

# pnpm
export PNPM_HOME="$HOME/Library/pnpm"


# PATH configuration
# Using typeset -U to remove duplicates
typeset -U path

path=(
    "$HOME/.local/bin"
    "$HOME/.yarn/bin"
    "$HOME/.config/yarn/global/node_modules/.bin"
    "$PNPM_HOME/bin"
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

# fzf + bat: Ayu Dark palette (matches tmux, lazygit, ghostty)
export FZF_DEFAULT_OPTS="--height=40% --layout=reverse --border=rounded --info=inline-right \
  --color=bg:#0F131A,bg+:#1F2430,fg:#CCCAC2,fg+:#CCCAC2,hl:#5CCFE6,hl+:#5CCFE6 \
  --color=border:#1F2430,prompt:#5CCFE6,pointer:#FFCC66,marker:#FFCC66,spinner:#5CCFE6,info:#6C7380,header:#6C7380,gutter:#0F131A"
export BAT_THEME=ansi   # ansi = use the terminal's (Ayu) palette
