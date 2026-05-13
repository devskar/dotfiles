# ---- Navigation ----
alias ..='cd ..'
alias ...='cd ../..'

# ---- source ----
alias so='source ~/.zshrc'

# ---- ls replacements ----
if ls --color=auto /dev/null >/dev/null 2>&1; then
  alias ll='ls -lah --color=auto'
  alias ls='ls -l --color=auto'
else
  alias ll='ls -lah'
  alias ls='ls -l'
fi

# ---- NeoVim -----
alias vim='nvim'

# ---- tmux ----
alias t='tmux'
alias ta='tmux attach -t'
alias tn='tmux new -s'

# ---- trash cli ----
alias rm='trash'

# ---- docker ----
alias dubu='docker run --rm -it ubuntu bash'
alias dalp='docker run --rm -it alpine ash'

# ---- git open ----
alias go="git-open"
