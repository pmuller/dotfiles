_prepend_path_if_exists() {
    local DIR=$1

    if [[ -d $DIR ]]
    then
        export PATH=$DIR${PATH:+:${PATH}}
    fi
}


_load_local_software() {
    NAME=$1
    PREFIX=${2-$HOME/local/$NAME}
    _prepend_path_if_exists $PREFIX/bin
    _prepend_path_if_exists $PREFIX/sbin
}


_load_local_software vim
_load_local_software packer
_load_local_software terraform
_load_local_software amtool
_load_local_software gitflow-avh
