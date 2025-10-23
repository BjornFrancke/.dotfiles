-- ========================================
-- NEOVIM CONFIGURATION LOADER
-- ========================================
-- This file loads all the main configuration modules in order.
--
-- Configuration structure:
-- - lazy.lua        : Plugin manager (lazy.nvim) setup
-- - set.lua         : Core vim settings (line numbers, tabs, scrolloff, etc)
-- - remap.lua       : Custom keybindings for editing, splits, and buffers
-- - statusline.lua  : Custom statusline configuration
-- - snippets        : Code snippet definitions
-- - plugins/        : Individual plugin configurations (auto-loaded by lazy.nvim)
--
-- Key concepts for vim immersion:
-- - Leader key is SPACE (<leader>)
-- - Most commands start with <leader> (press space, then which-key shows options)
-- - Use 's' for Flash jumps (quick navigation)
-- - Use '-' to open file explorer (Oil.nvim)
-- - Use '<leader>f*' for finding files/code (Telescope)
-- - Use '<leader>x*' for diagnostics (Trouble)
-- ========================================

require('francke.lazy')
require('francke.remap')
require('francke.statusline')
require('francke.set')
require('francke.custom.snippets')
