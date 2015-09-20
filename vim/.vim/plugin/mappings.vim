" Use space as leader key
let mapleader = " "

" Map ; to :
noremap ; :

" Clear high-lighted search results
nnoremap <silent> <Leader>/ :nohlsearch<CR>

" Toggle line numbering
nmap <silent> <Leader>n :set relativenumber!<CR>:set number!<CR>

" Toggle paste mode
nmap <silent> <Leader>p :set paste!<CR>

" Toggle line wrapping
nmap <silent> <Leader>w :set wrap!<CR>

" Use emacs-style bindings in command mode
cnoremap <C-A> <Home>
cnoremap <C-D> <Delete>
