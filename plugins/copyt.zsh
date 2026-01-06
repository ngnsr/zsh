copyt() {
  local root="${1:-.}"

  is_binary() {
    file --mime "$1" | grep -q 'charset=binary'
  }

  # -----------------------------
  # Git-aware path (preferred)
  # -----------------------------
  if git -C "$root" rev-parse --is-inside-work-tree >/dev/null 2>&1; then
    git -C "$root" ls-files -z |
    while IFS= read -r -d '' file; do
      local full="$root/$file"
      is_binary "$full" && continue

      echo "====> $file"
      cat "$full"
      echo
    done | pbcopy

    return
  fi

  # -----------------------------
  # Fallback: find-based
  # -----------------------------
  find "$root" \
    -type d \( \
      -name .git -o \
      -name node_modules -o \
      -name dist -o \
      -name build -o \
      -name target -o \
      -name .next -o \
      -name .cache -o \
      -name out \
    \) -prune -o \
    -type f ! -name ".*" -print0 |
  while IFS= read -r -d '' file; do
    is_binary "$file" && continue

    echo "====> $file"
    cat "$file"
    echo
  done | pbcopy
}

