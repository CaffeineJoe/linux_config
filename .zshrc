# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
bindkey -v
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '~/.zshrc'

autoload -Uz compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
_comp_options+=(globdots)

# Use vim keys in tab complete menu:
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history

# Prompts
# autoload -U promptinit
# promptinit
# prompt oliver

autoload -U colors zsh/terminfo
colors

autoload -Uz vcs_info
zstyle 'vcs_info:*' enable git
zstyle ':vcs_info:*' stagedstr '%2F+%f'
zstyle ':vcs_info:*' unstagedstr '%1F*%f'
zstyle ':vcs_info:git*' check-for-changes true
zstyle ':vcs_info:git*' formats "%2F%b%f%u%c"
zstyle ':vcs_info:git*' actionformats "%2F%b(%a)%f%u%c%"

precmd() {
    local sha branch ahead

    vcs_info
    if [[ -n "${vcs_info_msg_0_}" ]]; then
        sha=$(git rev-parse --short=8 HEAD)
        branch=$(git rev-parse --abbrev-ref HEAD)
        ahead=$(git rev-list origin/$branch..$sha | wc -l)
        if [[ $ahead -gt 0 ]]; then
            vcs_info_msg_0_=%2F[%f%4F$sha%f%7F"@"%f${vcs_info_msg_0_}%04F^$ahead%f%2F]%f
        else
            vcs_info_msg_0_=%2F[%f%4F$sha%f%7F"@"%f${vcs_info_msg_0_}%2F]%f
       fi
    fi

    curr_dir=${PWD/#$HOME/\~}
    curr_dir=(${(s:/:)PWD/#$HOME/\~})
    short_path=()
    if [ ${#curr_dir} -eq 0 ]; then
        short_path=%3F"/"%f
    else
    if [ "${curr_dir[1]}" != '~' ]; then
            short_path+=("")
    fi
        for (( i=1; i<${#curr_dir}; i++ ));
        do
            if [[ "${curr_dir[$i]}" = $'.'* ]]; then
                short_path+=(%7F${curr_dir[$i]:0:2}%f)
            else
                short_path+=(%7F${curr_dir[$i]:0:1}%f)
            fi
        done
        short_path+=(%3F${curr_dir[$#curr_dir]}%f)
        short_path=${(j:%7F/%f:)short_path}
    fi
}

setopt prompt_subst
# PROMPT with hostname & username
#PROMPT=%B%(!.%F{red}[%n" "%m]%f.%F{default}[%n" "%m]%f)%b%214F[%f$'${short_path}'%214F]%f$'${vcs_info_msg_0_}'$'\n'" "%B%(!.%F{red}%#%f.%F{default}%#%f)%b" "
PROMPT=%3F[%f$'${short_path}'%3F]%f$'${vcs_info_msg_0_}'$'\n'" "%B%(!.%F{red}%#%f.%F{default}%#%f)%b" "

eval "$(dircolors ~/dircolors)"

. ~/.zsh_aliases

# Edit line in vim with ctrl-e:
# autoload edit-command-line; zle -N edit-command-line
# bindkey '^o' edit-command-line

. /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
