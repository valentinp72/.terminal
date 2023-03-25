ZSH_DISABLE_COMPFIX=true

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# move .zcompdump to another folder
export ZSH_COMPDUMP=$ZSH/cache/.zcompdump

ZSH_THEME="robbyrussell"

plugins=(
	ssh-agent
	extract
	git
)

source $ZSH/oh-my-zsh.sh
source $ZSH_CUSTOM/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source $ZSH_CUSTOM/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

autoload -U colors && colors
autoload -Uz vcs_info        # infos about git

# move .zcompdump to one file only
compinit -d $HOME/.zcompdump

NEWLINE=$'\n' # the newline character

# Conda clobbers HOST, so we save the real hostname into another variable.
# https://github.com/conda/conda/issues/7031
HOSTNAME="$(hostname)"

precmd() {
    OLDHOST="${HOST}"
    HOST="${HOSTNAME}"
    vcs_info
}

preexec() {
    HOST="${OLDHOST}"
}

HOST=$(hostname)
# PROMPT=""
PROMPT=\$vcs_info_msg_0_
PROMPT+="${NEWLINE}"                        # prompt on a new line
PROMPT+="%{$fg[yellow]%}%n"                 # username
PROMPT+="%{$reset_color%}@"                 # @
PROMPT+="%{$fg[blue]%}%m"                   # hostname
PROMPT+=" %{$fg[magenta]%}%~"               # directory (from ~ or /)
PROMPT+="${NEWLINE}  "                      # new line
PROMPT+="%(?.%{$fg[green]%}.%{$fg[red]%})❯" # the prompt with red color if error was returned
PROMPT+="%{$reset_color%} "                 # we reset the color

# =======
# EXPORTS
# =======

# best euro-english locale: https://unix.stackexchange.com/a/62317
export LANGUAGE=en_IE.UTF-8
export LANG=en_IE.UTF-8
export LC_ALL=en_IE.UTF-8

# =======
# ALIASES
# =======

alias ls="ls --human-readable --color"
