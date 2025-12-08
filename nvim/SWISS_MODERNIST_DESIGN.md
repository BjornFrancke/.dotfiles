# Swiss Modernist Design System

Your nvim now features a **Swiss International Typographic Style** design - clean, geometric, and timeless.

## 🎨 Design Philosophy

**Swiss Style** (also called International Typographic Style) emerged in Switzerland in the 1950s and is characterized by:

- **Grid-based layouts** - Mathematical precision
- **Sans-serif typography** - Clean, legible
- **Asymmetric compositions** - Dynamic but balanced
- **Negative space** - "White space" is design element
- **Objective presentation** - Content over decoration
- **Limited color palette** - Often monochrome + one accent
- **Geometric forms** - Circles, squares, straight lines

## 🎨 Color Palette

### Monochromatic Base
```
Black:       #0A0A0A  ████  Primary background
Dark Gray:   #1A1A1A  ████  Secondary surfaces
Medium Gray: #2A2A2A  ████  UI elements
Light Gray:  #909090  ████  Secondary text
White:       #E8E8E8  ████  Primary text
```

### Swiss Red (Signature Accent)
```
Swiss Red:   #E84A4A  ████  Primary accent - keywords, highlights
Red Dark:    #C23030  ████  Hover states, errors
```

### Functional Colors (Minimal Use)
```
Warning:     #F0A020  ████  Warnings only
Success:     #50A050  ████  Success states
Blue:        #6090D0  ████  Functions, insert mode
Cyan:        #50A0A0  ████  Numbers, command mode
```

## 📐 Visual Elements

### Borders
**Geometric, box-drawing characters:**
```
╔═══════════╗
║  Content  ║
╚═══════════╝
```

All floating windows use these precise, grid-based borders instead of rounded corners.

### Separators
**Statusline uses vertical bars:**
```
│  Section A  │  Section B  │
```

**Window separators are clean lines:**
```
║  for active borders
│  for dividers
```

### Layout Principles
- **Asymmetric but balanced** - Statusline doesn't center-align
- **Grid-based** - Everything aligns to an invisible grid
- **Negative space** - Breathing room around elements
- **Hierarchy** - Swiss red for most important elements

## 🖥️ UI Components

### Dashboard (Alpha)
- Geometric ASCII art with box-drawing characters
- Clean typography
- Mathematical spacing (golden ratio influence)
- Swiss red header
- Minimal footer with precise timestamp

### Statusline (Lualine)
- **Normal mode:** Swiss red indicator
- **Insert mode:** Blue indicator
- **Visual mode:** Magenta indicator
- **Geometric separators:** `│` and `▌▐`
- **Asymmetric layout:** Content not centered (Swiss style)

### Borders
All floating windows feature:
- Double-line box-drawing characters (╔═╗║╝═╚║)
- Swiss red color (`#E84A4A`)
- Precise corners and alignment

### Syntax Highlighting
**Reduced palette for visual clarity:**

- **Keywords:** Swiss red, bold (most important)
- **Functions:** Blue (secondary hierarchy)
- **Strings:** Green
- **Numbers:** Cyan
- **Comments:** Light gray, italic (least prominent)
- **Types:** Yellow
- **Operators:** Light gray (recede into background)

### Indent Guides
Rainbow colors updated to match Swiss palette:
- More muted, geometric appearance
- Scope highlighting uses Swiss red

## 🎯 Key Features

### 1. **Geometric Precision**
Everything uses straight lines, right angles, and mathematical proportions.

### 2. **Monochrome + Red**
Classic Swiss design uses limited color - black, white, gray, plus one bold accent (red).

### 3. **Typography Focus**
Clean, legible text is the priority. No decorative elements that distract.

### 4. **Grid System**
All elements align to an invisible grid for perfect balance.

### 5. **Asymmetric Balance**
Unlike centered designs, Swiss style uses dynamic asymmetry that still feels balanced.

## 📋 What Changed

### New/Modified Files
1. **`modernist-theme.lua`** - Swiss color palette and syntax highlighting
2. **`dashboard.lua`** - Geometric ASCII art startup screen
3. **`lualine.lua`** - Updated with Swiss theme and geometric separators
4. **`set.lua`** - Box-drawing borders for all floating windows
5. **`colorscheme.lua`** - Disabled (kept as backup)

