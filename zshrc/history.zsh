# Zsh history configuration

# History file location
HISTFILE=~/.zsh_history

# History size
HISTSIZE=50000              # Commands kept in memory per session
SAVEHIST=50000              # Commands saved to history file

# History behavior
setopt SHARE_HISTORY        # Share history across all terminals
setopt HIST_IGNORE_ALL_DUPS # Remove older duplicate when adding new
setopt HIST_IGNORE_SPACE    # Commands starting with space aren't saved
setopt HIST_REDUCE_BLANKS   # Remove extra whitespace
setopt HIST_VERIFY          # Show command before executing from history
setopt INC_APPEND_HISTORY   # Save commands immediately, not on shell exit
setopt EXTENDED_HISTORY     # Save timestamp and duration
