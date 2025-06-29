" (Neo)Vim Configuration
" By Bjorn Francke
" June 2025
"
" PlUGINS
"
call plug#begin()
 Plug 'dracula/vim' " Color scheme
 Plug 'Luxed/ayu-vim' 
 Plug 'preservim/nerdcommenter' 
 Plug 'neoclide/coc.nvim', {'branch': 'release'}
 Plug 'itchyny/lightline.vim' " Status line
 Plug 'itchyny/vim-gitbranch' " Used in status line for branch name
 Plug 'mhinz/vim-startify' " Dashboard
 Plug 'kdheepak/lazygit.nvim'
 Plug 'preservim/nerdtree' " Filebrowser
 Plug 'lewis6991/gitsigns.nvim'
 Plug 'ryanoasis/vim-devicons'
 Plug 'nvim-lua/plenary.nvim'
 Plug 'echasnovski/mini.indentscope'
 Plug 'shortcuts/no-neck-pain.nvim', { 'tag': '*' } " Zen mode
 Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.8' }
 Plug 'AndrewRadev/splitjoin.vim' " Not sure
call plug#end()

"
" BASIC CONFIGURATION
"
noremap <space> :

let mapleader = " "
let g:mapleader = " "

set background=dark  
let g:ayucolor="dark"   " for dark version of theme
colorscheme ayu
let g:ayu_italic_comment = 1 " defaults to 0.
let g:ayu_extended_palette = 1
syntax on " syntax highlighting
set number " display line numbers
set incsearch " show incremental search results as you type
set noswapfile " disable swap file
inoremap jk <ESC> " remap escape to "jk"
"set spell spelllang=en_us
map <leader>o :setlocal spell! spelllang=en_us<CR>
set wildmode=longest,list   " get bash-like tab completions
set cc=80                  " set an 80 column border for good coding style
filetype plugin indent on   " allow auto-indenting depending on file type
set cursorline              " highlight current cursor line
filetype plugin on
set clipboard=unnamedplus   " using system clipboard
set tabstop=4               " number of columns occupied by a tab 
set shiftwidth=4            " width for auto indents
"
" KEYMAPS
"
" move line or visually selected block - alt+j/k
inoremap <A-j> <Esc>:m .+1<CR>==gi
inoremap <A-k> <Esc>:m .-2<CR>==gi
vnoremap <A-j> :m '>+1<CR>gv=gv
vnoremap <A-k> :m '<-2<CR>gv=gv

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

nmap <silent><nowait> gd <Plug>(coc-definition)
nmap <silent><nowait> gy <Plug>(coc-type-definition)
nmap <silent><nowait> gi <Plug>(coc-implementation)
nmap <silent><nowait> gr <Plug>(coc-references)


" Symbol renaming
nmap <leader>rn <Plug>(coc-rename)

" Remap keys for applying refactor code actions
nmap <silent> <leader>re <Plug>(coc-codeaction-refactor)
xmap <silent> <leader>r  <Plug>(coc-codeaction-refactor-selected)
nmap <silent> <leader>r  <Plug>(coc-codeaction-refactor-selected)

" Run the Code Lens action on the current line
nmap <leader>cl  <Plug>(coc-codelens-action)

" Remap keys for applying code actions at the cursor position
nmap <leader>ac  <Plug>(coc-codeaction-cursor)

" Applying code actions to the selected code block
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Add (Neo)Vim's native statusline support
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

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
endif

set noshowmode
"
" Lightline
"
let g:lightline = {
      \ 'colorscheme': 'ayu',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'cocstatus', 'gitbranch', 'readonly', 'filename', 'modified' ] ],
      \ },
      \ 'component_function': {
      \   'gitbranch': 'gitbranch#name',
      \   'cocstatus': 'coc#status'
      \ },
      \ }

let g:lightline.active.right = [ [ 'lineinfo', 'syntastic' ],
      \                          [ 'percent' ],
      \                          [ 'fileformat' ] ]

let g:lightline.mode_map = {
		\ 'n' : 'NOR',
		\ 'i' : 'INS',
		\ 'R' : 'REP',
		\ 'v' : 'VIS',
		\ 'V' : 'V-LIN',
		\ "\<C-v>": 'V-BLK',
		\ 'c' : 'COM',
		\ 's' : 'SEL',
		\ 'S' : 'S-LIN',
		\ "\<C-s>": 'S-BLK',
		\ 't': 'TERM',
		\ }
