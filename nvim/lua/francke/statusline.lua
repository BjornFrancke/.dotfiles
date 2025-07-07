local M = {}
M.cache = { branch = '' }

vim.api.nvim_create_augroup('custom_statusline', { clear = true })

-- Detect Git branch using system call (no fugitive)
local function get_git_branch()
  local handle = io.popen('git rev-parse --abbrev-ref HEAD 2>/dev/null')
  if handle then
    local branch = handle:read("*a"):gsub("%s+", "")
    handle:close()
    return branch
  end
  return ''
end

vim.api.nvim_create_autocmd('VimEnter', {
  group = 'custom_statusline',
  callback = function()
    M.cache.branch = get_git_branch()
  end
})

vim.api.nvim_create_autocmd({ 'BufEnter', 'WinEnter' }, {
  group = 'custom_statusline',
  callback = function()
    vim.opt_local.statusline = "%!v:lua.Statusline()"
  end
})

vim.api.nvim_create_autocmd({ 'BufLeave', 'WinLeave' }, {
  group = 'custom_statusline',
  callback = function()
    vim.opt_local.statusline = "%f %y %m"
  end
})

vim.api.nvim_create_autocmd({ 'VimEnter', 'ColorScheme' }, {
  group = 'custom_statusline',
  callback = function()
    M.set_statusline_colors()
  end
})

function M.set_statusline_colors()
  local bg = vim.fn.synIDattr(vim.fn.hlID('Normal'), 'bg')
  local fg = vim.fn.synIDattr(vim.fn.hlID('Normal'), 'fg')
  local warn_fg = vim.fn.synIDattr(vim.fn.hlID('WarningMsg'), 'fg')
  local err_fg = vim.fn.synIDattr(vim.fn.hlID('ErrorMsg'), vim.o.background == 'dark' and 'bg' or 'fg')

  vim.cmd('hi StItem guibg=' .. fg .. ' guifg=' .. bg .. ' gui=NONE')
  vim.cmd('hi StSep guifg=' .. fg .. ' guibg=NONE gui=NONE')
  vim.cmd('hi StErr guibg=' .. err_fg .. ' guifg=' .. bg .. ' gui=bold')
  vim.cmd('hi StErrSep guifg=' .. err_fg .. ' guibg=NONE gui=NONE')
  vim.cmd('hi StWarn guibg=' .. warn_fg .. ' guifg=' .. bg .. ' gui=bold')
  vim.cmd('hi StWarnSep guifg=' .. warn_fg .. ' guibg=NONE gui=NONE')
  vim.cmd('hi StFileModified guibg=Red guifg=Black gui=bold')
  vim.cmd('hi StFileModifiedSep guifg=Red guibg=NONE gui=NONE')
  vim.cmd('hi Statusline guifg=NONE guibg=' .. bg .. ' gui=NONE cterm=NONE')
end

local function sep(item, opts)
  opts = opts or {}
  local before = opts.before or ' '
  local sep_color = opts.sep_color or '%#StSep#'
  local color = opts.color or '%#StItem#'
  return string.format('%s%s█%s%s%s█%%*', before, sep_color, color, item, sep_color)
end

local function sep_if(item, condition, opts)
  if not condition then return '' end
  return sep(item, opts)
end

local st_err = { color = '%#StErr#', sep_color = '%#StErrSep#' }
local st_warn = { color = '%#StWarn#', sep_color = '%#StWarnSep#' }
local st_mode = { color = '%#StMode#', sep_color = '%#StModeSep#' }

local st_file_modified = {
  color = '%#StFileModified#',
  sep_color = '%#StFileModifiedSep#',
}


function Statusline()
  local mode = M.mode_statusline()
  local line = sep(mode, vim.tbl_extend('force', { before = '' }, st_mode))

  local branch = M.cache.branch
  line = line .. sep_if(branch, branch ~= '', {})

  local path = vim.fn.isdirectory(vim.fn.expand('%')) == 1 and '%F' or '%f'
  line = line .. sep(path, vim.bo.modified and st_file_modified or {})
  -- line = line .. sep_if(' + ', vim.bo.modified, st_err)
  -- line = line .. sep_if(' - ', not vim.bo.modifiable, st_err)
  line = line .. sep_if('%w', vim.wo.previewwindow)
  line = line .. sep_if('%r', vim.bo.readonly)
  line = line .. sep_if('%q', vim.bo.buftype == 'quickfix')
  line = line .. '%='
  -- line = line .. sep_if(vim.bo.filetype, vim.bo.filetype ~= '')
  line = line .. sep(': %c', st_mode)
  line = line .. sep(': %l/%L', st_mode)
  -- line = line .. sep('%p%%', st_mode)
  line = line .. '%<'

  return line
end

function M.mode_statusline()
  local mode = vim.fn.mode()
  M.mode_highlight(mode)
  local modeMap = {
    n = 'NORMAL', i = 'INSERT', R = 'REPLACE',
    v = 'VISUAL', V = 'V-LINE', [''] = 'V-BLOCK',
    s = 'SELECT', S = 'S-LINE', [''] = 'S-BLOCK',
    c = 'COMMAND', t = 'TERMINAL'
  }
  return modeMap[mode] or 'UNKNOWN'
end

function M.mode_highlight(mode)
  if mode == 'i' then
    vim.cmd('hi StMode guibg=#83a598 guifg=#3c3836')
    vim.cmd('hi StModeSep guifg=#83a598 guibg=NONE')
  elseif mode:match('[vV]') then
    vim.cmd('hi StMode guibg=#fe8019 guifg=#3c3836')
    vim.cmd('hi StModeSep guifg=#fe8019 guibg=NONE')
  elseif mode == 'R' then
    vim.cmd('hi StMode guibg=#8ec07c guifg=#3c3836')
    vim.cmd('hi StModeSep guifg=#8ec07c guibg=NONE')
  else
    local bg = vim.fn.synIDattr(vim.fn.hlID('Normal'), 'bg')
    local fg = vim.fn.synIDattr(vim.fn.hlID('Normal'), 'fg')
    vim.cmd('hi StMode guibg=' .. fg .. ' guifg=' .. bg .. ' gui=NONE')
    vim.cmd('hi StModeSep guifg=' .. fg .. ' guibg=NONE gui=NONE')
  end
end

return M
