
 """"  "    " "    "  """"  Year: 2019
"    " ""   " "    " "
"      " "  " "    "  """"
"  """ "  " " "    "      " https://github.com/gnusd
"    " "   "" "    " "    " http://gnusd.xyz
 """"  "    "  """"   """"  FILE: plug-plugins.vim

""""""""""""""""""
" INSTALLING VIM-PLUG
" curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs
" https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
"
""""""""""""""""""

"vim-plug
" bind: "<leader>i" desc: "install plugins with vim-plug"
map <leader>i :PlugInstall<cr>
" bind: "<leader>u" desc: "update plugins with vim-plug"
map <leader>u :PlugUpdate<cr>
" bind: "<leader>uu" desc: "upgrade plugins with vim-plug"
map <leader>uu :PlugUpgrade<cr>

call plug#begin('~/.config/nvim/plugged/')

" LSP & completion
" Plug 'neovim/nvim-lspconfig'
" Plug 'williamboman/nvim-lsp-installer'
" Plug 'RishabhRD/popfix'
" Plug 'RishabhRD/nvim-lsputils'
" Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'
" Plug 'tzachar/cmp-tabnine', { 'do': './install.sh' }

" Treesitter
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}  " We recommend updating the parsers on update

" Telescope
" Plug 'nvim-lua/popup.nvim'
" Plug 'nvim-lua/plenary.nvim'
" Plug 'nvim-telescope/telescope.nvim'

" Terminal & filesystem
Plug 'ryanoasis/vim-devicons'
Plug 'vim-scripts/taglist.vim'
Plug 'vifm/vifm.vim'
Plug 'camspiers/animate.vim'
Plug 'jremmen/vim-ripgrep'
Plug 'Lenovsky/nuake'

" Tmux integration
Plug 'christoomey/vim-tmux-navigator'

" git plugins
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'tveskag/nvim-blame-line'

" Input & text manipulation
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-repeat'
Plug 'godlygeek/tabular'
Plug 'dhruvasagar/vim-table-mode', {'on': 'TableModeToggle '}
Plug 'mbbill/undotree'
Plug 'tmsvg/pear-tree'
Plug 'junegunn/vim-peekaboo'
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'  }
Plug 'vimwiki/vimwiki'

" schemes and themes
Plug 'itchyny/lightline.vim'
Plug 'edkolev/tmuxline.vim'
Plug 'zefei/vim-wintabs'
Plug 'zefei/vim-wintabs-powerline'
Plug 'gruvbox-material/vim', {'as': 'gruvbox-material'}
Plug 'chrisbra/Colorizer'
Plug 'mhinz/vim-startify'
Plug 'cespare/vim-toml'

Plug 'ThePrimeagen/vim-be-good'
" Initialize plugin system
call plug#end()
