# Biome Integration Setup

Your nvim is now configured to use **Biome** for formatting and linting JS/TS/JSON/CSS files.

## 🎯 How to Use

### Manual Formatting
- **`<leader>f`** - Format current buffer with Biome
- Works on: `.js`, `.jsx`, `.ts`, `.tsx`, `.json`, `.jsonc`, `.css`

### Manual Linting
- **`<leader>l`** - Manually trigger linting
- Auto-lints on: save, leaving insert mode

### Auto-format on Save (Optional)
Currently **disabled** to avoid errors while typing incomplete code.

To enable, edit `lua/francke/plugins/conform.lua` and uncomment:
```lua
format_on_save = {
    timeout_ms = 500,
    lsp_fallback = true,
},
```

## ⚙️ Configuration

### Project-level Config
Create a `biome.json` in your project root:

```json
{
  "$schema": "https://biomejs.dev/schemas/1.9.4/schema.json",
  "formatter": {
    "enabled": true,
    "formatWithErrors": true,
    "indentStyle": "space",
    "indentWidth": 2,
    "lineWidth": 100
  },
  "linter": {
    "enabled": true,
    "rules": {
      "recommended": true
    }
  },
  "javascript": {
    "formatter": {
      "quoteStyle": "single",
      "semicolons": "asNeeded"
    }
  }
}
```

### Format Code with Errors
If you want Biome to format even when there are syntax errors, add to your `biome.json`:

```json
{
  "formatter": {
    "formatWithErrors": true
  }
}
```

## 🐛 Troubleshooting

### "Code formatting aborted due to parsing errors"
This means your file has syntax errors. Options:

1. **Fix the syntax errors first** (recommended)
2. **Enable `formatWithErrors`** in `biome.json`:
   ```json
   {
     "formatter": {
       "formatWithErrors": true
     }
   }
   ```
3. **Disable format-on-save** (already disabled by default)

### Check Formatter Status
Run in nvim:
```vim
:ConformInfo
```

### View Logs
```bash
tail -f ~/.local/state/nvim/conform.log
```

## 📝 Keybindings Summary

| Key | Action | Notes |
|-----|--------|-------|
| `<leader>f` | Format buffer | Uses Biome (async) |
| `<leader>l` | Lint file | Manually trigger linting |

## 🔧 Files

- **Formatter:** `lua/francke/plugins/conform.lua`
- **Linter:** `lua/francke/plugins/nvim-lint.lua`
- **Biome binary:** `/opt/homebrew/bin/biome`

## 💡 Tips

1. **Don't format incomplete code:** Use `<leader>f` manually when your code is ready
2. **Project configs win:** Any `biome.json` in your project will override defaults
3. **Check logs:** If formatting fails, check `:ConformInfo` or the log file
4. **LSP fallback:** If Biome isn't available, it falls back to LSP formatting

---

**Current Status:**
- ✅ Biome installed at `/opt/homebrew/bin/biome`
- ✅ Manual formatting: `<leader>f`
- ✅ Manual linting: `<leader>l`
- ⏸️ Auto-format on save: **disabled** (enable in conform.lua if wanted)
