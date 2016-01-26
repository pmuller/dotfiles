let g:promptline_powerline_symbols=1
let prompt_is_root = {
    \'function_name': 'prompt_is_root',
    \'function_body': [
        \'function prompt_is_root {',
        \'    if [ $UID -eq 0 ]',
        \'    then',
        \'        echo -n "root"',
        \'    fi',
        \'}']}
let g:promptline_preset={
    \'a' : [ prompt_is_root, promptline#slices#battery({ 'threshold': 25 }), promptline#slices#jobs() ],
    \'b' : [ '$_vi_mode', promptline#slices#python_virtualenv() ],
    \'c' : [ promptline#slices#cwd() ],
    \'x' : [ promptline#slices#vcs_branch() ],
    \'y' : [ promptline#slices#git_status() ],
    \'z' : [ '$(date +%H:%M:%S)' ],
    \'warn' : [ promptline#slices#last_exit_code() ]}
