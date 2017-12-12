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
TUERKIS='\[\033[1;36m\]'
DEFAULT='\[\033[0m\]'

#Git Branch
parse_git_branch() {
     git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}

# aktiviert Bashvervollständigung in interaktiven Shells
if [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
fi

# Setting prompt
PROMPT_DIRTRIM=2
PS1="${YELLOW}[${ORANGE}\u${YELLOW}@${GREEN}\h ${LIGHTBLUE}\w${YELLOW}]${TUERKIS}\$(parse_git_branch)${YELLOW}\$ ${DEFAULT}"
#PS1='[\u@\h \w]\$ '

# Setting aliases
alias ls='ls --all --color=auto --group-directories-first'

# Change directly into git
function cdgit () {
  cd ~/Dokumente/Github/"$1"
}

function up () {
	for (( i = 0; i < $1; i++ )); do
		cd ..
	done
}

# Adding SSH Keys
ssh-add ~/.ssh/id_github 2> /dev/null

BROWSER=/usr/bin/google-chrome-stable
EDITOR=/usr/bin/subl
