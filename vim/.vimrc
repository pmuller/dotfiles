" Load pathogen
runtime bundle/pathogen/autoload/pathogen.vim
execute pathogen#infect()


"==============================================================================
" BASIC PREFERENCES
"==============================================================================
" Show special endline and tab characters
"set listchars=eol:¬,tab:_
"set list

" Always show status line, even when only 1 buffer is opened
set laststatus=2

" Drop 'vi' compatibility
set nocompatible

" No backup nor swap files
set nobackup
set nowritebackup

" Syntax highlighting enabled
syntax on

" Use file type to guess syntax highlighting and indentation
filetype plugin on
filetype plugin indent on

" Tabs are 4 characters wide
set tabstop=4

" Indentation size is 4 characters
set shiftwidth=4

" Tabs are converted to spaces
set expandtab

" Allow hidden buffers
set hidden

" Display the cursor position on the bottom right corner
set ruler

" Allow backspace, space, and arrow keys to wrap lines
set whichwrap=b,s,<,>,[,]

" Display line numbers
set number

" Quicky display matching paren/bracket when typing
set showmatch

" Display --INSERT-- or --REPLACE-- in status line
set showmode

" Disable mouse
set mouse=

" Define places where backspace is allowed to remove a character
set backspace=indent,eol,start

" Highlight the current line background
set cursorline

" Do not wrap text, keep it in a single line
set nowrap

" Enable incremental search
set incsearch

" Enable search highlighting
set hlsearch

" Use relative line numbers
set relativenumber

" Start scrolling 5 lines before the window border
set so=5

" Show commands
set showcmd

" Use a dark background
set background=dark

set t_Co=256

" Color scheme
"colorscheme bubblegum-256-dark
"let g:solarized_termcolors=256
"colorscheme solarized
"colorscheme zenburn
"colorscheme lucius
colorscheme jellybeans

" Airline configuration
let g:airline_powerline_fonts=1

" Promptline configuration
let g:promptline_powerline_symbols=1
let g:promptline_preset={
    \'a' : [ promptline#slices#jobs() ],
    \'b' : [ promptline#slices#python_virtualenv() ],
    \'c' : [ promptline#slices#cwd() ],
    \'x' : [ promptline#slices#vcs_branch() ],
    \'y' : [ promptline#slices#git_status() ],
    \'warn' : [ promptline#slices#last_exit_code() ]}

" tab navigation like firefox
nnoremap <C-h> :tabprevious<CR>
nnoremap <C-l> :tabnext<CR>
nnoremap <C-t> :tabnew<CR>

" Map ; to :
noremap ; :

" Syntastic configuration
let g:syntastic_rst_checkers = ['rstcheck']
