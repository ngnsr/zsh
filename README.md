# Zsh Config

A simple, minimal Zsh configuration. Includes tab completion, directory color support, useful functions, and clean structure for managing shell behavior.

> 📝 This setup is based on and adapted from  
> [The Valuable Dev – Install and Configure Zsh for a Better Terminal](https://thevaluable.dev/zsh-install-configure-mouseless/)

## Installation

1. Make sure Zsh is installed:

   ```bash
   zsh --version
   ```

   If not installed, you can install it via your package manager:

   - macOS (Homebrew): `brew install zsh`
   - Debian/Ubuntu: `sudo apt install zsh`
   - Arch Linux: `sudo pacman -S zsh`

2. Set Zsh as your default shell:

   ```bash
   chsh -s $(which zsh)
   ```

3. Clone this repository into your `.config` directory:

   ```bash
   git clone https://github.com/your-username/zsh-config.git ~/.config/zsh
   ```

4. Move the `.zshenv` file to your home directory:

   ```bash
   cp ~/.config/zsh/.zshenv ~/
   ```

5. Restart your terminal.

## Structure

This config separates environment variables from interactive shell settings:

- **`~/.zshenv`**: Always loaded — used for setting `PATH`, language, and other environment variables.
- **`~/.config/zsh/*`**: Contains functions, aliases, completion settings, and interactive behavior.

Modular and clean — ideal for syncing or managing across systems.

## Included Features

- Smart tab completion with color support
- Modular function loading
- Clean separation of concerns
- Git prompt showing live file and line-change stats
- Modular alias and function loading

### Git prompt — compact live stats

The prompt shows a clean, color-coded summary of your Git working tree:

```
~/repo λ main 3 2 1 +84 -17
>
```

| Token | Color | Meaning |
|-------|-------|---------|
| `λ` | red | Git indicator |
| `main` | cyan | Current branch (or commit hash if detached) |
| `3` | yellow | Modified files |
| `2` | green | New files (tracked + untracked) |
| `1` | red | Deleted files |
| `+84` | green | Lines added (staged + unstaged) |
| `-17` | red | Lines removed |

When the working tree is clean, only `λ main` is shown — no noise.
