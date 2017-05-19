HISTFILE=~/.zshhistory
HISTSIZE=3000
SAVEHIST=3000

export GREP_OPTIONS='--color=auto'
export GREP_COLOR='38;5;202'

export LESS_TERMCAP_mb=$'\E[01;31m'       # begin blinking
export LESS_TERMCAP_md=$'\E[01;38;5;74m'  # begin bold
export LESS_TERMCAP_me=$'\E[0m'           # end mode
export LESS_TERMCAP_se=$'\E[0m'           # end standout-mode
export LESS_TERMCAP_so=$'\E[38;33;172m'   # begin standout-mode - info box
export LESS_TERMCAP_ue=$'\E[0m'           # end underline
export LESS_TERMCAP_us=$'\E[04;38;5;172m' # begin underline
export LESS=-r

# Set GPG TTY
export GPG_TTY=$(tty)

export PATH=\
${HOME}/Library/Python/2.7/bin:\
${HOME}/bin:\
${HOME}/.rvm/bin:\
${PATH}
