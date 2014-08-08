let s:on_windows = has('win32') || has('win64')
let s:on_unix = has('unix')

" disabled because none of my settings so far care
"  what flavor of Unix they use
"let s:on_mac = 0
"let s:on_linux = 0
"if s:on_unix
"	let s:uname = system("printf \"$(uname)\"")
"	if !v:shell_error
"		if s:uname == "Darwin"
"			let s:on_mac = 1
"		endif
"		if s:uname == "Linux"
"			let s:on_linux = 1
"		endif
"	endif
"endif


" ---
" Text formatting

color wombat
set background=dark
" halve guibg value of MatchParen so MP is easier to tell apart from Cursor
highlight MatchParen guibg=#423d37

if s:on_windows
	set guifont=Consolas:h11:cANSI
	" looks good in GVim on Windows 7
	" why do I have cANSI instead of cDEFAULT again?
	" below font has more Unicode characters on Windows, but uglier otherwise
	"set guifont=DejaVu_Sans_Mono:h10
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
	" see `:help Session`
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
