#!/usr/bin/env bash
set -eou pipefail

# Update system
brew update
brew upgrade

# Common
brew install curl
brew install unzip
brew install git
brew install trash-cli

# Node
brew install node

# Tmux
brew install tmux

# Nvim
brew install neovim
brew install starship
brew install fd # for telescope
brew install ripgrep # for telescope
