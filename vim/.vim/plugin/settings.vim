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
"set nowrap

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
