# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
bindkey -v
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/dcrisan/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

autoload -U promptinit
promptinit
prompt oliver

eval "$(dircolors ~/dircolors)"

alias ls="ls --color=auto"
alias a="ls -lah --color=auto"
alias c="cd $HOME/code"
alias e="nvim"
