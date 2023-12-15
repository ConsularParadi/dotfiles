# !/bin/bash

source ./utils.sh

check_sudo;

echo 'This script sets up doom emacs and related config files on system'

yesno;

envvars;

$iy install emacs;
git clone --depth 1 https://github.com/doomemacs/doomemacs ~/.config/emacs
~/.config/emacs/bin/doom install


