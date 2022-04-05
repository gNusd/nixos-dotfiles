
 """"  "    " "    "  """"  Year: 2021
"    " ""   " "    " "
"      " "  " "    "  """"
"  """ "  " " "    "      " https://github.com/gnusd
"    " "   "" "    " "    " http://gnusd.xyz
 """"  "    "  """"   """"  FILE: buffer.vim

" bind: "<ctrl>s" desc: "Swaps splits"
map <silent><c-s> :wincmd r <CR>

" bind: "<leader><up>" desc: "Move split to maximized window"
nnoremap <silent> <leader><up> :call MaximizeToggle()<CR>

function! MaximizeToggle()
		if exists("s:maximize_session")
				exec "source " . s:maximize_session
				call delete(s:maximize_session)
				unlet s:maximize_session
				let &hidden=s:maximize_hidden_save
				unlet s:maximize_hidden_save
		else
				let s:maximize_hidden_save = &hidden
				let s:maximize_session = tempname()
				set hidden
				exec "mksession! " . s:maximize_session
				only
		endif
endfunction

" Closing all but current buffer
function! CloseAllBufferButCurrent()
		:%bd|e#
endfunction

" Buffer handeling
" bind: "<leader><shift>j" desc: "previous buffer/document"
map <leader>J :bprevious <CR>
" bind: "<leader>j" desc: "previous buffer/document without saving"
map <leader>j :bprevious! <CR>
" bind: "<leader><shift>k" desc: "next buffer/document"
map <leader>K :bnext <CR>
" bind: "<leader>k" desc: "next buffer/document without saving"
map <leader>k :bnext! <CR>
" bind: "<leader>w" desc: "close buffer/document"
map <leader>w :bd <CR>
" bind: "<leader><shift>w" desc: "close buffer/document without saving"
map <leader>W :bd! <CR>
" bind: "<leader>q" desc: "close all buffers/documents but the active one"
map <leader>q :call CloseAllBufferButCurrent() <CR>

" animate
" bind: "<ctrl><up>" desc: "move split up"
nnoremap <silent> <C-Up>    :call animate#window_delta_height(10)<CR>
" bind: "<ctrl><down>" desc: "move split down"
nnoremap <silent> <C-Down>  :call animate#window_delta_height(-10)<CR>
" bind: "<ctrl><left>" desc: "move split left"
nnoremap <silent> <C-Left>  :call animate#window_delta_width(10)<CR>
" bind: "<ctrl><right>" desc: "move split right"
nnoremap <silent> <C-Right> :call animate#window_delta_width(-10)<CR>

"Change 2 split windows from vert to horiz or horiz to vert
" bind: "<leader>tv" desc: "Change layout from horizontal to vertical"
map <leader>tv <C-w>t<C-w>H
" bind: "<leader>th" desc: "Change layout from vertical to horizontal"
map <leader>th <C-w>t<C-w>K

