"────────────────────────────────────────────────────────────────
"
" (Neo)Vim Configuration
" By Bjorn Francke
" June 2025
"
"────────────────────────────────────────────────────────────────
"
"                        PlUGINS
"
"────────────────────────────────────────────────────────────────
call plug#begin()
 Plug 'Luxed/ayu-vim' 
 Plug 'preservim/nerdcommenter' 
 Plug 'neoclide/coc.nvim', {'branch': 'release'}
 Plug 'itchyny/vim-gitbranch' " Used in status line for branch name
 Plug 'mhinz/vim-startify' " Dashboard
 Plug 'kdheepak/lazygit.nvim' " Git TUI
 Plug 'preservim/nerdtree' " Filebrowser
 Plug 'lewis6991/gitsigns.nvim' " Git gutter status
 Plug 'ryanoasis/vim-devicons'
 Plug 'nvim-tree/nvim-web-devicons' " Recommended (for coloured icons)
 Plug 'tpope/vim-fugitive'
 Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
 Plug 'junegunn/fzf.vim' " Fuzzy finder
 Plug 'nvim-lua/plenary.nvim'
 Plug 'akinsho/bufferline.nvim', { 'tag': '*' }
 Plug 'echasnovski/mini.indentscope'
 Plug 'shortcuts/no-neck-pain.nvim', { 'tag': '*' } " Zen mode
 Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.8' }
 Plug 'AndrewRadev/splitjoin.vim' " Not sure
call plug#end()

lua << EOF
require("bufferline").setup{}
EOF
"────────────────────────────────────────────────────────────────
"
"                   BASIC CONFIGURATION
"
"────────────────────────────────────────────────────────────────
noremap <space> :

let mapleader = " "
let g:mapleader = " "

set background=dark  
let g:ayucolor="dark"        " for dark version of theme
colorscheme ayu
let g:ayu_italic_comment = 1 " defaults to 0.
let g:ayu_extended_palette = 1
syntax on                   " syntax highlighting
set number                  " display line numbers
set incsearch               " show incremental search results as you type
set noswapfile              " disable swap file
"set spell spelllang=en_us
map <leader>o :setlocal spell! spelllang=en_us<CR>
set wildmode
set wildmode=longest,list   " get bash-like tab completions
set cc=80                   " set an 80 column border for good coding style
filetype plugin indent on   " allow auto-indenting depending on file type
set cursorline              " highlight current cursor line
filetype plugin on
set clipboard=unnamedplus   " using system clipboard
set tabstop=4               " number of columns occupied by a tab 
set shiftwidth=4            " width for auto indents


" Show matching brackets when text indicator is over them
set showmatch

"─────────────────────────────────────────────────────────────
"
"                       KEYMAPS
"
"─────────────────────────────────────────────────────────────
" Remap escape to "jk" 
inoremap jk <ESC>

" move line or visually selected block - alt+j/k
inoremap <A-j> <Esc>:m .+1<CR>==gi
inoremap <A-k> <Esc>:m .-2<CR>==gi
vnoremap <C-j> :m '>+1<CR>gv=gv
vnoremap <C-k> :m '<-2<CR>gv=gv

" Insert an empty line *below* the current line without entering Insert mode
" nnoremap <silent> <leader>o :<C-u>call append(line('.'), repeat([''], v:count1))<CR>
" Insert an empty line *above* the current line without entering Insert mode
"" nnoremap <silent> <leader>O :<C-u>call append(line('.')-1, repeat([''], v:count1))<CR>

" Buffer -> back and forward
nnoremap <TAB> :bn<CR>
nnoremap <S-TAB> :bp<CR>

" open file in a text by placing text and gf
nnoremap gf :vert winc f<cr>

" copies filepath to clipboard by pressing yf
:nnoremap <silent> yf :let @+=expand('%:p')<CR>

" copies pwd to clipboard: command yd
:nnoremap <silent> yd :let @+=expand('%:p:h')<CR>

" setup mapping to call :LazyGit
nnoremap <silent> <leader>lg :LazyGit<CR>
"
"
" NERDTree
"
nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>

