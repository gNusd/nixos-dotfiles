
# Enable colors and change prompt:
# autoload -U colors && colors

# PS1="%B%{$fg[green]%}%n%{$fg[blue]%}@%{$fg[green]%}%M %{$fg[blue]%}%~%{$reset_color%} $%b

# Load scripts, aliases and shortcuts if existent.
DOTFILES="$HOME/.config/repos/dotfiles/users/gnus/dotfiles"
[ -f "$DOTFILES/.config/zsh/promt.zsh" ] && source "$DOTFILES/.config/zsh/promt.zsh"
[ -f "$DOTFILES/.config/zsh/complete.zsh" ] && source "$DOTFILES/.config/zsh/complete.zsh"
[ -f "$DOTFILES/.config/zsh/vi-mode.zsh" ] && source "$DOTFILES/.config/zsh/vi-mode.zsh"
[ -f "$DOTFILES/.config/zsh/keybindings.zsh" ] && source "$DOTFILES/.config/zsh/keybindings.zsh"
[ -f "$DOTFILES/.config/zsh/alias.zsh" ] && source "$DOTFILES/.config/zsh/alias.zsh"
[ -f "$DOTFILES/.config/zsh/exports.zsh" ] && source "$DOTFILES/.config/zsh/exports.zsh"
[ -f "$DOTFILES/.config/zsh/fzf.zsh" ] && source "$DOTFILES/.config/zsh/fzf.zsh"
[ -f "$DOTFILES/.ssh/alias.ssh" ] && source "$DOTFILES/.ssh/alias.ssh"

# After each command, append to the history file and reread it
PROMPT_COMMAND="${PROMPT_COMMAND:+$PROMPT_COMMAND; history -a; history -c; history -r}"


# History in cache directory:
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=$HOME/.zsh_history

# Basic auto/tab complete:
autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
_comp_options+=(globdots)		# Include hidden files.

# vi mode
bindkey -v

# Use vim keys in tab complete menu:
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -v '^?' backward-delete-char

# Change cursor shape for different vi modes.
function zle-keymap-select {
		if [[ ${KEYMAP} == vicmd ]] ||
				[[ $1 = 'block' ]]; then
						echo -ne '\e[1 q'
				elif [[ ${KEYMAP} == main ]] ||
						[[ ${KEYMAP} == viins ]] ||
						[[ ${KEYMAP} = '' ]] ||
						[[ $1 = 'beam' ]]; then
										echo -ne '\e[5 q'
		fi
}
zle -N zle-keymap-select
zle-line-init() {
zle -K viins # initiate `vi insert` as keymap (can be removed if `bindkey -V` has been set elsewhere)
echo -ne "\e[5 q"
}
zle -N zle-line-init
echo -ne '\e[5 q' # Use beam shape cursor on startup.
preexec() { echo -ne '\e[5 q' ;} # Use beam shape cursor for each new prompt.

# Use lf to switch directories and bind it to ctrl-o
# lfcd () { tmp="$(mktemp)"
#     lf -last-dir-path="$tmp" "$@"
#     if [ -f "$tmp" ]; then
#         dir="$(cat "$tmp")"
#         rm -f "$tmp"
#         [ -d "$dir" ] && [ "$dir" != "$(pwd)" ] && cd "$dir"
#     fi
# }
# bindkey -s '^o' 'lfcd\n'

# Edit line in vim with ctrl-e:
autoload edit-command-line; zle -N edit-command-line
# bind: "<ctrl>e" desc: "edit line from terminal in vim buffer"
bindkey '^e' edit-command-line

setopt LIST_PACKED             # make completion lists more densely packed
setopt MENU_COMPLETE           # auto-insert first possible ambiguous completion
setopt AUTO_PARAM_SLASH        # tab completing directory appends a slash

# Load zsh-syntax-highlighting; should be last.
[ -f "/usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" ] && source "/usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" 2>/dev/null
