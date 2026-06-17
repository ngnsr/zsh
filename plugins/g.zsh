# List projects + zsh + nvim folders
g() {
  local dirs=("$HOME/proj"/*(/) "$XDG_CONFIG_HOME"/{zsh,nvim})
  local selected
  selected=$(printf '%s\n' "${dirs[@]}" | fzf --preview 'ls -la {}')
  if [[ -n "$selected" ]]; then
    cd "$selected"
  fi
}
