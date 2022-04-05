
 """"  "    " "    "  """"  Year: 2021
"    " ""   " "    " "
"      " "  " "    "  """"
"  """ "  " " "    "      " https://github.com/gnusd
"    " "   "" "    " "    " http://gnusd.xyz
 """"  "    "  """"   """"  FILE: git.vim

" gitgutter
let g:gitgutter_enabled = 1

" vim fugitive
" bind: "<leader>g" desc: "git browser"
nmap <leader>g :Git<CR>
" bind: "<leader>gc" desc: "git commit menu"
nmap <leader>gc :Gcommit<CR>
" bind: "<leader>gd" desc: "git diff menu"
nmap <leader>gd :Gdiffsplit<CR>

" git blame line
" bind: "<leader>G" desc: "toggle on and off git blame info on the line cursor is on"
nnoremap <silent> <leader>G :ToggleBlameLine<CR>
