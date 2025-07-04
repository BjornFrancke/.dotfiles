# Basic
alias brewup='brew update && brew upgrade'
alias lg='lazygit'
alias lc='colorls -lA --sd' 
alias lcg='colorls --gs -t'
alias c='clear'
alias zshconfig='code ~/.zshrc'
alias p10color='for i in {0..255}; do print -Pn "%K{$i}  %k%F{$i}${(l:3::0:)i}%f " ${${(M)$((i%6)):#3}:+$'\n'}; done'
alias y='yarn'
alias note='echo "$(date +%F\ %R)  " >> ~/notes/'  # note quick-thought.txt
alias g='grep --color=auto -nH '                 # base grep, line-nums + filename
alias yd='yarn dev'
alias bunfo='bun prettier --write "src/**/*.{ts,js}"'

##### Networking & ports #####
alias speed='speedtest-cli' # Quickly test internet speed
alias myip='curl http://ipecho.net/plain; echo' # Get public ip
alias ports='lsof -nP -iTCP -sTCP:LISTEN'  # see open TCP ports


##### Zellij #####
alias ze='zellij -l welcome'
alias yaze='zellij -l welcome --config-dir ~/.config/yazelix/zellij options --layout-dir ~/.config/yazelix/zellij/layout'
alias yase='nu -c "zellij -l welcome --config-dir ~/.config/yazelix/zellij options --layout-dir ~/.config/yazelix/zellij/layouts"'
alias sidepanel='env YAZI_CONFIG_HOME=~/.config/yazelix/yazi/sidebar yazi'

##### Docker / Containers ####
alias dcom='docker-compose'
alias dps='docker ps --format "table {{.Names}}\t{{.Status}}\t{{.Ports}}"'
alias dreload='docker compose up -d --build --no-deps' # Builds and swap image -> append with service-name

##### macOS niceties #####
alias emptytrash='rm -rf ~/.Trash/*' # purge macOS Trash

# Suffix
# alias -s [extension]="preferred-tool"

alias -s ts=nvim
alias -s js=nvim

# Fancy

# Make directory and enter it
mdd() { 
    mkdir -p $1
    cd $1
}
