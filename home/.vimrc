" vim configuration file
" based on https://github.com/colbycheeze/dotfiles/blob/master/vimrc
"
" Use Vim settings, rather then Vi settings. This setting must be as early as
" possible, as it has side effects.
set nocompatible

set nobackup
set nowritebackup
set noswapfile

set history=50

set ruler
set laststatus=2
set autoread

set wildmenu
set wildmode=list:longest,full

set ttyfast
"set mouse=a
set nowrap

"Make searching better
set gdefault
set ignorecase
set smartcase
set hlsearch
set incsearch

set textwidth=140
set smartindent
set tabstop=4

""""""""""""""""""""""""""""""""""
"         unicode support        "
""""""""""""""""""""""""""""""""""
if has("multi_byte")
  if &termencoding == ""
    let &termencoding = &encoding
  endif
  set encoding=utf-8
  setglobal fileencoding=utf-8
  set fileencodings=ucs-bom,utf-8,latin1
endif

" Display extra whitespace
"set list listchars=tab:»·,trail:·,nbsp:·
set tabstop=4
set formatoptions=qrn1
set wrapmargin=0
set colorcolumn=+1

" allow backspace to delete special characters
set backspace=indent,eol,start

" enable indentation
filetype indent on

" Automatically create folds (to collapse functions mostly),
" and instruct to open all the folds by default
autocmd Syntax c,cpp,vim,xml,html,xhtml setlocal foldmethod=syntax
autocmd Syntax c,cpp,vim,xml,html,xhtml,perl normal zR

" Open new split panes to right and bottom, which feels more natural
set splitbelow
set splitright

" scrolling
set scrolloff=8
set sidescrolloff=15
set sidescroll=1

set number
set numberwidth=5

" Always use vertical diffs
set diffopt+=vertical

" automatically rebalance windows on vim resize
autocmd VimResized * :wincmd =

" to enable 'find' to work on the crrent dir when ctrlp fails
set path+=**

execute pathogen#infect()

syntax on
syntax enable

""""""""""""""""""""""""""""""""""
"          color scheme          "
""""""""""""""""""""""""""""""""""
let g:solarized_termcolors=256
let g:solarized_termtrans=0
set background=dark
colorscheme solarized

let g:airline_theme='simple'
let g:airline_symbols_ascii = 1

""""""""""""""""""""""""""""""""""""""
" vim-gitgutter plugin configuration "
""""""""""""""""""""""""""""""""""""""
let g:gitgutter_enabled = 0
let g:gitgutter_signs = 1
let g:gitgutter_highlight_lines = 0

""""""""""""""""""""""""""""""""""
" NERDTree plugin configuration  "
""""""""""""""""""""""""""""""""""
let g:NERDTreeDirArrows=0

""""""""""""""""""""""""""""""""""
" TagBar plugin configuration  "
""""""""""""""""""""""""""""""""""
let g:tagbar_sort = 0

""""""""""""""""""""""""""""""""""
" TagBar plugin configuration  "
""""""""""""""""""""""""""""""""""
let g:tabular_loaded = 1

""""""""""""""""""""""""""""""""""
" quick tag highlight mappings
""""""""""""""""""""""""""""""""""
nmap <Space>m <Plug>(quickhl-manual-this)
xmap <Space>m <Plug>(quickhl-manual-this)

nmap <Space>w <Plug>(quickhl-manual-this-whole-word)
xmap <Space>w <Plug>(quickhl-manual-this-whole-word)

nmap <Space>c <Plug>(quickhl-manual-clear)
vmap <Space>c <Plug>(quickhl-manual-clear)

nmap <Space>M <Plug>(quickhl-manual-reset)
xmap <Space>M <Plug>(quickhl-manual-reset)

nmap <Space>j <Plug>(quickhl-cword-toggle)

""""""""""""""""""""""""""""""""""
"      custom key mappings       "
""""""""""""""""""""""""""""""""""
"quicker window movement
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

"quickly resize panes
nnoremap <silent> <Right> :vertical resize +5<cr>
nnoremap <silent> <Left> :vertical resize -5<cr>
nnoremap <silent> <Up> :resize -5<cr>
nnoremap <silent> <Down> :resize +5<cr>

nmap <silent> <F11> :NERDTreeToggle<CR>
nmap <silent> <F12> :TagbarToggle<CR>

" C is ctrl
" kSomething means Something from the keypad
" in order: save all files, open/close quickfix, vertical window split,
" horizontal split, close window, move to window above and maximise it,
" move below and maximise, move left, move right, maximise current windo
nmap <C-s>                  :wa<CR>
nmap <silent> <C-k0>        :QFix<CR>
nmap <silent> <C-kDivide>   :vsplit<CR>
nmap <silent> <C-kMinus>    :split<CR>
nmap <silent> <C-kMultiply> <C-W>q
nmap <silent> <C-k8>        <C-W>k<C-W>_
nmap <silent> <C-k2>        <C-W>j<C-W>_
nmap <silent> <C-k4>        <C-W>h
nmap <silent> <C-k6>        <C-W>l
nmap <silent> <C-k5>        <C-W>_

" Tab creation and navigation
nmap <C-n>              :tabprev<CR>
nmap <C-m>              :tabnext<CR>

" shortcuts to open/close a fold (go over the name of a function first)
nmap <silent> <kPlus>       zo
nmap <silent> <kMinus>      zc

" apply cscope key map
source ~/.vim/cscope_maps.vim

set encoding=utf-8
set fileencoding=utf-8

"set encoding=latin1
"set fileencoding=latin1


