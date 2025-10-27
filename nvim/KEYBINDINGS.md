# Neovim Keybindings Reference

**Leader key:** `SPACE`
**Pro tip:** Press `SPACE` and wait - which-key will show you all available commands!

> 📖 **New!** Check out [VISUAL_IMPROVEMENTS.md](./VISUAL_IMPROVEMENTS.md) to see all the visual enhancements (smooth animations, beautiful statusline, modern UI, and more)!

## 🚀 Essential Commands (Start Here)

| Key | Action | Notes |
|-----|--------|-------|
| `jk` | Exit insert mode | From insert mode |
| `SPACE` | Show command menu | Wait for which-key popup |
| `Cmd+b` | Toggle sidebar | nvim-tree file explorer (VSCode-style) |
| `<leader>e` | Toggle sidebar | Alternative to Cmd+b |
| `-` | Open parent directory | Oil.nvim (edit filesystem like buffer) |

## 📁 File Explorers

You have **two file explorers** - pick the one that fits your workflow:

### nvim-tree (VSCode-style Sidebar)
Persistent sidebar on the right, great for browsing project structure.

| Key | Action |
|-----|--------|
| `Cmd+b` | Toggle sidebar (like VSCode) |
| `<leader>e` | Toggle sidebar (alternative) |
| `<leader>ef` | Focus sidebar |
| `<leader>ec` | Find current file in sidebar |
| `<leader>eC` | Collapse all folders |

**Inside nvim-tree:**
- `Enter` - Open file/folder
- `o` - Open file/folder
- `a` - Create new file/folder
- `d` - Delete file/folder (sends to trash)
- `r` - Rename file/folder
- `x` - Cut file/folder
- `c` - Copy file/folder
- `p` - Paste file/folder
- `y` - Copy filename
- `Y` - Copy relative path
- `gy` - Copy absolute path
- `R` - Refresh tree
- `H` - Toggle hidden files
- `I` - Toggle git ignored files
- `q` - Close tree
- `W` - Collapse all folders
- `E` - Expand all folders
- `s` - Open file in vertical split
- `i` - Open file in horizontal split
- `t` - Open file in new tab

### Oil.nvim (Vim-native Filesystem Editor)
Edit your filesystem like a text buffer - very powerful!

| Key | Action |
|-----|--------|
| `-` | Open parent directory |
| `<leader>pv` | Open file explorer |
| `<leader>-` | Open parent (floating window) |

**Inside Oil:**
- Edit filenames directly like text
- `<CR>` - Open file/directory
- `-` - Go up to parent directory
- `g.` - Toggle hidden files
- `<C-p>` - Preview file
- Save buffer (`:w`) to apply changes (renames, deletes, etc.)
- Delete lines to delete files (on save)
- Create new lines and type names to create files

**Which to use?**
- Use **nvim-tree** for browsing and quick navigation (more familiar from VSCode)
- Use **Oil** for bulk operations like renaming multiple files (more powerful)

## 🔍 Finding Files & Code (Telescope)

All start with `<leader>f`:

| Key | Action | Use Case |
|-----|--------|----------|
| `<leader>ff` | Find files | Quick file open |
| `<leader>fa` | Find all files | Including ignored files |
| `<leader>fg` | Live grep | Search text in all files |
| `<leader>fw` | Find word | Search word under cursor |
| `<leader>fb` | Find buffers | Switch between open files |
| `<leader>fo` | Recent files | Recently opened |
| `<leader>/` | Search buffer | Search in current file |
| `<leader>f/` | Search open buffers | Search across all open files |
| `<leader>fG` | Git files | Files tracked by git |
| `<leader>fc` | Git commits | Browse commits |
| `<leader>fs` | Document symbols | Jump to functions/classes |
| `<leader>fd` | Diagnostics | Show all errors/warnings |
| `<leader>fr` | Resume picker | Reopen last telescope window |

**Telescope shortcuts while in picker:**
- `<C-x>` - Open in horizontal split
- `<C-v>` - Open in vertical split
- `<C-t>` - Open in new tab
- `<C-j/k>` - Move up/down
- `<C-q>` - Send to quickfix list

## 📦 Buffer Management

| Key | Action | Notes |
|-----|--------|-------|
| `Shift+h` | Previous buffer | Or `[b` |
| `Shift+l` | Next buffer | Or `]b` |
| `<leader>bd` | Delete buffer | Close current file |
| `<leader>bo` | Close others | Keep only current buffer |
| `<leader>fb` | Buffer picker | Telescope buffer picker |

**Harpoon (Quick file marks):**
- `Ctrl+e` - Toggle harpoon menu
- `Ctrl+i` - Add file to harpoon
- `<leader>1/2/3/4` - Jump to harpooned file 1-4

## 🪟 Window Splits

### Create & Manage
| Key | Action |
|-----|--------|
| `<leader>sv` | Split vertical |
| `<leader>sh` | Split horizontal |
| `<leader>sx` | Close split |
| `<leader>so` | Close all other splits |
| `<leader>se` | Make splits equal size |
| `<leader>st` | Toggle split orientation |

### Navigate
| Key | Action |
|-----|--------|
| `Ctrl+h` | Go to left split |
| `Ctrl+l` | Go to right split |
| `Ctrl+k` | Go to upper split |
| `Ctrl+j` | Go to lower split |
| `<leader>sw` | Swap to next window |

### Resize
| Key | Action |
|-----|--------|
| `Ctrl+←/→` | Decrease/increase width (by 2) |
| `Ctrl+↑/↓` | Increase/decrease height (by 2) |
| `<leader>s+/-` | Increase/decrease height (by 5) |
| `<leader>s</>` | Decrease/increase width (by 5) |

