let g:promptline_powerline_symbols=1
let g:promptline_preset={
    \'a' : [ promptline#slices#jobs() ],
    \'b' : [ promptline#slices#python_virtualenv() ],
    \'c' : [ promptline#slices#cwd() ],
    \'x' : [ promptline#slices#vcs_branch() ],
    \'y' : [ promptline#slices#git_status() ],
    \'z' : [ '$(date +%H:%M:%S)' ],
    \'warn' : [ promptline#slices#last_exit_code() ]}
