# History settings in Zsh
HISTSIZE=10000         # Number of commands to remember
SAVEHIST=10000         # Number of commands to save
HISTFILE=~/.zsh_history # The history file location
setopt append_history  # Append to the history file, not overwrite
setopt share_history   # Share history across all sessions

# competion
autoload -U compinit; compinit
_comp_options+=(globdots)
source $ZDOTDIR/completion.zsh

# prompt
fpath=($ZDOTDIR $fpath)
autoload -Uz prompt; prompt

# cd
setopt AUTO_PUSHD           # Push the current directory visited on the stack.
setopt PUSHD_IGNORE_DUPS    # Do not store duplicates in the stack.
setopt PUSHD_SILENT         # Do not print the directory stack after pushd or popd.

# vim
bindkey -v
export KEYTIMEOUT=1
source "$ZDOTDIR/cursor"
zmodload zsh/complist
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history
autoload -Uz edit-command-line
zle -N edit-command-line
bindkey -M vicmd v edit-command-line

source $ZDOTDIR/bindings.zsh
source $ZDOTDIR/aliases

# plugins
source $ZDOTDIR/plugins/bd.zsh

source <(fzf --zsh)
source "/usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
source "/usr/local/share/zsh-autosuggestions/zsh-autosuggestions.zsh"

[ -f "/Users/rr/.ghcup/env" ] && . "/Users/rr/.ghcup/env" # ghcup-env
#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"
export PATH="/usr/local/opt/postgresql@15/bin:$PATH"
