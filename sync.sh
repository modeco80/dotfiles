#!/bin/bash

# Sync dotfiles tree, effectively installing it

# Prefix (default home directory)
PREFIX="$HOME"
[[ "$1" != "" ]] && PREFIX="$1";

copy_ensuring() {
    local dn=$(dirname $2)

    [[ ! -d "$dn" ]] && {
        echo "making directory \"$dn\""
        mkdir -p $dn
    };

    echo "copying $1"
    cp -v $1 $2
}

copy_recursively_ensuring() {
    [[ ! -d "$2" ]] && {
        echo "making directory \"$2\""
        mkdir -p $2
    };

    echo "copying directory $1 to $2"
    cp -rv $1/* $2
}

copy_ensuring bashrc $PREFIX/.bashrc
copy_ensuring vimrc $PREFIX/.vimrc

copy_recursively_ensuring config $PREFIX/.config/
copy_recursively_ensuring lib $PREFIX/.dotf/
copy_recursively_ensuring bin $PREFIX/.local/bin/

copy_ensuring bg.jpg $PREFIX
copy_ensuring face.png $PREFIX

ln -s $PREFIX/face.png $PREFIX/.face
