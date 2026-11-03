# Basic
alias brewup='brew update && brew upgrade'
alias lg='lazygit'
alias c='clear'
alias zshconfig='code ~/.zshrc'
alias p10color='for i in {0..255}; do print -Pn "%K{$i}  %k%F{$i}${(l:3::0:)i}%f " ${${(M)$((i%6)):#3}:+$'\n'}; done'
alias y='yarn'
alias note='echo "$(date +%F\ %R)  " >> ~/notes/'  # note quick-thought.txt
alias g='rg --line-number --heading'            # ripgrep: recursive, gitignore-aware
alias yd='yarn dev'
alias bunfo='bun prettier --write "src/**/*.{ts,js}"'
alias copyfile='pbcopy <'

##### Networking & ports #####
alias myip='curl http://ipecho.net/plain; echo' # Get public ip
alias ports='lsof -nP -iTCP -sTCP:LISTEN'  # see open TCP ports

alias nvim='NVIM_APPNAME=nvim-francke nvim'
# alias nvim='NVIM_APPNAME=nvim-francke-2 nvim'
alias vim='nvim'
alias e='$EDITOR'
##### Zellij #####
alias ze='zellij -l welcome'

##### Docker / Containers ####
alias dcom='docker-compose'
alias dps='docker ps --format "table {{.Names}}\t{{.Status}}\t{{.Ports}}"'
alias dreload='docker compose up -d --build --no-deps' # Builds and swap image -> append with service-name
alias dcnuke='docker compose down -v'

##### Drizzle kit ####
alias dkgen='bun drizzle-kit generate'
alias dkpush='bun drizzle-kit push'


##### macOS niceties #####
alias emptytrash='rm -rf ~/.Trash/*' # purge macOS Trash

# Suffix
# alias -s [extension]="preferred-tool"

alias -s ts=nvim
alias -s js=nvim

# Fancy
alias lzd='lazydocker'



# Onomondo
alias aws-login='aws sso login --profile onomondo'
