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
zstyle ':vcs_info:git*' formats "%193F%b%f %u%c"
zstyle ':vcs_info:git*' actionformats "%193F%b (%a)%f %u%c%"

precmd() {
  vcs_info
  if [[ -n "${vcs_info_msg_0_}" ]]; then
#    vcs_info_msg=%045F$(git rev-parse --short=8 HEAD)%f${vcs_info_msg_0_}  
    vcs_info_sha=%193F$(git rev-parse --short=8 HEAD)%f
  else
    unset vcs_info_sha	  
  fi
}

setopt prompt_subst
PROMPT=%B%(!.%F{red}[%n" "%m]%f.%F{default}[%n" "%m]%f)%b%214F[%f$'${vcs_info_msg_0_}'%214F%1~]%f%B%(!.%F{red}%#%f.%F{default}%#%f)%b" "
RPROMPT=$'${vcs_info_sha}'

eval "$(dircolors ~/dircolors)"

alias ls="ls --color=auto"
alias a="ls -lah --color=auto"
alias c="cd $HOME/code"
alias e="nvim"
alias p="pwd"
