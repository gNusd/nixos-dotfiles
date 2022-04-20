#!/bin/bash

REPO="$HOME/.config/repos/"
RC_PATH="$REPO/users/gnus/dotfiles"

alias :q='exit'
alias reload='source $HOME/.bashrc'
alias vim="nvim"
alias vi="nvim"
alias xnvimswap='rm $HOME/.local/share/nvim/swap/*.swp'

alias dotfiles='cd $REPO/local/dotfiles && ls -la'
alias config='cd $HOME/.config'
alias repos='cd $REPO'
alias bin='cd $HOME/bin'

alias vimrc='$EDITOR $RC_PATH/.config/nvim/init.vim'
alias tmuxrc='$EDITOR $RC_PATH/.tmux.conf'
alias bashrc='$EDITOR $RC_PATH/.bashrc'
alias bashalias='$EDITOR $RC_PATH/.bash_aliases'

alias ..="cd .."
alias ...="cd ../.."
