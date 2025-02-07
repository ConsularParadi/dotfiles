# !/bin/bash

curl --proto '=https' --tlsv1.2 https://sh.rustup.rs -sSf | sh
echo "fish_add_path $HOME/.cargo/bin" | tee -a $HOME/.config/fish/config.fish
