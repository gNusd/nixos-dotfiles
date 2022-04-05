
 """"  "    " "    "  """"  Year: 2021
"    " ""   " "    " "
"      " "  " "    "  """"
"  """ "  " " "    "      " https://github.com/gnusd
"    " "   "" "    " "    " http://gnusd.xyz
 """"  "    "  """"   """"  FILE: term.vim

" bind: "<leader>v" desc: "open file from vifm in vertical split"
noremap <leader>v :VsplitVifm<CR>
" bind: "<leader>h" desc: "open file from vifm"
noremap <leader>, :Edit Vifm .<CR>

au BufEnter * if &buftype == 'terminal' | :startinsert | endif

"netrw
" bind: "<leader>f" desc: "toggle side file browser"
map <leader>f :Lexplore<CR>
let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_browse_split = 4
let g:netrw_altv = 1
let g:netrw_winsize = 20
let g:netrw_list_hide = '\(^\|\s\s\)\zs\.\S\+'
let g:netrw_preview = 0
" Terminal Function
let g:term_buf = 0
let g:term_win = 0

" size of scrollback history
autocmd TermOpen * setlocal scrollback=100000

" Terminal go back to normal mode
tnoremap <Esc> <C-\><C-n>

nnoremap <silent>§ :Nuake<CR>
inoremap <silent>§ <C-\><C-n>:Nuake<CR>
tnoremap <silent>§ <C-\><C-n>:Nuake<CR>

" bind: "<leader>m" desc: "search with ripgrep"
nnoremap <leader>m :Rg<Space>
