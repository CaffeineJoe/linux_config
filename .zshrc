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

# Prompts
autoload -U promptinit
promptinit
prompt oliver

autoload -U colors zsh/terminfo
colors

autoload -Uz vcs_info
zstyle 'vcs_info:*' enable git
zstyle ':vcs_info:*' stagedstr '%083F●%f '
zstyle ':vcs_info:*' unstagedstr '%227F●%f '
zstyle ':vcs_info:git*' check-for-changes true
#zstyle ':vcs_info:git*' formats "%33F[%b%f %u%c%33F]%f"
#zstyle ':vcs_info:git*' actionformats "%33F[%b (%a)%f %u%c%33F]%f"
zstyle ':vcs_info:git*' formats "%b %u%c"

precmd() {
  vcs_info
}

setopt prompt_subst
PROMPT=%B%(!.%F{red}[%n" "%m]%f.%F{default}[%n" "%m]%f)%b%33F[%1~]%f[$'${vcs_info_msg_0_}']%B%(!.%F{red}%#%f.%F{default}%#%f)%b" "

eval "$(dircolors ~/dircolors)"

alias ls="ls --color=auto"
alias a="ls -lah --color=auto"
alias c="cd $HOME/code"
alias e="nvim"
alias p="pwd"
