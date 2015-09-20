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
