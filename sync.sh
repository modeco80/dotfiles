#!/bin/bash

# sync dotfiles and config tree
cp -v bashrc ~/.bashrc
cp -rv bin/ ~/
cp -v bg.jpg ~

cp -rv config/* ~/.config