### Visual Changes
- ✅ **Dashboard** with geometric ASCII art
- ✅ **Box-drawing borders** on all floating windows
- ✅ **Swiss red** as primary accent color
- ✅ **Monochromatic** base (black/gray/white)
- ✅ **Geometric separators** in statusline
- ✅ **Asymmetric layout** in statusline
- ✅ **Reduced syntax palette** for clarity
- ✅ **Mathematical spacing** throughout

## 🎨 Customization

### Change the Accent Color
Edit `modernist-theme.lua`:
```lua
swiss_red = "#E84A4A",  -- Change this to any color
```

Try these classic Swiss alternatives:
- `#E84A4A` - Classic Swiss red (current)
- `#0066CC` - International Klein Blue
- `#FFD700` - Bauhaus yellow
- `#000000` - Pure black (ultra-minimal)

### Adjust Border Style
Edit `set.lua`:
```lua
-- Current: Double-line box
local border_chars = {
	{ "╔", "FloatBorder" },
	{ "═", "FloatBorder" },
	-- ...
}

-- Alternative: Single-line box
local border_chars = {
	{ "┌", "FloatBorder" },
	{ "─", "FloatBorder" },
	{ "┐", "FloatBorder" },
	{ "│", "FloatBorder" },
	{ "┘", "FloatBorder" },
	{ "─", "FloatBorder" },
	{ "└", "FloatBorder" },
	{ "│", "FloatBorder" },
}

-- Alternative: Heavy box
local border_chars = {
	{ "┏", "FloatBorder" },
	{ "━", "FloatBorder" },
	{ "┓", "FloatBorder" },
	{ "┃", "FloatBorder" },
	{ "┛", "FloatBorder" },
	{ "━", "FloatBorder" },
	{ "┗", "FloatBorder" },
	{ "┃", "FloatBorder" },
}
```

### Change Statusline Separators
Edit `lualine.lua`:
```lua
component_separators = { left = "│", right = "│" },
section_separators = { left = "▌", right = "▐" },

-- Try these alternatives:
-- Minimal: { left = "", right = "" }
-- Blocks: { left = "█", right = "█" }
-- Triangles: { left = "▶", right = "◀" }
```

### Revert to Old Theme
To switch back to the original Ayu theme:
1. Comment out `modernist-theme.lua` (add `enabled = false`)
2. Uncomment the code in `colorscheme.lua`
3. Restart nvim

## 🎓 Swiss Design Principles Applied

### 1. **Less is More**
- Removed unnecessary decorations
- Limited color palette
- Clean typography

### 2. **Form Follows Function**
- Every element serves a purpose
- No decoration for decoration's sake
- Hierarchy based on importance

### 3. **Mathematical Precision**
- Grid-based layouts
- Consistent spacing
- Geometric shapes

### 4. **Objective Communication**
- Clear visual hierarchy
- Legible typography
- Purposeful use of color

## 💡 Recommended Fonts

For the full Swiss typography experience, use a geometric sans-serif monospace font:

**Top Picks:**
- **JetBrains Mono** - Modern, geometric, excellent ligatures
- **IBM Plex Mono** - Based on classic Helvetica proportions
- **Fira Code** - Geometric with great ligatures
- **SF Mono** - Apple's system mono font (macOS)
- **Inconsolata** - Geometric, minimal

**Classic Swiss:**
- **Helvetica Mono** - If available
- **Univers Mono** - Another Swiss classic

Set in your terminal emulator, not nvim.

## 🎯 Design Goals Achieved

✅ **Unique** - Distinctive Swiss aesthetic, not common in nvim configs
✅ **Geometric** - Box-drawing borders, straight lines throughout
✅ **Monochromatic + Accent** - Black/white/gray + Swiss red
✅ **Grid-based** - Mathematical spacing and alignment
✅ **Asymmetric** - Dynamic layouts, not centered
✅ **Minimal** - No unnecessary decoration
✅ **Professional** - Serious, focused, timeless

## 📚 Learn More

**Swiss Design History:**
- International Typographic Style (1950s-1980s)
- Pioneers: Josef Müller-Brockmann, Armin Hofmann, Emil Ruder
- Key principle: "Form follows function"

**Famous Swiss Designs:**
- Swiss Railways clock
- Helvetica typeface
- Bauhaus movement (related)
- Minimalist posters and grids

---

**Enjoy your Swiss Modernist nvim!** 🇨🇭

*"Perfection is achieved not when there is nothing more to add, but when there is nothing left to take away."*
