#!/usr/bin/env bash
apt update
apt install software-properties-common -y
add-apt-repository ppa:neovim-ppa/unstable -y
apt install tmux -y
apt install neovim -y
apt install curl -y
apt install git -y
apt install build-essential -y

# zsh
apt install zsh -y
chsh -s $(which zsh)

sh -c "$(curl -fsSL https://starship.rs/install.sh)" -- -y
