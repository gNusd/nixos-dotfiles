
 """"  "    " "    "  """"  Year: 2020
"    " ""   " "    " "
"      " "  " "    "  """"
"  """ "  " " "    "      " https://github.com/gnusd
"    " "   "" "    " "    " http://gnusd.xyz
 """"  "    "  """"   """"  FILE: alias.vim

" Config files

" bind: "<leader><shift>v a" desc: "edit alias.vim"
map <leader>Va 	:e $HOME/.local/git/dotfiles/.config/nvim/config/alias.vim <CR>
" bind: "<leader><shift>v p" desc: "edit plug-plugin.vim"
map <leader>Vp 	:e $HOME/.local/git/dotfiles/.config/nvim/config/plug-plugin.vim <CR>
" bind: "<leader><shift>v" desc: "edit init.vim"
map <leader>V 	:e $HOME/.local/git/dotfiles/.config/nvim/init.vim <CR>
" bind: "<leader><shift>t ri" desc: "edit tridactylrc"
map <leader>Tri :e $HOME/.local/git/dotfiles/.config/tridactyl/tridactylrc <CR>
" bind: "<leader><shift>t x" desc: "edit tmux.conf"
map <leader>Tx  :e $HOME/.local/git/dotfiles/.tmux.conf <CR>
" bind: "<leader><shift>z s" desc: "edit .zshrc"
map <leader>Zs  :e $HOME/.local/git/dotfiles/.zshrc <CR>
" bind: "<leader><shift>z a" desc: "edit alias.zsh"
map <leader>Za 	:e $HOME/.local/git/dotfiles/.config/zsh/alias.zsh <CR>
" bind: "<leader><shift>i n" desc: "edit inputrc"
map <leader>In 	:e $HOME/.local/git/dotfiles/.inputrc <CR>
" bind: "<leader><shift>ac" desc: "edit alacritty.yml"
map <leader>AC 	:e $HOME/.local/git/dotfiles/.alacritty.yml <CR>

" Files
" bind: "<leader>shop" desc: "edit Shopping list"
map <leader>shop ":e $HOME/nextcloud/dokument/inköpslistor/Shopping+List.lst <CR>"

" Directories
" bind: "<leader><shift>n" desc: "change directory to notes"
map <leader>N ":cd $HOME/nextcloud/notes/ <CR>"
" bind: "<leader>code" desc: "change directory to code"
map <leader>code ':cd $HOME/.local/git/code/ <CR>'
