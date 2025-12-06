# Shell functions

# Make directory and enter it
mdd() {
    mkdir -p "$1" && cd "$1"
}

# Extract any archive
extract() {
    if [[ -f "$1" ]]; then
        case "$1" in
            *.tar.bz2) tar xjf "$1" ;;
            *.tar.gz)  tar xzf "$1" ;;
            *.tar.xz)  tar xJf "$1" ;;
            *.bz2)     bunzip2 "$1" ;;
            *.gz)      gunzip "$1" ;;
            *.tar)     tar xf "$1" ;;
            *.tbz2)    tar xjf "$1" ;;
            *.tgz)     tar xzf "$1" ;;
            *.zip)     unzip "$1" ;;
            *.Z)       uncompress "$1" ;;
            *.7z)      7z x "$1" ;;
            *.rar)     unrar x "$1" ;;
            *)         echo "'$1' cannot be extracted via extract()" ;;
        esac
    else
        echo "'$1' is not a valid file"
    fi
}

# Quick look at a file (macOS)
ql() {
    qlmanage -p "$@" &>/dev/null
}

# Create a new directory and open it in editor
mkproj() {
    mkdir -p "$1" && cd "$1" && $EDITOR .
}

# Find process by name
psg() {
    ps aux | grep -i "$1" | grep -v grep
}

# Kill process by port
killport() {
    lsof -ti :"$1" | xargs kill -9 2>/dev/null || echo "No process on port $1"
}

# Git clone and cd into it
gclone() {
    git clone "$1" && cd "$(basename "$1" .git)"
}
