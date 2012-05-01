setopt prompt_subst

if [[ "$HOST" =~ 'kyle-sg.*' ]]; then
  PCOLOR="$PR_GREEN"
elif [[ "$HOST" == 'sendgrid' ]]; then
  PCOLOR="$PR_BOLD_MAGENTA"
else
  PCOLOR="$PR_WHITE"
fi

export PROMPT=' $PCOLOR%% $RESET'
# this needs to be single quotes or it will evaluate the git_info_for_prompt call
export RPROMPT='$PR_BOLD_BLUE${PWD/#$HOME/~}$PR_BOLD_YELLOW$(git_info_for_prompt) $RESET$PCOLOR%m$RESET'

export EDITOR='vim'
export PATH="bin:$HOME/.bin:/usr/local/bin:/usr/local/sbin:$PATH"
export MANPATH="/usr/local/man:/usr/local/mysql/man:/usr/local/git/man:$MANPATH"

fpath=(~/.zsh/functions $fpath)

autoload -U ~/.zsh/functions/*(:t)

# History config
HISTFILE=~/.zsh_history
HISTSIZE=1000
SAVEHIST=10000

# print elapsed time when more than 10 seconds
REPORTTIME=10

# options taken from oh-my-zsh
unsetopt menu_complete   # do not autoselect the first completion entry
unsetopt flowcontrol     # gets rid of ctrl-s and ctrl-q
setopt auto_menu         # show completion menu on succesive tab press
setopt complete_in_word
setopt always_to_end

setopt NO_BG_NICE # don't nice background tasks
setopt NO_HUP
setopt NO_LIST_BEEP
setopt LOCAL_OPTIONS # allow functions to have local options
setopt LOCAL_TRAPS # allow functions to have local traps
setopt HIST_VERIFY
setopt SHARE_HISTORY # share history between sessions ???
setopt EXTENDED_HISTORY # add timestamps to history
setopt PROMPT_SUBST
setopt CORRECT
setopt COMPLETE_IN_WORD

setopt APPEND_HISTORY # adds history
setopt INC_APPEND_HISTORY SHARE_HISTORY  # adds history incrementally and share it across sessions
setopt HIST_IGNORE_ALL_DUPS  # don't record dupes in history
setopt HIST_REDUCE_BLANKS

# key bindings
bindkey -e
bindkey '^[^[[D' backward-word
bindkey '^[^[[C' forward-word
bindkey '^[[5D' beginning-of-line
bindkey '^[[5C' end-of-line
bindkey '^[[3~' delete-char
bindkey '^[^N' newtab
bindkey '^?' backward-delete-char
bindkey '^r' history-incremental-search-backward

# make search up and down work, so partially type and hit up/down to find relevant stuff
bindkey '^[[A' up-line-or-search
bindkey '^[[B' down-line-or-search

bindkey ' ' magic-space    # also do history expansion on space

# grep colors
export GREP_OPTIONS='--color=auto'
export GREP_COLOR='1;32'
