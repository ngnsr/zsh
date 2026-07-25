#!/usr/bin/env zsh

# Note: For this file to be loaded, your bootstrap ~/.zshenv (in your home folder)
# should set ZDOTDIR and source this file:
#
#   export ZDOTDIR="$HOME/.config/zsh"
#   [ -f "$ZDOTDIR/.zshenv" ] && source "$ZDOTDIR/.zshenv"

###############################
# EXPORT ENVIRONMENT VARIABLE #
###############################

#export TERM='rxvt-256color'
export DOTFILES="$HOME/.dotfiles"
export WORKSPACE="$HOME/workspace"

[ -f "$DOTFILES/install_config" ] && source "$DOTFILES/install_config"

# XDG
export XDG_CONFIG_HOME=$HOME/.config
export XDG_DATA_HOME=$XDG_CONFIG_HOME/local/share
export XDG_CACHE_HOME=$XDG_CONFIG_HOME/cache

# editor
export EDITOR="nvim"
export VISUAL="nvim"

# zsh
export ZDOTDIR="$XDG_CONFIG_HOME/zsh"
export HISTFILE="$ZDOTDIR/.zhistory"    # History filepath
export HISTSIZE=100000                  # Maximum events for internal history
export SAVEHIST=100000                  # Maximum events in history file

# other software
export VIMCONFIG="$XDG_CONFIG_HOME/nvim"
# export GIMP_VERSION="2.10"
export SCREENSHOT="$HOME/Documents/images/screenshots"

# Man pages
# export MANPAGER='nvim +Man!'
export MANPAGER="vim +MANPAGER -"

# fzf
export FZF_DEFAULT_COMMAND='rg --files --hidden --glob "!.git"'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

FZF_COLORS="bg+:-1,\
fg:gray,\
fg+:white,\
border:black,\
spinner:0,\
hl:yellow,\
header:blue,\
info:green,\
pointer:red,\
marker:blue,\
prompt:gray,\
hl+:red"

export FZF_DEFAULT_OPTS="--height 60% \
--border sharp \
--layout reverse \
--color '$FZF_COLORS' \
--prompt '∷ ' \
--pointer ▶ \
--marker ⇒"
export FZF_ALT_C_OPTS="--preview 'tree -C {} | head -n 10'"
export FZF_COMPLETION_DIR_COMMANDS="cd pushd rmdir tree ls"

# golang
export GOPATH="$WORKSPACE/go"
export GOBIN="$WORKSPACE/go/bin"
export GOCACHE="$XDG_CACHE_HOME/go-build"

# NPM
export NPM_PATH="$XDG_CONFIG_HOME/node_modules"
export NPM_BIN="$XDG_CONFIG_HOME/node_modules/bin"

# git
export GIT_REVIEW_BASE=main # See gitconfig

export ANDROID_HOME=$HOME/Android
export ANDROID_SDK_ROOT=$ANDROID_HOME
export ANDROID_AVD_HOME=$HOME/.config/.android/avd

# PATH
path=(
  $GOBIN
  $NPM_BIN
  /opt/homebrew/opt/postgresql@18/bin
  $HOME/repos/flutter/bin
  $ANDROID_HOME/emulator
  $ANDROID_HOME/platform-tools
  $ANDROID_HOME/cmdline-tools/latest/bin
  $path
)
