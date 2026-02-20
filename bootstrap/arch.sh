#!/usr/bin/env bash
set -eou pipefail

if [[ "$EUID" -eq 0 ]]; then
  SUDO=""
else
  SUDO="sudo"
fi

# Update system
$SUDO pacman -Syu --noconfirm

# Common
$SUDO pacman -S base-devel --noconfirm
$SUDO pacman -S curl --noconfirm
$SUDO pacman -S unzip --noconfirm
$SUDO pacman -S git --noconfirm
$SUDO pacman -S ripgrep --noconfirm
$SUDO pacman -S trash-cli --noconfirm
$SUDO pacman -S man-db --noconfirm
$SUDO pacman -S man-pages --noconfirm

# Node
$SUDO pacman -S nodejs npm --noconfirm

# Language
$SUDO pacman -S glibc --noconfirm
$SUDO sed -i 's/#en_US.UTF-8/en_US.UTF-8/' /etc/locale.gen
$SUDO locale-gen

# Tmux
$SUDO pacman -S tmux --noconfirm

# Nvim
$SUDO pacman -S neovim --noconfirm
$SUDO pacman -S fd --noconfirm
$SUDO pacman -S tree-sitter-cli --noconfirm

# zsh
$SUDO pacman -S zsh --noconfirm
chsh -s /bin/zsh

# Clipboard stuff
$SUDO pacman -S wl-clipboard xclip xsel --noconfirm 

sh -c "$(curl -fsSL https://starship.rs/install.sh)" -- -y
