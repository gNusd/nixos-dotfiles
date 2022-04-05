
 """"  "    " "    "  """"  Year: 2021
"    " ""   " "    " "
"      " "  " "    "  """"
"  """ "  " " "    "      " https://github.com/gnusd
"    " "   "" "    " "    " http://gnusd.xyz
 """"  "    "  """"   """"  FILE: completion.vim

set wildmenu				                 " Display all matches when tab complete.
set completeopt=menuone,noinsert,noselect    " Set completeopt to have a better completion experience
set shortmess+=c                             " Avoid showing message extra message when using completion
set complete+=kspell,w,b,u                 	 " Spell checking

" setting up complition in every buffer
" autocmd BufEnter * lua require'completion'.on_attach()

" Use <Tab> and <S-Tab> to navigate through popup menu
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" bind: "<leader>s" desc: "swedish spelling check"
map <leader>s :setlocal spell! spelllang=sv spellfile=~/.config/nvim/spell/sv.utf-8.add<CR>
" bind: "<leader>e" desc: "english spelling check"
map <leader>e :setlocal spell! spelllang=en_us spellfile=~/.config/nvim/spell/en.utf-8.add<CR>

" remap key connected to spell checks
" bind: "<leader>c" desc: "bring up suggestions"
nmap <leader>c z=
" bind: "<leader><shift>n" desc: "previous word"
nmap <leader>N [s
" bind: "<leader>n" desc: "next word"
nmap <leader>n ]s
" bind: "<leader>a" desc: "add word to dictionary"
nmap <leader>a zg
" bind: "<leader>a" desc: "delete word from dictionary"
nmap <leader>d zug

" Using lua functions
" bind: "<leader>ff" desc: "find files"
nnoremap <leader>ff <cmd>lua require('telescope.builtin').find_files()<cr>
" bind: "<leader>fg" desc: "grep in files"
nnoremap <leader>fg <cmd>lua require('telescope.builtin').live_grep()<cr>
" bind: "<leader>fb" desc: "find in buffer"
nnoremap <leader>fb <cmd>lua require('telescope.builtin').buffers()<cr>
" bind: "<leader>fh" desc: "find in help files"
nnoremap <leader>fh <cmd>lua require('telescope.builtin').help_tags()<cr>