### Move Splits
| Key | Action |
|-----|--------|
| `<leader>sH` | Move split left |
| `<leader>sL` | Move split right |
| `<leader>sK` | Move split up |
| `<leader>sJ` | Move split down |

## 💻 Code Editing

### Comments (Comment.nvim)
| Key | Action | Mode |
|-----|--------|------|
| `gcc` | Toggle line comment | Normal |
| `gc` | Toggle comment | Visual (select lines) |
| `gbc` | Toggle block comment | Normal |
| `gcO` | Comment line above | Normal |
| `gco` | Comment line below | Normal |
| `gcA` | Comment end of line | Normal |

### Surround (mini.surround)
| Key | Action | Example |
|-----|--------|---------|
| `gsa` | Add surrounding | `gsaiw"` - surround word with quotes |
| `gsd` | Delete surrounding | `gsd"` - delete surrounding quotes |
| `gsr` | Replace surrounding | `gsr"'` - replace " with ' |
| `gsf` | Find surrounding (right) | Navigate to next pair |
| `gsF` | Find surrounding (left) | Navigate to previous pair |

### Auto-pairs
Automatically closes brackets, quotes, etc. (via mini.pairs)
- Type `(` → automatically adds `)`
- Type `"` → automatically adds `"`

## 🔧 LSP & Diagnostics (CoC)

### Navigation
| Key | Action |
|-----|--------|
| `gd` | Go to definition |
| `gy` | Go to type definition |
| `gi` | Go to implementation |
| `gr` | Go to references |
| `K` | Show documentation |

### Code Actions
| Key | Action |
|-----|--------|
| `<leader>rn` | Rename symbol |
| `<leader>ac` | Code action (cursor) |
| `<leader>as` | Code action (source) |
| `<leader>qf` | Quick fix |
| `<leader>re` | Refactor |

### Diagnostics (Trouble.nvim)
| Key | Action |
|-----|--------|
| `<leader>xx` | Toggle diagnostics panel |
| `<leader>xX` | Buffer diagnostics only |
| `<leader>xs` | Document symbols |
| `<leader>xl` | LSP definitions/references |
| `<leader>xq` | Quickfix list |
| `]x` | Next diagnostic |
| `[x` | Previous diagnostic |

## ⚡ Flash Motions (Enhanced Navigation)

| Key | Action | Usage |
|-----|--------|-------|
| `s` | Flash jump | Type 2 chars, see jump labels |
| `S` | Flash treesitter | Jump to code structures |
| `f/F/t/T` | Enhanced f/t | Same as vim but enhanced |

**How Flash works:**
1. Press `s`
2. Type 2 characters you want to jump to
3. See labels appear on all matches
4. Type the label to jump there

## 🌿 Git (Gitsigns + LazyGit)

### Hunks
| Key | Action |
|-----|--------|
| `]c` | Next hunk |
| `[c` | Previous hunk |
| `<leader>hs` | Stage hunk |
| `<leader>hr` | Reset hunk |
| `<leader>hS` | Stage buffer |
| `<leader>hR` | Reset buffer |
| `<leader>hp` | Preview hunk |
| `<leader>hb` | Blame line |
| `<leader>hd` | Diff this |

### Git UI
| Key | Action |
|-----|--------|
| `<leader>lg` | Open LazyGit |
| `<leader>tb` | Toggle git blame |

## 📝 Editing Shortcuts

| Key | Action | Mode |
|-----|--------|------|
| `Cmd+j/k` | Move line down/up | Normal |
| `Cmd+j/k` | Move selection down/up | Visual |
| `Ctrl+c` | Copy entire file | Normal |

## 🎨 Toggles

| Key | Action |
|-----|--------|
| `<leader>tb` | Toggle git blame |
| `<leader>tw` | Toggle word diff |

---

## 💡 Learning Tips

1. **Start with the essentials**: Learn `Cmd+b`, `<leader>ff`, `<leader>fg`, `gcc`, and `gd` first
2. **Use which-key**: Press `SPACE` and wait - it shows you everything!
3. **Use nvim-tree**: `Cmd+b` for a familiar sidebar experience (just like VSCode!)
4. **Practice Flash**: Use `s` instead of `/` for quick navigation
5. **Master splits**: `<leader>sv` + `Ctrl+h/j/k/l` for navigation
6. **Learn surround**: `gsaiw"` (surround word with quotes) is powerful
7. **Use Harpoon**: Mark your most-used files with `Ctrl+i`, access with `<leader>1-4`

## 🔄 Coming from VSCode?

| VSCode | Neovim Equivalent | Notes |
|--------|-------------------|-------|
| `Cmd+B` | `Cmd+b` | Toggle sidebar (works exactly the same!) |
| `Cmd+P` | `<leader>ff` | Find files |
| `Cmd+Shift+F` | `<leader>fg` | Search in all files |
| `Cmd+Shift+P` | `SPACE` | Command palette (wait for which-key) |
| `Cmd+/` | `gcc` | Toggle line comment |
| `F12` | `gd` | Go to definition |
| `Shift+F12` | `gr` | Find all references |
| `Cmd+Tab` | `Shift+h/l` | Switch between files |
| `Cmd+W` | `<leader>bd` | Close current file |
| `Ctrl+\`` | `<leader>sv` | Create vertical split |
| **File Explorer** | | |
| Click files in sidebar | Same in nvim-tree! | Use `Cmd+b` to open |
| Rename in sidebar | `r` in nvim-tree | Much faster! |
| Delete in sidebar | `d` in nvim-tree | Sends to trash |

## 📚 Further Reading

- Vim motions: `:help motion.txt`
- Keymaps: `:help key-notation`
- Plugin docs: `:help <plugin-name>` (e.g., `:help telescope`)
