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
- `bd` function for fast parent directory navigation

### `bd` – Smart directory traversal

The `bd` function lets you `cd` into a named parent folder or move up multiple directory levels easily.

Examples:
```bash
bd src         # jumps to the nearest parent folder named "src"
bd 3           # goes up 3 directories
```

Supports tab completion for parent directories.
