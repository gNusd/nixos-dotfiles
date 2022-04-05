# bind: "q" desc: "to exit in terminal"
alias :q='exit'
# bind: "reload" desc: "to reload zshrc"
alias reload='source $HOME/.zshrc'
# bind: "x" desc: "alternativ to <ctrl>l when running tmux"
alias x='clear'
# bind: "xnvimswap" desc: "remove the swapfile in neovim"
alias xnvimswap='rm $HOME/.local/share/nvim/swap/*.swp'
# bind: "sysup" desc: "update the system"
alias sysup='sudo apt update && sudo apt dist-upgrade && sudo flatpak update && sudo fwupdmgr update && rustup update'
# bind: "fwup" desc: "update only the firmware"
alias fwup='sudo fwupdmgr update'
# bind: "flatup" desc: "update only flatpak packages"
alias flatup='sudo flatpak update'
# bind: "vim" desc: "starts nvim"
alias vim='nvim'
# bind: "sudo vim" desc: "starts sudo nvim"
alias suvim='sudo -e '
# bind: "" desc: ""
alias sudo='sudo '
# bind: "pyserv" desc: "create a simple python server"
alias pyserv="python3 -m http.server 8000 --bind 192.168.2.120"
# bind: "nb" desc: "start newsboat & reload feeds"
alias nb="newsboat -r"
alias mpv="flatpak run io.mpv.Mpv"

# alias for navigation
alias ..="cd .."
alias ...="cd ../.."

# alias to directories
# bind: "remote" desc: "cd to remote git folder"
alias remote='cd $HOME/.local/git/remote && exa -la --git'
# bind: "dotfiles" desc: "cd to dotfiles folder"
alias dotfiles='cd $HOME/.local/git/local/dotfiles && exa -la --git'
# bind: "nvimrc" desc: "cd to nvim's config folder"
alias nvimrc='cd $HOME/.local/git/local/dotfiles/.config/nvim/config && exa -la --git'
# bind: "scripts" desc: "cd to scripts files folder"
alias scripts='cd $HOME/.local/git/local/scripts && exa -la --git'
# bind: "config" desc: "cd to .config folder"
alias config='cd $HOME/.config'
# bind: "bin" desc: "cd to $HOME/bin folder"
alias bin='cd $HOME/.local/bin'
# bind: "repos" desc: "cd to .local/git/repositories folder"
alias repos='cd $HOME/.local/git/remote'
# bind: "code" desc: "cd to .local/git/local/code folder"
alias code='cd $HOME/.local/git/local/code'
# bind: "lbin" desc: "cd to /usr/local/bin folder"
alias lbin='cd /usr/local/bin'
# bind: "py" desc: "cd to project folder - python"
alias py='cd $HOME/.local/git/code/python'
# bind: "rs" desc: "cd to project folder - rust"
alias rs='cd $HOME/.local/git/code/rust'
# bind: "ja" desc: "cd to project folder - java"
alias ja='cd $HOME/.local/git/code/java'
# bind: "next" desc: "cd to nextcloud folder"
alias next='cd $HOME/nextcloud'
# bind: "doc" desc: "cd to documents folder"
alias doc='cd $HOME/nextcloud/dokument'
# bind: "notes" desc: "cd to notes folder"
alias notes='cd $HOME/nextcloud/notes'
# bind: "dl" desc: "cd to download folder"
alias dl='cd $HOME/downloads'
# bind: "iso" desc: "cd to iso folder"
alias iso='cd $HOME/iso'
# bind: "gnus" desc: "cd to gnus.xyz folder"
alias gnus='cd $HOME/hugo/gnusd.xyz'
# bind: "stella" desc: "cd to stella.work folder"
alias stella='cd $HOME/hugo/stella.work'

# alias to files
# bind: "vimrc" desc: "open and edit neovim's config file init.vim"
alias vimrc='$EDITOR $HOME/.local/git/local/dotfiles/.config/nvim/init.vim'
# bind: "trirc" desc: "open and edit tridactyls config file tridactylrc"
alias trirc='$EDITOR $HOME/.local/git/local/dotfiles/.config/tridactyl/tridactylrc'
# bind: "tmuxrc" desc: "open and edit tmux's config file tmux.conf"
alias tmuxrc='$EDITOR $HOME/.local/git/local/dotfiles/.tmux.conf'
# bind: "zshrc" desc: "open and edit zsh's config file .zshrc"
alias zshrc='$EDITOR $HOME/.local/git/local/dotfiles/.zshrc'
# bind: "zshalias" desc: "open and edit alias.zsh"
alias zshalias='$EDITOR $HOME/.local/git/local/dotfiles/.config/zsh/alias.zsh'
# bind: "zshkey" desc: "open and edit keybindings.zsh"
alias zshkey='$EDITOR $HOME/.local/git/local/dotfiles/.config/zsh/keybindings.zsh'
# bind: "inputrc" desc: "open and edit .inputrc"
alias inputrc='$EDITOR $HOME/.local/git/local/dotfiles/.inputrc'
# bind: "alacr" desc: "open and edit alacritty's config file alacritty.yml"
alias alacr='$EDITOR $HOME/.local/git/local/dotfiles/.config/alacritty/alacritty.yml'
# bind: "shop" desc: "open and edit the shopping list"
alias shop='$EDITOR $HOME/nextcloud/dokument/inköpslistor/Shopping+List.lst'
# bind: "SSH" desc: "open and edit the ssh alias file"
alias sshalias='$EDITOR $HOME/.local/git/local/dotfiles/.ssh/alias.ssh'
# bind: "usch" desc: "open and edit the userChrome.css script"
alias usch='$EDITOR $HOME/.local/git/local/dotfiles/.mozilla/firefox/current/chrome/userChrome.css'
# bind: "urls" desc: "exit newsboats urls file"
alias urls='$EDITOR $HOME/.local/git/local/dotfiles/.newsboat/urls'
# bind: "svtplay" desc: "open and edit the download list for svtplay"
alias svtplay='$EDITOR /run/user/1000/kio-fuse-hrhzPP/sftp/gnus@192.168.1.18:22/mnt/bob/downloads/svtplay/files/urls'


# alias to add to applications
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
# bind: "ls" desc: "show content of directory with exa"
alias ls='exa --icons'
# bind: "ll" desc: "show content of directory in long format with exa"
alias ll='exa -l --icons --color-scale --git'
# bind: "la" desc: "show all (including dotfiles) content of directory with git marking in exa"
alias la='exa -la --icons --git'
# bind: "la" desc: "list all files with git marking in exa"
alias l='exa -F --git'
# bind: "tree" desc: "tree view in exa"
alias tree='exa -T --icons --git'
