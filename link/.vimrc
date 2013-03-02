" Use pathogen to easily modify the runtime path to include all
" " plugins under the ~/.vim/bundle directory
 call pathogen#helptags()
 call pathogen#runtime_append_all_bundles()

" Use Vim settings, rather than Vi settings

filetype off
syntax on
filetype on

filetype plugin on

set backspace=2

set nocompatible

set modeline

set textwidth=80

set hidden

set number

set history=1000         " remember more commands and search history
set undolevels=1000      " use many muchos levels of undo
set wildignore=*.swp,*.bak,*.pyc,*.class
set title                " change the terminal's title
set visualbell           " don't beep
set noerrorbells         " don't beep
set nobackup


" indenting

set autoindent
set smartindent
set shiftwidth=4

set tabstop=4

set expandtab "turns tabs into whitespace


" folding

set foldmethod=marker " use {{{ }}} as delimiters

highlight Folded term=bold ctermfg=white ctermbg=black


" search

set incsearch " search as you type

set hlsearch

" Have 3 lines of offset (or buffer) when scrolling

set scrolloff=3


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Duh stuff
" Remove whitespace at end of line
" au FileType python ca w %s/\s\+$//ge\|/kjkjlkjklsjkfja|w
au FileType python autocmd BufWritePre * :%s/\s\+$//e

" Speed up settings

let mapleader = ","

map ; :
noremap ; :

imap jj <Esc>
cmap jj <Esc>

" PLUGIN SETTINGS

" Pyflakes/SpellBad highlighting color set to gray
highlight SpellBad term=standout ctermbg=0 ctermfg=1
let g:pyflakes_use_quickfix = 0

" PLUGIN MAPPING
map <F2> :NERDTreeToggle<CR>
map <F3> :VCSBlame<CR>

" run tests in openstack
let g:qtpy_shell_command = "eatmydata ./run_tests.sh"
let g:qtpy_use_abs_path = "false"
let g:qtpy_class_delimiter = "."
let g:qtpy_method_delimiter = "."
au FileType python map <F8> :QTPY method verbose<CR>
au FileType python map <F9> :QTPY session<CR>
au FileType python map <silent><leader>m :QTPY method verbose<CR>
au FileType python map <silent><leader>s :QTPY session<CR>
