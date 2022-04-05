call rpcnotify(1, 'Gui', 'Font', "JetBrainsMono Nerd Font Mono 11")
call rpcnotify(1, 'Gui', 'Option', 'Cmdline', 0)
call rpcnotify(1, 'Gui', 'Option', 'Tabline', 0)

" To check if neovim-qt is running, use `exists('g:GuiLoaded')`,
" see https://github.com/equalsraf/neovim-qt/issues/219
if exists('g:GuiLoaded')
    call GuiWindowMaximized(1)
	GuiTreeviewShow
	nmap <silent> <F2> :GuiTreeviewToogle<CR>
    GuiTabline 0
    GuiPopupmenu 0
    GuiLinespace 2
	GuiFont! JetBrainsMono\ Nerd\ Font\ Mono\ h:11
endif
" Render programming font ligatures if available
if exists(':GuiRenderLigatures')
	GuiRenderLigatures 1
	GuiFont! JetBrainsMono\ Nerd\ Font\ Mono\ h:11
endif
