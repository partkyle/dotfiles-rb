. ~/.zsh/colors.zsh
. ~/.zsh/config.zsh
. ~/.zsh/aliases.zsh
. ~/.zsh/completion.zsh

# use .localrc for settings specific to one system
[[ -f ~/.localrc ]] && .  ~/.localrc
