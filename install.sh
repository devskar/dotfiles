#!/usr/bin/env bash
set -e

echo "Installing dotfiles..."

mkdir -p ~/.config

ln -sf ~/dotfiles/zsh/zshrc ~/.zshrc
ln -sf ~/dotfiles/tmux/tmux.conf ~/.tmux.conf
ln -sf ~/dotfiles/starship/starship.toml ~/.config/starship.toml
ln -sf ~/dotfiles/zsh/.zsh_plugins.txt ~/.zsh_plugins.txt
ln -sfn ~/dotfiles/nvim ~/.config/nvim

# ---- OS-specific-tweaks
case "$OSTYPE" in
  darwin*) source ~/dotfiles/bootstrap/macos.sh ;;
  linux*)  source ~/dotfiles/bootstrap/linux.sh ;;
esac

git clone --depth=1 https://github.com/mattmc3/antidote.git ~/.antidote

echo "Installed dotfiles!"

source ~/.zshrc
