execute pathogen#infect()
inoremap jk <ESC>
set nocompatible


set number
set relativenumber "Set relative line numbers
syntax on
filetype plugin indent on
filetype plugin on

set autoindent
set expandtab		"Use spaces instead of tabs
"set foldmethod=syntax   "Set folding according to syntax
set softtabstop =4 	"Tab indents 4 spaces
set shiftwidth =4 	" >> indents 4 spaces
set shiftround 		" >> indents to next multiple of shiftwidth

set hidden 		"Switch between buffers without having to safe first
set laststatus =2 	"Always show status line
set display =lastline 	"Show as much as possible of the last line

set showmode
set showcmd

set incsearch 		"highlight while searching
set hlsearch  		"Keep matches hilighted

set splitbelow 		"open new windows below current one
set splitright		"open new windoes right of current one

set cursorline 		"find current line quickly
set wrapscan		"searches wrap around
set report 	=0	"report changed lines
set synmaxcol	=200	"Only highlight first 200 columns

"Remap next and previous tab
nnoremap <F7> :tabprevious<CR>
nnoremap <F8> :tabnext<CR>

" Recommended settings of syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_c_include_dirs = ['/usr/avr/include']

"Add c++11 support for syntastic
let g:syntastic_cpp_compiler ='g++'
let g:syntastic_cpp_compiler_options = ' -std=c+11 -stdlib=libc++'

"Colorscheme
colorscheme 256-jungle

" Unmap the arrow keays
no <down> <Nop>
no <up> <Nop>
no <left> <Nop>
no <right> <Nop>
no <down> <Nop>
no <up> <Nop>
no <left> <Nop>
no <right> <Nop>


let fortran_free_source=1
let fortran_have_tabs=1
let fortran_more_precise=1
let fortran_do_enddo=1

" Don't screw up folds when inserting text that might affect them, until
" leaving insert mode. Foldmethod is local to the window.
autocmd InsertEnter * let w:last_fdm=&foldmethod | setlocal foldmethod=manual
autocmd InsertLeave * let &l:foldmethod=w:last_fdm

" " try stuff for tmux
" set t_ut=
