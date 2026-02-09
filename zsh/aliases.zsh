# ---- Navigation ----
alias ..='cd ..'
alias ...='cd ../..'

# ---- ls replacements ----
alias ll='ls -lah --color=auto'
alias ls='ls -l --color=auto'

# ---- NeoVim -----
alias vim='nvim'

# ---- tmux ----
alias t='tmux'
alias ta='tmux attach -t'
alias tn='tmux new -s'

# ---- trash cli ----
alias 'rm -r'='trash'
alias 'rm -rf'='trash'
alias rm='trash'

# ---- docker ----
alias dubu='docker run --rm -it ubuntu bash'
alias dalp='docker run --rm -it alpine ash'
