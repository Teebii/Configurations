#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Setting colors
ORANGE='\[\033[1;38;5;202m\]'
YELLOW='\[\033[0;38;5;226m\]'
RED='\[\033[1;38;5;196m\]'
GREEN='\[\033[1;32m\]'
LIGHTBLUE='\[\033[0;38;5;026m\]'
DEFAULT='\[\033[0m\]'


# Setting prompt
PROMPT_DIRTRIM=2
PS1="${YELLOW}[${ORANGE}\u${YELOW}@${GREEN}\h ${LIGHTBLUE}\w${YELLOW}]\$ ${DEFAULT}"
#PS1='[\u@\h \w]\$ '

# Setting aliases
alias ls='ls --all --color=auto --group-directories-first'
alias update='sudo pacman -Syu'

# Change directly into git
function cdgit () {
  cd ~/Dokumente/Github/"$1"
}

function up () {
	for (( i = 0; i < $1; i++ )); do
		cd ..
	done
}

# >>>>BEGIN ADDED BY CNCHI INSTALLER<<<< #
BROWSER=/usr/bin/google-chrome-stable
EDITOR=/usr/bin/subl3
# >>>>>END ADDED BY CNCHI INSTALLER<<<<< #
