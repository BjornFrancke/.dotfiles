# Neovim Split Window Cheat Sheet

## Basic Split Operations

- `<leader>sv` - Split window vertically (side by side)
- `<leader>sh` - Split window horizontally (top/bottom)
- `<leader>sx` - Close current split
- `<leader>se` - Make all splits equal size
- `<leader>ss` - Split current buffer vertically
- `<leader>so` - Close all other splits (focus current)

## Navigation Between Splits

- `<Ctrl-h>` - Go to left split
- `<Ctrl-l>` - Go to right split
- `<Ctrl-k>` - Go to upper split
- `<Ctrl-j>` - Go to lower split
- `<leader>sw` - Cycle to next window

## Resizing Splits

### Using Arrow Keys:

- `<Ctrl-Up>` - Increase split height
- `<Ctrl-Down>` - Decrease split height
- `<Ctrl-Left>` - Decrease split width
- `<Ctrl-Right>` - Increase split width

### Using Leader Key:

- `<leader>s+` - Increase split height (bigger steps)
- `<leader>s-` - Decrease split height (bigger steps)
- `<leader>s<` - Decrease split width (bigger steps)
- `<leader>s>` - Increase split width (bigger steps)

## Advanced Split Management

- `<leader>st` - Toggle between vertical/horizontal split (works with 2 windows)
- `<leader>sH` - Move current split to the left
- `<leader>sL` - Move current split to the right
- `<leader>sK` - Move current split to the top
- `<leader>sJ` - Move current split to the bottom

## Focus.nvim Commands (Better Split Creation)

- `<leader>wh` - Create focused split to the left
- `<leader>wl` - Create focused split to the right
- `<leader>wk` - Create focused split above
- `<leader>wj` - Create focused split below
- `<leader>ww` - Create split in the best location
- `<leader>we` - Equalize all splits
- `<leader>wm` - Maximize current split (toggle)

## Opening Files in Splits (via Telescope)

When in Telescope (after `<leader>ff`, `<leader>fg`, etc.):

- `<Ctrl-v>` - Open selected file in vertical split
- `<Ctrl-x>` - Open selected file in horizontal split
- `<Ctrl-t>` - Open selected file in new tab
- `<Enter>` - Open in current window

## Line Movement (Updated)

- `<Alt-j>` - Move current line down (normal mode)
- `<Alt-k>` - Move current line up (normal mode)
- `<Alt-j>` - Move selected lines down (visual mode)
- `<Alt-k>` - Move selected lines up (visual mode)

## Common Workflows

### Side-by-Side Editing (Most Common)

1. Open first file
2. `<leader>sv` to create vertical split
3. `<leader>ff` to find and open second file
4. Use `<Ctrl-h>` and `<Ctrl-l>` to navigate between files

### Quick File Comparison

1. Open first file
2. `<leader>sv` for vertical split
3. `<Ctrl-l>` to move to new split
4. `<leader>fb` to list buffers and select file to compare

### Reference Documentation While Coding

1. `<leader>sh` for horizontal split
2. Open documentation in top split
3. `<Ctrl-j>` to move to bottom split for coding
4. `<leader>s-` to make doc split smaller if needed

### Maximize Focus on Current File

- `<leader>wm` to maximize current split (Focus.nvim)
- `<leader>so` to close all other splits

## Tips

- New splits open to the right and below (configured in set.lua)
- Use `<leader>se` to quickly reset split sizes if they get uneven
