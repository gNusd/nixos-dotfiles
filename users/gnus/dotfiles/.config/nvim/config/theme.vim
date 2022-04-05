
 """"  "    " "    "  """"  Year: 2021
"    " ""   " "    " "
"      " "  " "    "  """"
"  """ "  " " "    "      " https://github.com/gnusd
"    " "   "" "    " "    " http://gnusd.xyz
 """"  "    "  """"   """"  FILE: theme.vim

 " Or if you have Neovim >= 0.1.5
if (has("termguicolors"))
		set termguicolors
endif

set background=dark
syntax enable
colorscheme gruvbox-material

" gruvbox-material
let g:gruvbox_material_background = 'hard'
let g:gruvbox_material_enable_bold = 1
let g:gruvbox_material_disable_italic_comment = 1

"lightline
let g:lightline = { 'colorscheme': 'gruvbox_material' }
let g:lightline = {
						\ 'active': {
						\   'left': [ [ 'mode', 'paste' ],
						\             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
						\ },
						\ 'component_function': {
						\   'gitbranch': 'FugitiveHead'
						\ },
						\ }

let g:lightline.tab_component_function = {
	  \ 'filename': 'lightline#tab#filename',
	  \ 'modified': 'lightline#tab#modified',
	  \ 'readonly': 'lightline#tab#readonly',
	  \ 'tabnum': 'lightline#tab#tabnum' }

let g:startify_session_autoload = 1
let g:startify_change_to_vcs_root = 1
let g:startify_session_persistence = 1
let g:startify_session_dir = '~/.local/git/dotfiles/.config/nvim/sessions'
let g:startify_lists = [
          \ { 'type': 'files',     'header': ['   Files']            },
          \ { 'type': 'dir',       'header': ['   Current Directory '. getcwd()] },
          \ { 'type': 'sessions',  'header': ['   Sessions']       },
          \ ]
