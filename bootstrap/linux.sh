#!/usr/bin/env bash
set -eou pipefail

if [[ "$EUID" -eq 0 ]]; then
  SUDO=""
else
  SUDO="sudo"
fi

# Update system
$SUDO apt update
$SUDO apt upgrade -y
$SUDO apt install curl -y

# Common
$SUDO apt install software-properties-common -y
$SUDO apt install git -y
$SUDO apt install build-essential -y
$SUDO apt install ripgrep -y
$SUDO apt install groff-base -y
$SUDO apt install manpages -y

# Lanugage
$SUDO apt install locales -y
$SUDO locale-gen en_US.UTF-8

# Tmux
$SUDO apt install tmux -y

# Nvim
$SUDO add-apt-repository ppa:neovim-ppa/unstable -y
$SUDO apt install neovim -y

# zsh
$SUDO apt install zsh -y
chsh -s $(which zsh)

sh -c "$(curl -fsSL https://starship.rs/install.sh)" -- -y
