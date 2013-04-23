color wombat
" halve guibg value of MatchParen so MP is easier to tell apart from Cursor
highlight MatchParen guibg=#423d37

if has('gui_win32')
	set guifont=Consolas:h11:cANSI
	" looks good in GVim on Windows 7
else
	set guifont=Consolas:h14
	" looks good in MacVim on Mac OS X
endif
