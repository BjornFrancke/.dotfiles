![nvim.png](https://francke.dev/nvim.png)

# Dotfiles

macOS dev setup: zsh + Powerlevel10k, Neovim, tmux, Ghostty, Helix, Zed, lazygit, and [mise](https://mise.jdx.dev) for language runtimes.

Everything lives in `~/dotfiles` and is symlinked into place. The repo must be cloned to exactly that path, because the shell config sources files from it.

## What's where

| Path | Linked to | Notes |
|---|---|---|
| `zshrc/.zshrc` | `~/.zshrc` | Loads `exports`, `aliases`, `functions`, `history` from the same folder |
| `p10k/.p10k.zsh` | `~/.p10k.zsh` | Prompt |
| `nvim-francke/` | `~/.config/nvim-francke` | Used via `NVIM_APPNAME` (see the `nvim` alias) |
| `mise/` | `~/.config/mise` | Global tools and settings (Node, ...) |
| `git/config` | `~/.gitconfig` | Shared git config, includes `~/.gitconfig.local` |
| `tmux/`, `ghostty/`, `helix/`, `zed/`, `lazygit/`, `karabiner/`, `ripgrep/` | various | See `symlinks.sh` for exact targets |
| `Brewfile` | | Homebrew formulae and casks |
| `scripts/` | | `install.sh`, `health-check.sh`, `macos.sh` |

`symlinks.sh` is the single list of links. `install.sh` creates them and `health-check.sh` verifies them, so adding a new config is one line there.

## Setting up a new machine

> This has not been tested on a clean machine yet. Expect to fix a step or two the first time.

```bash
# 1. Xcode command line tools and Homebrew
xcode-select --install
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# 2. Clone (must be ~/dotfiles)
git clone git@github.com:BjornFrancke/.dotfiles.git ~/dotfiles
cd ~/dotfiles

# 3. Apps and CLI tools
brew bundle --file Brewfile

# 4. Oh My Zsh (the .zshrc expects it; --keep-zshrc stops it overwriting ours)
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended --keep-zshrc

# 5. Symlink the configs. --force backs up anything already in the way.
scripts/install.sh --force

# 6. mise, then the tools listed in mise/config.toml
curl https://mise.run | sh
~/.local/bin/mise install

# 7. macOS defaults (safe to re-run)
scripts/macos.sh

# 8. Check everything
scripts/health-check.sh
```

Then, by hand:

- **Font:** install [JetBrainsMono Nerd Font](https://www.nerdfonts.com/font-downloads). Ghostty and the prompt need it, and it is not in the Brewfile.
- **tmux plugins:** `git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm`, start tmux, press `prefix` + `I`.
- **Git identity:** create `~/.gitconfig.local`, which is not tracked:

  ```ini
  [user]
      email = you@example.com
  ```

- **Machine-specific shell config:** put anything that should not be shared in `zshrc/local.zsh`. It is gitignored and sourced last.
- Open a new terminal.

## Machine-specific files

These are deliberately not in the repo:

| File | Holds |
|---|---|
| `~/.gitconfig.local` | Git email (work vs personal) |
| `zshrc/local.zsh` | Tool shims and paths that only exist on this machine (e.g. `~/.omlx/bin`) |

Be aware that installers like `pnpm setup` append to `~/.zshrc`. Since that is now a symlink into the repo, the lines land in `zshrc/.zshrc`. Move them to `exports.zsh` (if they apply everywhere) or `local.zsh` (if not).

## Day to day

```bash
scripts/health-check.sh       # verify symlinks and tools
scripts/install.sh            # link anything new from symlinks.sh
brewup                        # alias: brew update && brew upgrade
mise up                       # update tools managed by mise
mise use -g node@24           # change the global default (writes mise/config.toml)
mise use node@22              # pin a version for the current project
```

### Homebrew

The Brewfile is curated by hand. Avoid `brew bundle dump --force`, which overwrites it with a snapshot of whatever is installed. To see drift instead:

```bash
brew bundle check --file ~/dotfiles/Brewfile      # anything in the Brewfile that is missing?
brew bundle cleanup --file ~/dotfiles/Brewfile    # anything installed that is not in it? (add --force to remove)
```

### Other

```bash
touch ~/.hushlogin            # hide the "Last login" message
p10k configure                # regenerate the prompt (writes ~/.p10k.zsh, i.e. p10k/.p10k.zsh)
```
