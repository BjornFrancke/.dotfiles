# Modern Tmux Setup

A beautiful, easy-to-use tmux configuration designed to complement your nvim workflow.

## ✨ Features

- 🎨 **Beautiful Ayu theme** - Matches your nvim colorscheme
- ⌨️  **Intuitive keybindings** - Prefix is `Ctrl+a` (easier than `Ctrl+b`)
- 🖱️ **Full mouse support** - Click to select panes, drag to resize
- 🔄 **Seamless nvim integration** - Same `Ctrl+h/j/k/l` navigation
- 💾 **Session persistence** - Survives reboots (tmux-continuum)
- 📋 **Smart copy/paste** - Vim-style copy mode + system clipboard
- 🚀 **Easy to use** - Well-documented and beginner-friendly

## 🚀 Quick Start

### Installation

```bash
# Run the installer
cd ~/dotfiles/tmux
./install.sh
```

That's it! The script will:
1. Create symlink to `~/.tmux.conf`
2. Install TPM (Tmux Plugin Manager)
3. Install all plugins automatically

### First Steps

```bash
# Start tmux
tmux

# Create a new window
Ctrl+a c

# Split pane vertically
Ctrl+a |

# Split pane horizontally
Ctrl+a -

# Navigate with Ctrl+h/j/k/l (just like nvim!)

# Show all keybindings
Ctrl+a ?
```

## 📖 Documentation

- **[KEYBINDINGS.md](./KEYBINDINGS.md)** - Complete keybindings reference
- **[tmux.conf](./tmux.conf)** - Configuration file (well-commented)

## 🎯 Key Concepts

### Prefix Key
Press `Ctrl+a` before most commands. Think of it as the "tmux key".

### Sessions
Independent workspaces. Create one per project:
```bash
tmux new -s work      # Create "work" session
tmux new -s personal  # Create "personal" session
tmux attach -t work   # Switch to "work" session
```

### Windows
Like tabs in a browser. Switch with `Ctrl+a` then `1-9`.

### Panes
Split views within a window. Navigate with `Ctrl+h/j/k/l`.

## 🎨 Visual Design

Themed to match your Ayu nvim setup:
- **Background:** Dark (`#0F131A`)
- **Accent:** Cyan (`#5CCFE6`)
- **Active pane:** Cyan border
- **Inactive panes:** Dark gray border
- **Status bar:** Session name (left), windows (center), date/time (right)

## 🔧 Included Plugins

- **tmux-sensible** - Better defaults
- **tmux-better-mouse-mode** - Improved mouse scrolling
- **tmux-yank** - Copy to system clipboard
- **tmux-resurrect** - Save/restore sessions
- **tmux-continuum** - Auto-save sessions
- **tmux-prefix-highlight** - Visual prefix indicator
- **tmux-pain-control** - Better pane navigation

## 💡 Pro Tips

### 1. Seamless Nvim Navigation
The same `Ctrl+h/j/k/l` keys work in both tmux and nvim!
- In nvim: Navigate between splits
- In tmux: Navigate between panes
- **It just works!** 🎉

### 2. Mouse Support
- **Click** a pane to select it
- **Drag** a border to resize
- **Scroll** to scroll (enters copy mode automatically)
- **Right-click** for context menu

### 3. Quick Window Switching
Use `Alt+1` through `Alt+9` to jump directly to windows!

### 4. Session Persistence
Your sessions are auto-saved every 15 minutes and persist across reboots!

### 5. Fuzzy Session Switcher
Press `Ctrl+a` then `Ctrl+j` for a fuzzy finder of all sessions (requires fzf).

## 📝 Common Commands

### Pane Management
```bash
Ctrl+a |      # Split vertically
Ctrl+a -      # Split horizontally
Ctrl+h/j/k/l  # Navigate (no prefix needed!)
Ctrl+a H/J/K/L # Resize
Alt+z         # Zoom/unzoom pane
```

### Window Management
```bash
Ctrl+a c      # Create window
Ctrl+a ,      # Rename window
Ctrl+a 1-9    # Switch to window
Alt+1-9       # Quick switch (no prefix!)
```

