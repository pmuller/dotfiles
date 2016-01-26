# src: https://github.com/edkolev/promptline.vim/issues/10

_vi_ins_mode="I"
_vi_cmd_mode="N"
_vi_mode=$_vi_ins_mode

function zle-keymap-select {
  _vi_mode="${${KEYMAP/vicmd/${_vi_cmd_mode}}/(main|viins)/${_vi_ins_mode}}"
  __promptline
  zle reset-prompt
}
zle -N zle-keymap-select

function zle-line-finish {
  _vi_mode=$_vi_ins_mode
}
zle -N zle-line-finish

function TRAPINT() {
  _vi_mode=$_vi_ins_mode
  return $(( 128 + $1 ))
}
