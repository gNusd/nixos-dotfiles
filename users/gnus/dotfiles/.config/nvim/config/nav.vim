
 """"  "    " "    "  """"  Year: 2021
"    " ""   " "    " "
"      " "  " "    "  """"
"  """ "  " " "    "      " https://github.com/gnusd
"    " "   "" "    " "    " http://gnusd.xyz
 """"  "    "  """"   """"  FILE: nav.vim

" block arrow keys
noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>
noremap <PageUp> <Nop>
noremap <PageDown> <Nop>

" mapping Alt + hjkl to left, right, down, up in insert mode
" bind: "<alt>hjkl" desc: "left, right, up and down in insert mode"
inoremap <buffer><a-h> <esc>h i
inoremap <buffer><a-l> <esc>l i
inoremap <buffer><a-j> <esc>j i
inoremap <buffer><a-k> <esc>k i

" remapping window navigation
" bind: "<ctrl>hjkl" desc: "window navigation left, right, up and down in normal mode"
noremap <c-h> <c-w>h
noremap <c-l> <c-w>l
noremap <c-j> <c-w>j
noremap <c-k> <c-w>k

" mapping window navigaton in insert mode
" bind: "<ctrl>hjkl" desc: "window navigation left, right, up and down in insert mode"
inoremap <buffer> <c-h> <esc><c-w>h i
inoremap <buffer> <c-l> <esc><c-w>l i
inoremap <buffer> <c-j> <esc><c-w>j i
inoremap <buffer> <c-k> <esc><c-w>k i
