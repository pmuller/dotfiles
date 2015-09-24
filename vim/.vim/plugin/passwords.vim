" Always use blowfish
set cryptmethod=blowfish2
" When editing an encrypted file, ensure no cleartext data is written
autocmd BufReadPost * if &key != "" | set noswapfile nowritebackup viminfo= nobackup noshelltemp history=0 secure | endif
