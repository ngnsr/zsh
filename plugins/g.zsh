# List projects + zsh + nvim folders
g() {
  local dirs=("$HOME/proj"/*(/) "$XDG_CONFIG_HOME"/{zsh,nvim})
  cd "$(printf '%s\n' "${dirs[@]}" | fzf --preview 'ls -la {}')" || return
}
