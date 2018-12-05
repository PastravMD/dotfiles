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

set textwidth=80
set smartindent

" Display extra whitespace
set list listchars=tab:»·,trail:·,nbsp:·
set tabstop=8
set formatoptions=qrn1
set wrapmargin=0
set colorcolumn=+1

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

"Toggle relative numbering, and set to absolute on loss of focus or insert mode
set number
set relativenumber
set numberwidth=5
function! ToggleNumbersOn()
    set nu!
    set rnu
endfunction
function! ToggleRelativeOn()
    set rnu!
    set nu
endfunction
autocmd FocusLost * call ToggleRelativeOn()
autocmd FocusGained * call ToggleRelativeOn()
autocmd InsertEnter * call ToggleRelativeOn()
autocmd InsertLeave * call ToggleRelativeOn()

" Always use vertical diffs
set diffopt+=vertical

" automatically rebalance windows on vim resize
autocmd VimResized * :wincmd =

execute pathogen#infect()

syntax on

""""""""""""""""""""""""""""""""""
"          color scheme          "
""""""""""""""""""""""""""""""""""
let g:solarized_termcolors=256
if has('gui_running')
    set background=light
else
    set background=dark
endif
colorscheme solarized
let g:airline_theme='simple'

"let g:airline_powerline_fonts = 1
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif
let g:airline_symbols.space = "\ua0"

""""""""""""""""""""""""""""""""""""""
" vim-gitgutter plugin configuration "
""""""""""""""""""""""""""""""""""""""
"GitGutterEnable


""""""""""""""""""""""""""""""""""
" Syntastic plugin configuration "
""""""""""""""""""""""""""""""""""
"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*

"let g:syntastic_always_populate_loc_list = 1
"let g:syntastic_auto_loc_list = 1
"let g:syntastic_check_on_open = 1
"let g:syntastic_check_on_wq = 0

" ignore spurious error
let g:syntastic_quiet_messages = {"regex" : ".*No such file or directory.*"}

""""""""""""""""""""""""""""""""""
" NERDTree plugin configuration  "
""""""""""""""""""""""""""""""""""
let g:NERDTreeDirArrows=0

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

"Use enter to create new lines w/o entering insert mode
" (!) - weirdly overrides <C-m>
"nnoremap <CR> o<Esc>

" shortcuts to open/close a fold (go over the name of a function first)
nmap <silent> <kPlus>       zo
nmap <silent> <kMinus>      zc

" apply cscope key map
source ~/.vim/cscope_maps.vim

set encoding=utf-8
set fileencoding=utf-8

"set encoding=latin1
"set fileencoding=latin1

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
