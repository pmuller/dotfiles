" Vagrantfiles should use the ruby filetype
augroup vagrant
    au!
    au BufRead,BufNewFile Vagrantfile set filetype=ruby
augroup END
