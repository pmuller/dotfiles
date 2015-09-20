" colonless entrance into command mode
noremap ; :
noremap ! :!

" colonless replaying of recent command
noremap @; @:
noremap @! :!<Up><Return>

" Use emacs-style bindings in command mode
cnoremap <C-A> <Home>
cnoremap <C-D> <Delete>
