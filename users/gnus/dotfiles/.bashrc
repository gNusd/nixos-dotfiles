##/**************************************************************/
#/*                            _               _               */
#/*   __ _ _ __  _   _ ___    | |__   __ _ ___| |__  _ __ ___  */
#/*  / _` | '_ \| | | / __|   | '_ \ / _` / __| '_ \| '__/ __| */
#/* | (_| | | | | |_| \__ \  _| |_) | (_| \__ \ | | | | | (__  */
#/*  \__, |_| |_|\__,_|___/ (_)_.__/ \__,_|___/_| |_|_|  \___| */
#/*  |___/                                                     */
#/**************************************************************/

# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

##
## TMUX auto attach
##
if [ -n "$SSH_CLIENT" ] || [ -n "$SSH_TTY" ]; then      # if this is an SSH session
    if which tmux >/dev/null 2>&1; then                 # check if tmux is installed
            if [[ -z "$TMUX" ]] ;then                   # do not allow "tmux in tmux"
                    ID="$( tmux ls | grep -vm1 attached | cut -d: -f1 )"    # get the id of a deattached session
                    if [[ -z "$ID" ]] ;then                                 # if not available create a new one
                            tmux new-session
                    else
                            tmux attach-session -t "$ID"                    # if available, attach to it
                    fi
            fi
    fi
fi

# color man-pages
export PAGER='bat'

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# After each command, append to the history file and reread it
PROMPT_COMMAND="${PROMPT_COMMAND:+$PROMPT_COMMAND; history -a; history -c; history -r}"

#  check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
force_color_prompt=yes
color_prompt=yes

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

if [ -f $HOME/.config/repos/dotfiles/users/gnus/dotfiles/.bash_aliases ]; then
    . $HOME/.config/repos/dotfiles/users/gnus/dotfiles/.bash_aliases
fi

export EDITOR=nvim
export VISUAL=nvim
export PATH="/$HOME/bin:/run/wrappers/bin:/$HOME/.nix-profile/bin:/etc/profiles/per-user/gnus/bin:/nix/var/nix/profiles/default/bin:/run/current-system/sw/bin:/$HOME/.config/repos/dotfiles/bin:/$HOME/.local/bin:$PATH"
eval "$(starship init bash)"
