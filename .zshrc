# Set umask
umask g-w,o-rwx

# If command is a path, cd into it
setopt auto_cd

# Colourfull messages
e_header()  { echo -e "\n\033[1m$@\033[0m"; }
e_success() { echo -e " \033[1;32m✔\033[0m  $@"; }
e_error()   { echo -e " \033[1;31m✖\033[0m  $@"; }

# Croptesting
#source ${ZDOTDIR:-${HOME}}/.config/zsh/frameworks.zsh

# Load zgen only if a user types a zgen command
zgen () {
	if [[ ! -s ${ZDOTDIR:-${HOME}}/.zgen/zgen.zsh ]]; then
		git clone --recursive https://github.com/tarjoilija/zgen.git ${ZDOTDIR:-${HOME}}/.zgen
	fi
	source ${ZDOTDIR:-${HOME}}/.zgen/zgen.zsh
	zgen "$@"
}

# Generate zgen init script if needed
if [[ ! -s ${ZDOTDIR:-${HOME}}/.zgen/init.zsh ]]; then
	zgen load zsh-users/zsh-autosuggestions
	zgen load zdharma/fast-syntax-highlighting
	zgen load zsh-users/zsh-history-substring-search
	zgen oh-my-zsh plugins/shrink-path
	#zgen oh-my-zsh plugins/tmux
	zgen save
	zcompile ${ZDOTDIR:-${HOME}}/.zgen/init.zsh
fi

# Load dircolors
if [ -s ${ZDOTDIR:-${HOME}}/.dircolors ]; then
	if (( $+commands[gdircolors] )); then
		eval $(command gdircolors -b ${ZDOTDIR:-${HOME}}/.dircolors)
	elif (( $+commands[dircolors] )); then
		eval $(command dircolors -b ${ZDOTDIR:-${HOME}}/.dircolors)
	fi
fi

# Load settings
if [[ ! -s ${ZDOTDIR:-${HOME}}/.config/zsh/cache/settings.zsh ]]; then
	source ${ZDOTDIR:-${HOME}}/.config/zsh/functions.zsh
	recreateCachedSettingsFile
fi
source ${ZDOTDIR:-${HOME}}/.config/zsh/cache/settings.zsh

# Load customized prompt
fpath=(/${ZDOTDIR:-${HOME}}/.config/zsh/functions $fpath)
autoload -Uz promptinit && promptinit
prompt tuurlijk

# Remove whitespace after the RPROMPT
#ZLE_RPROMPT_INDENT=0

setopt no_beep
eval "$(rbenv init -)"
