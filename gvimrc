let s:on_windows = has('win32') || has('win64')
let s:on_unix = has('unix')

let s:on_mac = 0
let s:on_linux = 0
if s:on_unix
	let s:uname = system("printf \"$(uname)\"")
	if !v:shell_error
		if s:uname == "Darwin"
			let s:on_mac = 1
		endif
		if s:uname == "Linux"
			let s:on_linux = 1
		endif
	endif
endif


" ---
" Text formatting

" how to load various color schemes
" the called function will run after the CLI color scheme is loaded, so
"  each function just needs to overwrite any values that are different
" an empty function means it doesn’t need to change anything compared to CLI
function! s:LoadGUIColorSchemeWombat()
	colorscheme wombat
	" halve guibg value of MatchParen so MP is easier to tell apart from Cursor
	highlight MatchParen guibg=#423d37
endfunction
function! s:LoadGUIColorSchemeSolarized()
endfunction
function! s:LoadGUIColorSchemeSolarizedLight()
	call s:LoadGUIColorSchemeSolarized()
	" make MatchParen less confusable with Cursor by blending its guibg 50% with Normal guibg
	highlight MatchParen guibg=#c8cbc2
	" add highlighting for Noise highlight group, used in JS and CSS highlighters
	" highlight as base00, one step less contrasty than text
	highlight Noise guifg=#839496
endfunction
function! s:LoadGUIColorSchemeSolarizedDark()
	call s:LoadGUIColorSchemeSolarized()
	" make MatchParen less confusable with Cursor by blending its guibg 50% with Normal guibg
	highlight MatchParen guibg=#2c4c55
	" add highlighting for Noise highlight group, used in JS and CSS highlighters
	" highlight as base00, one step less contrasty than text
	highlight Noise guifg=#657b83
endfunction
"call s:LoadGUIColorSchemeWombat()
call s:LoadGUIColorSchemeSolarizedLight()

if s:on_windows
	set guifont=Consolas:h11:cANSI
	" looks good in GVim on Windows 7
	" why do I have cANSI instead of cDEFAULT again?
	" below font has more Unicode characters on Windows, but uglier otherwise
	"set guifont=DejaVu_Sans_Mono:h10
elseif s:on_linux
	" looks good in GVim on Ubuntu 17.10:
	set guifont=Consolas\ 12
	" looks good in GVim on Ubuntu 17.04:
	"set guifont=Consolas\ 13
else
	set guifont=Consolas:h16
	" looks good in MacVim on Mac OS X
endif
" TODO using commas, add fallback fonts, such as Ubuntu Mono and Monaco


" ---
" GUI controls

if !s:on_mac
	" hide toolbar
	set guioptions-=T
else
	" not hiding MacVim toolbar yet; investigating substitute for its session-related
	" buttons first
	" see `:help Session`
endif

" on Linux, don’t show a tilted arrow mouse cursor in Visual mode
set mouseshape-=v:rightup-arrow
set mouseshape+=v:arrow


" ---
" keyboard shortcuts (mappings)

if s:on_windows || s:on_linux
	" Ctrl-V to paste in Insert, Command-line, Select modes
	" TODO move this one shortcut into .vimrc – they are still useful in the console
	noremap! <C-v> <C-r><C-o>+
	snoremap <C-v> <C-g>"+p
	
	" save with file browsing dialog - for new files
	" TODO don't use dialog if the file already exists
	nmap <C-s> :browse confirm save<CR>
endif

" I don't write equivalent mappings for MacVim here
"  because it already provides them by default