### Session Management
```bash
Ctrl+a s      # List sessions
Ctrl+a d      # Detach from session
Ctrl+a Ctrl+j # Fuzzy session switcher
```

### Copy Mode
```bash
Ctrl+a [      # Enter copy mode
# Use vim motions (h/j/k/l, w/b, /, etc.)
v             # Start selection
y             # Copy
Ctrl+a p      # Paste
```

## 🔄 Workflow Examples

### Code + Terminal Side-by-Side
```bash
tmux              # Start tmux
Ctrl+a |          # Split vertically
nvim file.ts      # (left pane) Edit code
Ctrl+l            # Move to right pane
npm run dev       # (right pane) Run server
Ctrl+h            # Back to nvim
```

### Multiple Projects
```bash
# Project A
tmux new -s project-a
cd ~/code/project-a && nvim
Ctrl+a d          # Detach

# Project B
tmux new -s project-b
cd ~/code/project-b && nvim
Ctrl+a d          # Detach

# Switch between them
tmux attach -t project-a
tmux attach -t project-b
# Or use: Ctrl+a s
```

### Full Development Setup
```bash
tmux new -s dev

# Window 1: Code
nvim .
Ctrl+a ,          # Rename to "code"

# Window 2: Terminal
Ctrl+a c
Ctrl+a ,          # Rename to "terminal"

# Window 3: Logs
Ctrl+a c
tail -f logs/app.log
Ctrl+a ,          # Rename to "logs"

# Window 4: Git
Ctrl+a c
lazygit
Ctrl+a ,          # Rename to "git"

# Switch between windows with Ctrl+a 1/2/3/4
```

## 🐛 Troubleshooting

### Plugins not loading?
```bash
# Inside tmux, press:
Ctrl+a I    # Capital I to install plugins
```

### Colors look wrong?
Make sure your terminal supports 256 colors. In tmux:
```bash
echo $TERM  # Should be "screen-256color"
```

### Ctrl+a conflicts with shell?
If you use Ctrl+a to go to start of line in bash/zsh, either:
1. Press `Ctrl+a` twice to send it to the shell
2. Or change the prefix in `tmux.conf`

### Mouse not working?
Check your terminal emulator supports mouse reporting. Works in:
- iTerm2 ✅
- Alacritty ✅
- Kitty ✅
- WezTerm ✅
- Terminal.app ✅

## 📚 Learning Resources

- **Built-in help:** `Ctrl+a ?` (shows all keybindings)
- **Manual:** `man tmux`
- **KEYBINDINGS.md:** Full reference guide
- **Config:** `tmux.conf` has detailed comments

## 🎓 Learning Path

**Day 1:**
- Start tmux: `tmux`
- Split panes: `Ctrl+a |` and `Ctrl+a -`
- Navigate: `Ctrl+h/j/k/l`
- Detach: `Ctrl+a d`
- Reattach: `tmux attach`

**Week 1:**
- Create windows: `Ctrl+a c`
- Switch windows: `Ctrl+a 1-9`
- Rename windows: `Ctrl+a ,`
- Resize panes: `Ctrl+a H/J/K/L`

**Week 2:**
- Sessions: `tmux new -s name`
- Switch sessions: `Ctrl+a s`
- Copy mode: `Ctrl+a [` + vim motions
- Zoom pane: `Alt+z`

**Week 3:**
- Session workflows
- Custom layouts
- Advanced copy mode
- Plugin features

## 🔗 Integration

### With Nvim
Perfect integration! Same keybindings, same theme.

### With Lazygit
Run in a dedicated tmux window for beautiful git UI.

### With Your Shell
Persist your entire terminal workspace across sessions.

## 💬 Quick Reference Card

```
PREFIX: Ctrl+a

PANES:          WINDOWS:        SESSIONS:
| : split vert  c : new         s : list
- : split horiz , : rename      d : detach
hjkl: navigate  1-9: switch     (: previous
HJKL: resize    n : next        ): next
x : kill        p : previous

COPY MODE:      OTHER:
[ : enter       ? : help
v : select      r : reload
y : copy        : : command
p : paste       z : zoom
```

---

**Enjoy your new tmux setup!** 🚀

For help: Press `Ctrl+a ?` or read [KEYBINDINGS.md](./KEYBINDINGS.md)
