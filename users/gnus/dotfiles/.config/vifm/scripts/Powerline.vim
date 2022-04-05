" STATUS LINE "
"""""""""""""""

" SEPARATORS "
let L_B=""
let L_T=""
let R_B=""
let R_T=""

" COLORS "
""""""""""

" USER COLORS "
"""""""""""""""
highlight User1      ctermbg=34          ctermfg=232        cterm=none
highlight User2      ctermbg=26          ctermfg=34         cterm=bold
highlight User3      ctermbg=26          ctermfg=15         cterm=bold
highlight User4      ctermbg=23          ctermfg=26         cterm=bold
highlight User5      ctermbg=23          ctermfg=magenta    cterm=none
highlight User6      ctermbg=magenta     ctermfg=23         cterm=bold
highlight User8      ctermbg=magenta     ctermfg=white      cterm=bold
highlight User9      ctermbg=15          ctermfg=232        cterm=bold
highlight User7      ctermbg=15          ctermfg=34         cterm=bold

"""""""""""""""""
"   SEGMENTS    "
"""""""""""""""""

" LEFT SEGMENT "
""""""""""""""""
let $CUR_DIR="%t "               " current dir
let $CUR_FILE_SZ="%E "       " current file size

" SEPARATOR "
"""""""""""""
let $SEPARATOR="%="                 " middle separator

" RIGHT SEGMENT "
"""""""""""""""""
let $PERMS="%A "            " perms
let $USER="%u "                 " user


" GIT SUPPORT "
"""""""""""""""
let $GIT="$(sh ~/repositories/dotfiles/.config/vifm/scripts/GitStatus.sh) "


" SET STATUSLINE "
""""""""""""""""""
execute 'set' 'statusline="' . $CUR_DIR . $CUR_FILE_SZ . $GIT . $SEPARATOR . $PERMS . $USER .'"'



