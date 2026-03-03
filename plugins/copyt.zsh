copyt () {
    local root="${1:-.}"
    local exclude_files=("package-lock.json" "yarn.lock" "pnpm-lock.yaml" "bun.lockb")

    # Join exclude files into --glob parameters for rg
    local rg_excludes=()
    for f in "${exclude_files[@]}"; do
        rg_excludes+=(--glob "!$f")
    done

    # Function to check if a file should be excluded
    should_ignore() {
        local base
        base=$(basename "$1")
        for f in "${exclude_files[@]}"; do
            [[ "$base" == "$f" ]] && return 0
        done
        return 1
    }

    # Binary check fallback
    is_binary() {
        file --mime "$1" | grep -qi 'charset=binary'
    }

    if command -v rg >/dev/null 2>&1; then
        # Use ripgrep if available
        rg --files --hidden "${rg_excludes[@]}" "$root" | while read -r file; do
            echo "====> ${file#$root/}"
            cat "$file"
            echo
        done | pbcopy
    else
        # Fallback using find + grep
        find "$root" \
            -type d \( -name .git -o -name node_modules -o -name dist -o -name build -o -name target -o -name .next -o -name .cache -o -name out \) -prune -o \
            -type f ! -name ".*" -print0 | while IFS= read -r -d '' file; do
            is_binary "$file" && continue
            should_ignore "$file" && continue
            echo "====> ${file#$root/}"
            cat "$file"
            echo
        done | pbcopy
    fi
}
