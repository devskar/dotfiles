# ---- Load antidote ----
source ~/.antidote/antidote.zsh
antidote load

# Source .zshrc.d.
for _rc in $HOME/dotfiles/zsh/.zshrc.d/**/*.zsh; do
  # Ignore tilde files.
  if [[ $_rc:t != '~'* ]]; then
    source "$_rc"
  fi
done
unset _rc

# ---- Tmux auto start (disabled; uncomment if desired) ----
# if command -v tmux >/dev/null && [ -z "$TMUX" ]; then
#   tmux attach -t main || tmux new -s main
# fi

# Starship
eval "$(starship init zsh)"

# opencode
export PATH=/Users/oskar/.opencode/bin:$PATH
