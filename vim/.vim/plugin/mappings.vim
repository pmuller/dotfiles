" Clear high-lighted search results
nnoremap <silent> <Leader>/ :nohlsearch<CR>

" Toggle line numbering
nmap <silent> <Leader>n :set relativenumber!<CR>:set number!<CR>

" Toggle paste mode
nmap <silent> <Leader>p :set paste!<CR>

" Toggle line wrapping
nmap <silent> <Leader>w :set wrap!<CR>:set wrap?<CR>

" <Leader>d to view git diff of current buffer
nmap <Leader>d :!clear<CR>:!git diff %<CR>
