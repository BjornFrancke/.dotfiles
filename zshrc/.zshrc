# Banner (must run before instant prompt preamble to avoid p10k console-output warning)
echo "
 _____  ____    ____  ____     __  __  _    ___
|     ||    \\  /    T|    \\   /  ]|  l/ ]  /  _]
|   __j|  D  )Y  o  ||  _  Y /  / |  ' /  /  [_
|  l_  |    / |     ||  |  |/  /  |    \\ Y    _]
|   _] |    \\ |  _  ||  |  /   \\_ |     Y|   [_
|  T   |  .  Y|  |  ||  |  \\     ||  .  ||     T
l__j   l__j\\_jl__j__jl__j__j\\____jl__j\\_jl_____j
"

# Enable Powerlevel10k instant prompt (keep at top)
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
    source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Homebrew (skips the fork if a login shell already ran shellenv)
[[ -z $HOMEBREW_PREFIX ]] && eval "$(/opt/homebrew/bin/brew shellenv)"

# Oh My Zsh
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="robbyrussell"
plugins=(git macos gh)
source $ZSH/oh-my-zsh.sh

# Source modular config files
source ~/dotfiles/zshrc/exports.zsh
source ~/dotfiles/zshrc/aliases.zsh
source ~/dotfiles/zshrc/functions.zsh
source ~/dotfiles/zshrc/history.zsh

# Powerlevel10k
source $HOMEBREW_PREFIX/share/powerlevel10k/powerlevel10k.zsh-theme
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
typeset -g POWERLEVEL9K_INSTANT_PROMPT=quiet

# Zsh plugins
source $HOMEBREW_PREFIX/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source $HOMEBREW_PREFIX/share/zsh-autosuggestions/zsh-autosuggestions.zsh

# fzf (Ctrl-R history, Ctrl-T files, Alt-C cd)
source <(fzf --zsh)

# NVM
#[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
#[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

# Mise
eval "$(mise activate zsh)"

# Google Cloud SDK
if [ -f "$HOME/google-cloud-sdk/path.zsh.inc" ]; then
    source "$HOME/google-cloud-sdk/path.zsh.inc"
fi
if [ -f "$HOME/google-cloud-sdk/completion.zsh.inc" ]; then
    source "$HOME/google-cloud-sdk/completion.zsh.inc"
fi

# Machine-specific config (not tracked in git)
[[ -f ~/dotfiles/zshrc/local.zsh ]] && source ~/dotfiles/zshrc/local.zsh
