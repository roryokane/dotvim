let s:on_windows = has('win32') || has('win64')
let s:on_unix = has('unix')


" ---
" Text formatting

color wombat
" halve guibg value of MatchParen so MP is easier to tell apart from Cursor
highlight MatchParen guibg=#423d37

if s:on_windows
	set guifont=Consolas:h11:cANSI
	" looks good in GVim on Windows 7
else
	set guifont=Consolas:h14
	" looks good in MacVim on Mac OS X
endif


" ---
" GUI controls

if s:on_windows
	" hide toolbar
	set guioptions-=T
else
	" not hiding MacVim toolbar yet; investigating substitute for its session-related
	" buttons first
endif


" ---
" keyboard shortcuts (mappings)

if s:on_windows
	" paste in Insert mode
	imap <C-v> <C-r><C-o>+
	
	" save with file browsing dialog - for new files
	" TODO don't use dialog if the file already exists
	nmap <C-s> :browse confirm save<CR>
endif

" I don't write equivalent mappings for MacVim here
"  because it already provides them by default
