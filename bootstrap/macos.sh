#!/usr/bin/env bash
set -eou pipefail

# Update system
brew update
brew upgrade

# Common
brew install curl
brew install unzip
brew install git
brew install ripgrep
brew install trash-cli

brew install tmux
brew install neovim
brew install starship

