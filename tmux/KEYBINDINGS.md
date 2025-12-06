# Tmux Keybindings Reference

**Prefix key:** `Ctrl+a` (instead of default `Ctrl+b`)

**Pro tip:** Press `Ctrl+a` then `?` to see all keybindings in tmux!

## 🚀 Essential Commands (Start Here)

| Key | Action | Notes |
|-----|--------|-------|
| `Ctrl+a` | Prefix | Press before other commands |
| `Ctrl+a ?` | Show all keybindings | Help menu |
| `Ctrl+a r` | Reload config | Apply changes |
| `Ctrl+a d` | Detach from session | Session keeps running |
| `tmux attach` | Reattach to session | From terminal |

## 🪟 Window Management

Windows are like tabs in a browser - separate full-screen views.

| Key | Action |
|-----|--------|
| `Ctrl+a c` | Create new window |
| `Ctrl+a ,` | Rename current window |
| `Ctrl+a &` | Kill current window |
| `Ctrl+a X` | Kill current window (custom, no confirm) |
| `Ctrl+a w` | List all windows |
| `Ctrl+a n` | Next window |
| `Ctrl+a p` | Previous window |
| `Ctrl+a 0-9` | Switch to window 0-9 |
| `Alt+1-9` | Quick switch to window 1-9 |
| `Ctrl+a l` | Toggle to last window |
| `Ctrl+a <` | Move window left |
| `Ctrl+a >` | Move window right |

## 📱 Pane Management

Panes are split views within a window - like splits in nvim.

### Creating Panes
| Key | Action | Notes |
|-----|--------|-------|
| `Ctrl+a \|` | Split vertically | Creates pane to the right |
| `Ctrl+a -` | Split horizontally | Creates pane below |

### Navigating Panes
**Seamless with nvim!** These keys work whether you're in tmux or nvim:

| Key | Action |
|-----|--------|
| `Ctrl+h` | Go to left pane |
| `Ctrl+j` | Go to pane below |
| `Ctrl+k` | Go to pane above |
| `Ctrl+l` | Go to right pane |

**Backup navigation (with prefix):**
| Key | Action |
|-----|--------|
| `Ctrl+a h` | Go to left pane |
| `Ctrl+a j` | Go to pane below |
| `Ctrl+a k` | Go to pane above |
| `Ctrl+a l` | Go to right pane |

### Resizing Panes
| Key | Action |
|-----|--------|
| `Ctrl+a H` | Resize left (5 columns) |
| `Ctrl+a J` | Resize down (5 rows) |
| `Ctrl+a K` | Resize up (5 rows) |
| `Ctrl+a L` | Resize right (5 columns) |
| `Alt+z` | Toggle pane zoom (fullscreen) |

### Other Pane Actions
| Key | Action |
|-----|--------|
| `Ctrl+a x` | Kill current pane (custom, no confirm) |
| `Ctrl+a z` | Toggle pane zoom |
| `Ctrl+a {` | Swap pane with previous |
| `Ctrl+a }` | Swap pane with next |
| `Ctrl+a q` | Show pane numbers |
| `Ctrl+a q 0-9` | Jump to pane by number |
| `Ctrl+a o` | Cycle through panes |
| `Ctrl+a Space` | Toggle pane layouts |
| `Ctrl+a !` | Break pane into new window |

## 📋 Session Management

Sessions are independent tmux instances - great for different projects.

| Key | Action | Notes |
|-----|--------|-------|
| `Ctrl+a s` | List sessions | Choose and switch |
| `Ctrl+a $` | Rename session | |
| `Ctrl+a (` | Previous session | |
| `Ctrl+a )` | Next session | |
| `Ctrl+a Ctrl+j` | Fuzzy session switcher | Uses fzf! |

**From terminal:**
| Command | Action |
|---------|--------|
| `tmux` | Start new session |
| `tmux new -s name` | Start session with name |
| `tmux ls` | List sessions |
| `tmux attach` | Attach to last session |
| `tmux attach -t name` | Attach to specific session |
| `tmux kill-session -t name` | Kill specific session |

## 📝 Copy Mode

Scroll back through terminal history and copy text.

### Entering Copy Mode
| Key | Action |
|-----|--------|
| `Ctrl+a [` | Enter copy mode |
| `Ctrl+a Enter` | Enter copy mode (custom) |
| `Ctrl+a PgUp` | Enter copy mode and page up |

### In Copy Mode (Vim-style)
| Key | Action |
|-----|--------|
| `h/j/k/l` | Move cursor |
| `w/b` | Jump word forward/backward |
| `0/$` | Start/end of line |
| `g/G` | Top/bottom of history |
| `Ctrl+u/d` | Half page up/down |
| `Ctrl+b/f` | Full page up/down |
| `/` | Search forward |
| `?` | Search backward |
| `n/N` | Next/previous search match |
| `v` | Start selection |
| `V` | Start line selection |
| `Ctrl+v` | Start block selection |
| `y` | Copy selection (yank) |
| `Escape` | Cancel/exit |
| `q` | Exit copy mode |

### Paste
| Key | Action |
|-----|--------|
| `Ctrl+a p` | Paste buffer |
| `Ctrl+a =` | Choose from paste buffers |

## 🎨 Visual & UI

### Status Bar
The status bar shows:
- **Left:** Session name (cyan background)
- **Center:** Windows list (current window highlighted)
- **Right:** Date and time

