#!/usr/bin/env bash
set -ex

echo "Installing dotfiles..."

mkdir -p ~/.config

ln -sf ~/dotfiles/zsh/.zshrc ~/.zshrc
ln -sf ~/dotfiles/zsh/.zshenv ~/.zshenv
ln -sf ~/dotfiles/tmux/tmux.conf ~/.tmux.conf
ln -sf ~/dotfiles/starship/starship.toml ~/.config/starship.toml
ln -sf ~/dotfiles/zsh/.zsh_plugins.txt ~/.zsh_plugins.txt
ln -sfn ~/dotfiles/nvim ~/.config/nvim
ln -sfn ~/dotfiles/wezterm ~/.config/wezterm
ln -sfn ~/dotfiles/ghostty ~/.config/ghostty
ln -sfn ~/dotfiles/make ~/.make

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

# ---- Zsh Plugin Manager ----
if [ ! -d ~/.antidote ]; then
  git clone --depth=1 https://github.com/mattmc3/antidote.git ~/.antidote
fi

# ---- Tmux Plugin Manager ----
if [ ! -d ~/.tmux/plugins/tpm ]; then
  git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
fi

# ---- Kubectl Plugin Manager ----
if [ ! -d ~/.krew ]; then
  cd "$(mktemp -d)"
  OS="$(uname | tr '[:upper:]' '[:lower:]')"
  ARCH="$(uname -m | sed -e 's/x86_64/amd64/' -e 's/\(arm\)\(64\)\?.*/\1\2/' -e 's/aarch64$/arm64/')"
  KREW="krew-${OS}_${ARCH}"
  curl -fsSLO "https://github.com/kubernetes-sigs/krew/releases/latest/download/${KREW}.tar.gz"
  tar zxvf "${KREW}.tar.gz"
  ./"${KREW}" install krew
fi

echo
echo "Installed dotfiles!"

echo "Run: source ~/.zshrc"
