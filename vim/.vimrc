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

" Hide buffers when they are abandoned
set hidden

" Display the cursor position on the bottom right corner
set ruler

" Allow backspace, space, and arrow keys to wrap lines
set whichwrap=b,s,<,>,[,]

" Display line numbers
set number

" Use relative line numbers
set relativenumber

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

" Highlight at 80 characters
set colorcolumn=80

" Do not wrap text, keep it in a single line
set nowrap

" Enable incremental search
set incsearch

" Enable search highlighting
set hlsearch

" Do smart case matching
set smartcase

" Start scrolling 5 lines before the window border
set scrolloff=5

" Show commands
set showcmd

" turn on wild menu :e <Tab>
set wildmenu

" set wildmenu to list choice
set wildmode=list:longest

" Clipboard integration (works on Mac OS X)
set clipboard=unnamed

" Map ; to :
noremap ; :

" Use space as leader key
let mapleader = " "

" Open 2 vertical windows if started with 2 files
if argc() == 2
    silent vertical all
endif

" Use a dark background
set background=dark

" Use 256 colors
if &term =~ "xterm"
 set t_Co=256
 if has("terminfo")
   let &t_Sf=nr2char(27).'[3%p1%dm'
   let &t_Sb=nr2char(27).'[4%p1%dm'
 else
   let &t_Sf=nr2char(27).'[3%dm'
   let &t_Sb=nr2char(27).'[4%dm'
 endif
endif

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
    \'z' : [ '$(date +%H:%M:%S)' ],
    \'warn' : [ promptline#slices#last_exit_code() ]}

" Clear high-lighted search results
nnoremap <Leader>/ :nohlsearch<CR>

" Syntastic configuration
let g:syntastic_rst_checkers = ['rstcheck']

" DiffSaved command
function! s:DiffWithSaved()
  let filetype=&ft
  diffthis
  vnew | r # | normal! 1Gdd
  diffthis
  exe "setlocal bt=nofile bh=wipe nobl noswf ro ft=" . filetype
endfunction
com! DiffSaved call s:DiffWithSaved()