### Pane Borders
- **Inactive panes:** Dark gray borders
- **Active pane:** Cyan border (matches your nvim theme!)

### Colors
Themed to match your Ayu nvim setup:
- Background: `#0F131A` (dark)
- Accent: `#5CCFE6` (cyan)
- Text: `#CCCAC2` (light gray)

## 🔧 Plugins

Your tmux is enhanced with these plugins:

### tmux-sensible
Better default settings (auto-installed).

### tmux-better-mouse-mode
Improved mouse scrolling in copy mode.

### tmux-yank
Copy to system clipboard automatically.
- Selections in copy mode auto-copy to macOS clipboard
- Works with `pbcopy`

### tmux-resurrect
Save and restore tmux sessions.
| Key | Action |
|-----|--------|
| `Ctrl+a Ctrl+s` | Save session |
| `Ctrl+a Ctrl+r` | Restore session |

### tmux-continuum
Auto-saves sessions every 15 minutes.
- Sessions persist across reboots
- Restores automatically when tmux starts

### tmux-prefix-highlight
Shows when prefix is active in status bar.
- Yellow indicator when `Ctrl+a` is pressed
- Green indicator in copy mode

## 🎯 Pro Tips

### 1. Seamless Nvim Integration
Navigate between tmux panes and nvim splits with the same keys (`Ctrl+h/j/k/l`)!

### 2. Mouse Support
- Click to select pane
- Drag border to resize
- Right-click for context menu
- Scroll to scroll (in copy mode automatically)

### 3. Quick Window Switching
Use `Alt+1` through `Alt+9` to jump to windows without prefix!

### 4. Session Workflow
```bash
# Start a session for each project
tmux new -s work
tmux new -s personal
tmux new -s learning

# Switch between them
Ctrl+a s  # then arrow keys and Enter
```

### 5. Copy Mode Tricks
- Enter copy mode with `Ctrl+a [`
- Use vim motions to navigate
- Search with `/`
- Select with `v`
- Copy with `y`
- Paste with `Ctrl+a p`

### 6. Layout Presets
Press `Ctrl+a Space` repeatedly to cycle through:
- Even horizontal
- Even vertical
- Main horizontal
- Main vertical
- Tiled

### 7. Zoom for Focus
- `Alt+z` to zoom current pane fullscreen
- `Alt+z` again to restore layout
- Perfect for focusing on one task!

## 🔄 Common Workflows

### Starting Your Day
```bash
# Start tmux
tmux

# Create windows for different tasks
Ctrl+a c  # new window
Ctrl+a ,  # rename it "code"

Ctrl+a c  # another window
Ctrl+a ,  # rename it "terminal"

Ctrl+a c  # another window
Ctrl+a ,  # rename it "logs"
```

### Splitting for Side-by-Side Work
```bash
# Open a file in nvim
nvim file.ts

# Split tmux pane vertically
Ctrl+a |

# Now you have code on left, terminal on right
# Navigate between them with Ctrl+h and Ctrl+l
```

### Detach and Resume
```bash
# Working on something...
# Need to close laptop?

Ctrl+a d  # Detach

# Later, back at desk:
tmux attach  # Everything is exactly how you left it!
```

## 🐛 Troubleshooting

### Colors Look Wrong
Make sure your terminal supports 256 colors:
```bash
echo $TERM  # Should show "screen-256color" or similar in tmux
```

### Ctrl+h/j/k/l Not Working
The smart pane navigation requires the nvim check. If it's not working:
1. Make sure you're running nvim inside tmux (not the other way around)
2. Try the backup: `Ctrl+a h/j/k/l`

### Plugins Not Working
Install them manually:
```bash
Ctrl+a I  # Capital I to install plugins
```

### Mouse Not Working
Check that mouse support is enabled:
```bash
tmux show-options -g | grep mouse
# Should show: mouse on
```

## 📚 Learning Path

**Week 1:** Learn basic navigation
- Windows: `Ctrl+a c`, `Ctrl+a 1-9`
- Panes: `Ctrl+a |`, `Ctrl+a -`, `Ctrl+h/j/k/l`
- Detach/attach: `Ctrl+a d`, `tmux attach`

**Week 2:** Master pane management
- Resize: `Ctrl+a H/J/K/L`
- Zoom: `Alt+z`
- Layouts: `Ctrl+a Space`

**Week 3:** Advanced features
- Copy mode: `Ctrl+a [`, vim motions
- Sessions: `Ctrl+a s`, multiple projects
- Custom workflows

## 🔗 Integration with Your Workflow

### With Nvim
Your nvim and tmux work seamlessly:
- Same `Ctrl+h/j/k/l` navigation
- Same Ayu color theme
- Split terminals while editing

### With Git
```bash
# One window for code
Ctrl+a c
nvim .

# Another for git commands
Ctrl+a c
lazygit  # or git commands

# Switch between them with Ctrl+a 1 and Ctrl+a 2
```

### With Multiple Projects
```bash
# Create session per project
tmux new -s project-a
cd ~/projects/a && nvim

# Detach
Ctrl+a d

# Create another session
tmux new -s project-b
cd ~/projects/b && nvim

# Switch between projects
Ctrl+a s  # or Ctrl+a Ctrl+j for fuzzy finder
```

---

**Happy tmuxing!** 🎉

For more help: `man tmux` or `Ctrl+a ?` inside tmux
