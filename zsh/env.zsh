# ---- XDG base dirs ----
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DATA_HOME="$HOME/.local/share"

# ---- Man Pages ----
export MANPAGER="nvim +Man!"

# ---- Editors ----
export EDITOR="nvim"
export VISUAL="nvim"

# ---- Language / locale ----
export LANG="en_US.UTF-8"
export LC_ALL="en_US.UTF-8"

# ---- Dotnet ----
export DOTNET_ROOT="$HOME/.dotnet"
# ---- Path ----
typeset -U path
path=(
  "$HOME/bin"
  "$HOME/.local/bin"
  "$DOTNET_ROOT"
  $path
)
