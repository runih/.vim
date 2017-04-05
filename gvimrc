set cul
set guioptions-=T
set guioptions-=r
set guioptions-=L
if has('X11')
	colorscheme zellner
endif
if has('gui_macvim')
	colorscheme macvim
	set bg=dark
	set transparency=20
	"set guifont=Menlo:h12
	"set guifontwide=Osaka:h12
	set guifont=Osaka-Mono:h14
	"set guifont=Ricty:h14
	map  gw :macaction selectNextWindow:<CR>
	map  gW :macaction selectPreviousWindow:<CR>
endif
set lines=50 columns=160
