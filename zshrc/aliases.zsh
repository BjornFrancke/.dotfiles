# Basic
alias brewup='brew update && brew upgrade'
alias lg='lazygit'
alias lc='colorls -lA --sd' 
alias lcg='colorls --gs -t'

alias zshconfig='code ~/.zshrc'
alias p10color='for i in {0..255}; do print -Pn "%K{$i}  %k%F{$i}${(l:3::0:)i}%f " ${${(M)$((i%6)):#3}:+$'\n'}; done'

alias y='yarn'
alias yd='yarn dev'
alias bunfo='bun prettier --write "src/**/*.{ts,js}"'

# Zellij
alias ze='zellij -l welcome'
alias yaze='zellij -l welcome --config-dir ~/.config/yazelix/zellij options --layout-dir ~/.config/yazelix/zellij/layout'
alias yase='nu -c "zellij -l welcome --config-dir ~/.config/yazelix/zellij options --layout-dir ~/.config/yazelix/zellij/layouts"'
alias sidepanel='env YAZI_CONFIG_HOME=~/.config/yazelix/yazi/sidebar yazi'

# Docker-compose
alias dcom='docker-compose'

