# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
bindkey -v
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/dcr/.zshrc'

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
zstyle ':vcs_info:*' unstagedstr '%166F●%f '
zstyle ':vcs_info:git*' check-for-changes true
zstyle ':vcs_info:git*' formats "%193F%b%f %u%c"
zstyle ':vcs_info:git*' actionformats "%193F%b (%a)%f %u%c%"

precmd() {
    local sha ahead

    vcs_info
    if [[ -n "${vcs_info_msg_0_}" ]]; then
        sha=$(git rev-parse --short=8 HEAD)
        ahead=$(git rev-list origin..$sha | wc -l)
        if [[ $ahead -gt 0 ]]; then
            vcs_info_msg_0_=${vcs_info_msg_0_}%033F▲$ahead%f" "%193F"➜ "$sha%f
        else
            vcs_info_msg_0_=${vcs_info_msg_0_}%193F"➜ "$sha%f
        fi    
    fi
    
    curr_dir=${PWD/#$HOME/\~}
    curr_dir=(${(s:/:)PWD/#$HOME/\~})
    short_path=()
    if [ ${#curr_dir} -eq 0 ]; then
        short_path=%214F"/"%f
    else
	if [ "${curr_dir[1]}" != '~' ]; then	
            short_path+=("")
	fi
        for (( i=1; i<${#curr_dir}; i++ ));
        do
            if [[ "${curr_dir[$i]}" = $'.'* ]]; then
                short_path+=(%058F${curr_dir[$i]:0:2}%f)
            else
                short_path+=(%058F${curr_dir[$i]:0:1}%f)
            fi
        done
        short_path+=(%214F${curr_dir[$#curr_dir]}%f)
        short_path=${(j:%214F/%f:)short_path}
    fi
}

setopt prompt_subst
PROMPT=%B%(!.%F{red}[%n" "%m]%f.%F{default}[%n" "%m]%f)%b%214F[%f$'${short_path}'%214F]%f%B%(!.%F{red}%#%f.%F{default}%#%f)%b" "
RPROMPT=$'${vcs_info_msg_0_}'

eval "$(dircolors ~/dircolors)"

alias ls="ls --color=auto"
alias a="ls -lah --color=auto"
alias c="cd $HOME/code"
alias e="nvim"
alias p="pwd"
