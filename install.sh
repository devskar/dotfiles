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
  linux*)
    source /etc/os-release
    case "$ID" in
      arch) source ~/dotfiles/bootstrap/arch.sh ;;
      ubuntu|debian) source ~/dotfiles/bootstrap/ubuntu.sh ;;
      *) echo "Error: Unsupported distro: $ID"; exit 1 ;;
    esac
    ;;
esac

rm -rf ~/.antidote
git clone --depth=1 https://github.com/mattmc3/antidote.git ~/.antidote

rm -rf ~/.tmux/plugins
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

echo
echo "Installed dotfiles!"

echo "Run: source ~/.zshrc"
