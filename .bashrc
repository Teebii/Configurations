#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Setting prompt
PROMPT_DIRTRIM=3
PS1='[\[\033[1;38;5;202m\]\u\[\033[0;33m\]@\[\033[1;32m\]\h \[\[\033[0;94m\]\w\[\033[0m\]]\$ '
#PS1='[\u@\h \w]\$ '
# Setting aliases
alias ls='ls --color=auto --group-directories-first'

# Change directly into git
function cdgit () {
  cd ~/Dokumente/Github/"$1"
}

# >>>>BEGIN ADDED BY CNCHI INSTALLER<<<< #
BROWSER=/usr/bin/google-chrome-stable
EDITOR=/usr/bin/subl3
# >>>>>END ADDED BY CNCHI INSTALLER<<<<< #