let g:NERDTreeWinPos = 'right'
let g:NERDTreeShowLineNumbers = 0 
let g:NERDTreeMinimalUI=1
"
" GitSigns
"
nnoremap <leader>hs :Gitsigns stage_hunk<CR>
nnoremap <leader>hr :Gitsigns reset_hunk<CR>
"
" coc config
"
" Use tab for trigger completion with characters ahead and navigate
" NOTE: There's always complete item selected by default, you may want to enable
" no select by `"suggest.noselect": true` in your configuration file
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

" Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

nmap <silent><nowait> cd <Plug>(coc-definition)
nmap <silent><nowait> gy <Plug>(coc-type-definition)
nmap <silent><nowait> gi <Plug>(coc-implementation)
nmap <silent><nowait> cr <Plug>(coc-references)

" Symbol renaming
nmap <leader>rn <Plug>(coc-rename)

" Remap keys for applying refactor code actions
nmap <silent> <leader>re <Plug>(coc-codeaction-refactor)
xmap <silent> <leader>r  <Plug>(coc-codeaction-refactor-selected)
nmap <silent> <leader>r  <Plug>(coc-codeaction-refactor-selected)

" Formatting selected code
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

" Run the Code Lens action on the current line
nmap <leader>cl  <Plug>(coc-codelens-action)

" Ripgrep powered search respecting .gitignore 
nnoremap <leader>fs :Rg<CR>

" Remap keys for applying code actions at the cursor position
nmap <leader>ac  <Plug>(coc-codeaction-cursor)

" Add `:Format` command to format current buffer
command! -nargs=0 Format :call CocActionAsync('format')

" Applying code actions to the selected code block
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Add (Neo)Vim's native statusline support
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline

"
" Telescope
"

" Find files using Telescope command-line sugar.
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

if !has('gui_running')
  set t_Co=256
  "set guioptions-=e
endif
set encoding=utf-8
"set termguicolors


"─────────────────────────────────────────────────────────

" Return to last edit position when opening files (You want this!)
"au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

"set showtabline=2
"set noshowmode
"set guioptions-=e
"
"
"────────────────────────────────────────────────────
"
"                   Statusline
"
"────────────────────────────────────────────────────

set laststatus=2

" Shorten file path to fit screen
function! ShortPath(max)
  " Expand   %:~:.   → home-relative (~/) and CWD-relative (./) path
  let l:path = expand('%:~:.')
  " If it's already short enough, keep it
  if strlen(l:path) <= a:max
    return l:path
  endif
  " pathshorten() turns /very/long/path/to/file.txt
  " into          /v/l/p/t/file.txt
  return pathshorten(l:path)
endfunction


set statusline=
set statusline+=%(%{&buflisted?bufnr('%'):''}\ \ %)
set statusline+=%< " Truncate line here
"set statusline+=%f\  " File path, as typed or relative to current directory
set statusline+=%{ShortPath(40)}\          " ← show ≤40-char path, else shortened
set statusline+=%{&modified?'+\ ':''}
set statusline+=%{&readonly?'\ ':''}
set statusline+=%1*\  " Set highlight group to User1
set statusline+=%{gitbranch#name()}
set statusline+=%= " Separation point between left and right aligned items
set statusline+=\ %{&filetype!=#''?&filetype:'none'}
set statusline+=\ \ 
set statusline+=%{strftime(\"%H:%M\")}
set statusline+=\ %* " Restore normal highlight
set statusline+=\ %{&number?'':printf('%2d,',line('.'))} " Line number
set statusline+=%-2v " Virtual column number
set statusline+=\ %2p%% " Percentage through file in lines as in |CTRL-G
"
" Logic for customizing the User1 highlight group is the following
" - if StatusLine colors are reverse, then User1 is not reverse and User1 fg = StatusLine fg
hi StatusLine cterm=reverse gui=reverse ctermfg=14 ctermbg=8 guifg=#93a1a1 guibg=#002732
hi StatusLineNC cterm=reverse gui=reverse ctermfg=11 ctermbg=0 guifg=#657b83 guibg=#073642
hi User1 ctermfg=14 ctermbg=0 guifg=#93a1a1 guibg=#073642

"───────────────────────────────────────────────────

" If Vim version is equal to or greater than 7.3 enable undofile.
" This allows you to undo changes to a file even after saving it.
if version >= 703
    set undodir=~/.vim/backup
    set undofile
    set undoreload=10000
endif
