#!/usr/bin/env bash
apt update
apt install software-properties-common -y
add-apt-repository ppa:neovim-ppa/unstable -y
apt install tmux -y
apt install neovim -y
apt install curl -y
apt install git -y
apt install build-essential -y
apt install zsh -y
sh -c "$(curl -fsSL https://starship.rs/install.sh)" -- -y
