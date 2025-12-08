# 🎨 Color Switcher Guide

Your Swiss Modernist theme now uses **Electric Blue** as the accent! Want to try different colors? It's super easy!

## Quick Color Change (One File!)

**Edit:** `lua/francke/plugins/modernist-theme.lua`

**Line 26:** Just uncomment the color you want and comment out the current one:

```lua
-- 🎨 CHOOSE YOUR ACCENT COLOR (uncomment one):
-- local accent = "#4A9EFF"     -- Electric Blue (current)
local accent = "#FF6B35"        -- Sunset Orange (trying this!)
-- local accent = "#00D9FF"     -- Cyber Cyan
-- local accent = "#39FF14"     -- Neon Green
```

Then **restart nvim** or run `:source ~/.config/nvim/init.lua`

That's it! The color changes everywhere automatically!

## 🎨 Color Palette

### Included Presets

| Color | Hex | Vibe |
|-------|-----|------|
| **Electric Blue** | `#4A9EFF` | Modern, tech, energetic |
| **Sunset Orange** | `#FF6B35` | Warm, creative, vibrant |
| **Cyber Cyan** | `#00D9FF` | Futuristic, digital, cool |
| **Neon Green** | `#39FF14` | Hacker, bold, terminal |
| **Deep Purple** | `#9D4EDD` | Creative, sophisticated |
| **Ocean Blue** | `#0077BE` | Professional, calm |
| **Forest Green** | `#2D8659` | Natural, focused |
| **Swiss Red** | `#E84A4A` | Classic, original |

### Custom Colors

Want any other color? Just use any hex code:

```lua
local accent = "#YOUR_HEX"  -- Any color you want!
```

**Pro tip:** Use a color picker:
- macOS: Digital Color Meter (built-in)
- Online: [Coolors.co](https://coolors.co)
- VS Code: Color picker in CSS files

## 🎯 What Changes

Your accent color appears in:
- ✅ **Dashboard** header (NEOV logo)
- ✅ **Statusline** mode indicator (NORMAL/INSERT/etc)
- ✅ **Borders** around floating windows
- ✅ **Line numbers** (current line)
- ✅ **Keywords** in code (`if`, `function`, `return`, etc)
- ✅ **Search** highlights
- ✅ **Tabs** (active tab indicator)
- ✅ **Git signs** and file tree icons
- ✅ **Which-key** command highlights

## 🎨 Advanced: Match All 3 Files

For complete color consistency, update these 3 lines (all to the same color):

1. **`modernist-theme.lua` line 26:**
   ```lua
   local accent = "#4A9EFF"
   ```

2. **`lualine.lua` line 8:**
   ```lua
   local accent = "#4A9EFF"
   ```

3. **`dashboard.lua` line 69:**
   ```lua
   local accent = "#4A9EFF"
   ```

**But honestly:** Just changing `modernist-theme.lua` is enough for 95% of the visual changes. The others are minor.

## 💡 Color Tips

### For Long Coding Sessions
Use cooler, less saturated colors:
- `#4A9EFF` - Electric Blue (current)
- `#0077BE` - Ocean Blue
- `#2D8659` - Forest Green
- `#50A0A0` - Muted Cyan

### For Energy & Focus
Use warmer, bolder colors:
- `#FF6B35` - Sunset Orange
- `#39FF14` - Neon Green
- `#9D4EDD` - Deep Purple

### For Professionalism
Classic, trustworthy colors:
- `#0077BE` - Ocean Blue (IBM blue)
- `#2D8659` - Forest Green
- `#4A9EFF` - Electric Blue

### For Fun
Go wild!
- `#FF1493` - Hot Pink
- `#FFD700` - Gold
- `#00FF00` - Pure Green
- `#FF00FF` - Magenta

## 🔄 Quick Switches

### Try Sunset Orange
```lua
local accent = "#FF6B35"
```
Warm, creative, stands out without being aggressive.

### Try Cyber Cyan
```lua
local accent = "#00D9FF"
```
Cool, futuristic, perfect for dark themes.

### Try Deep Purple
```lua
local accent = "#9D4EDD"
```
Sophisticated, creative, unique.

## 📐 Swiss Design Rule

**Use only ONE accent color!**

The Swiss design philosophy is about restraint. The monochrome base (black/gray/white) + one bold accent creates visual hierarchy and keeps things clean.

Don't use multiple accent colors - pick one and commit! That's what makes it look professional and timeless.

## 🎨 Color Wheel Tips

**Complementary to your accent:**
If you want secondary colors to match, use the color wheel:

- **Blue** accent → Use orange for warnings
- **Orange** accent → Use blue for info
- **Purple** accent → Use yellow/green for success
- **Green** accent → Use red/pink for errors

But honestly, the current functional colors (orange warnings, red errors) work with everything!

## ⚡ Hot Reload

After changing the color, you can hot-reload:

```vim
:source ~/.config/nvim/init.lua
```

Or just restart nvim:
```bash
:qa
nvim
```

## 🎯 My Recommendations

Based on your preferences:

1. **Electric Blue** `#4A9EFF` (current) - Modern, energetic, great all-rounder
2. **Sunset Orange** `#FF6B35` - If you want warmth and creativity
3. **Cyber Cyan** `#00D9FF` - If you want futuristic vibes

All three work beautifully with the monochrome Swiss aesthetic!

---

**Enjoy experimenting with colors!** 🎨

Remember: Swiss design is about finding the perfect accent and sticking with it. Try a few, then pick your favorite!
