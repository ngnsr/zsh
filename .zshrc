# General options
setopt extended_glob      # Enable extended globbing (required for compinit speedup)

# History settings in Zsh
setopt append_history     # Append to the history file, not overwrite
setopt share_history      # Share history across all sessions
setopt hist_ignore_space  # Ignore commands starting with a space
setopt hist_ignore_all_dups # Remove older duplicate entries in history

# completion
# Ensure target cache directory exists
mkdir -p "$XDG_CACHE_HOME/zsh"
autoload -Uz compinit
if [[ -n "$XDG_CACHE_HOME/zsh/zcompdump"(#qN.m+1) ]]; then
  compinit -d "$XDG_CACHE_HOME/zsh/zcompdump"
else
  compinit -C -d "$XDG_CACHE_HOME/zsh/zcompdump"
fi

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
for file in "$ZDOTDIR/plugins"/*.zsh; do
  [[ -f "$file" ]] && source "$file"
done

source <(fzf --zsh)
source "/opt/homebrew/opt/zsh-syntax-highlighting/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
source "/opt/homebrew/opt/zsh-autosuggestions/share/zsh-autosuggestions/zsh-autosuggestions.zsh"

# nvm
export NVM_DIR="$HOME/.nvm"
[ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
[ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"

