" Much of this was customized by me, Rory O’Kane, but some was copied from
"  sources like these:
"
" http://vim.wikia.com/wiki/Example_vimrc
" https://github.com/gmarik/vundle
" https://github.com/smt/dotvim/
" http://stevelosh.com/blog/2010/09/coming-home-to-vim/
" http://sheerun.net/2014/03/21/how-to-boost-your-vim-productivity/

"------------------------------------------------------------
" Features
"
" These options and commands enable some very useful features in Vim, that
" no user should have to live without.

" Set 'nocompatible' to ward off unexpected things that your distro might
" have made, as well as sanely reset options when re-sourcing .vimrc
set nocompatible


" Enable syntax highlighting
syntax on

set synmaxcol=2048      " Syntax coloring too-long lines is slow

set encoding=utf-8


" prevent errors when the non-sh-compatible fish shell is the default
let s:on_unix = has('unix')
if s:on_unix
	set shell=/bin/sh
endif


"------------------------------------------------------------
" Vundle plugins

filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
Plugin 'gmarik/vundle'

" TODO review installed plugins and delete ones I don't use
"  to improve startup time

" my plugins:
Plugin 'flazz/vim-colorschemes'
Plugin 'altercation/vim-colors-solarized'
Plugin 'ScrollColors'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'tpope/vim-repeat'
Plugin 'bling/vim-airline'
" TODO change vim-polyglot to use my old Markdown library, which was better
"  (in more visible syntax highlighting of elements like headers and code)
"  (in correctly recognizing the .md extension)
Plugin 'sheerun/vim-polyglot'
Plugin 'michaeljsmith/vim-indent-object'
Plugin 'jQuery'
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'tomtom/tlib_vim'
Plugin 'honza/vim-snippets'
Plugin 'garbas/vim-snipmate'
Plugin 'scrooloose/nerdcommenter'
Plugin 'scrooloose/nerdtree'
Plugin 'airblade/vim-rooter'
" Syntastic below is not recommended for Windows;
" disable if it pops up too many cmd windows
Plugin 'scrooloose/syntastic'
Plugin 'tpope/vim-unimpaired'
Plugin 'godlygeek/tabular'
Plugin 'majutsushi/tagbar'
Plugin 'tpope/vim-surround'
Plugin 'tristen/vim-sparkup'
Plugin 'ervandew/supertab'
Plugin 'sjl/gundo.vim'
Plugin 'greplace.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'int3/vim-extradite'
Plugin 'tpope/vim-endwise'
Plugin 'bufkill.vim'
Plugin 'bufexplorer.zip'
Plugin 'tpope/vim-abolish'
" disabling YankRing until I fix it overriding my Y mapping
"Plugin 'YankRing.vim'
" delimitMate is an untried alternative to the below AutoClose--Alves
Plugin 'AutoClose--Alves'
" I can't get swapit to work; try some more
Plugin 'mjbrownie/swapit'
Plugin 'tpope/vim-speeddating'
Plugin 'sukima/xmledit'
Plugin 'leafo/moonscript-vim'
" DetectIndent is my own fork, with more features than the abandoned original
"  and a few improvements from the fork it’s based on
Plugin 'roryokane/detectindent'
Plugin 'mileszs/ack.vim'
Plugin 'tpope/vim-scriptease'
Plugin 'AndrewRadev/splitjoin.vim'
Plugin 'jrozner/vim-antlr'
Plugin 'kien/rainbow_parentheses.vim'
Plugin 'guns/vim-sexp'
Plugin 'tpope/vim-sexp-mappings-for-regular-people'
Plugin 'guns/vim-clojure-static'
Plugin 'tpope/vim-leiningen'
Plugin 'tpope/vim-fireplace'
Plugin 'dahu/bisectly'

" Attempt to determine the type of a file based on its name and possibly its
" contents.  Use this to allow intelligent auto-indenting for each filetype,
" and for plugins that are filetype specific.
filetype plugin indent on


"------------------------------------------------------------
" Plugin settings

let g:yankring_history_dir = '$HOME/.vim'

let g:airline_left_sep=''
let g:airline_right_sep=''
" don’t warn about trailing whitespace, because I like to indent even
"  blank lines, but Vim sees that indentation as trailing whitespace
let g:airline#extensions#whitespace#checks = [ 'indent' ]


"------------------------------------------------------------
" Must have options
"
" These are highly recommended options.

" One of the most important options to activate. Allows you to switch from an
" unsaved buffer without saving it first. Also allows you to keep an undo
" history for multiple files. Vim will complain if you try to quit without
" saving, and swap files will keep you safe if your computer crashes.
set hidden

" Note that not everyone likes working this way (with the hidden option).
" Alternatives include using tabs or split windows instead of re-using the same
" window for multiple buffers, and/or:
" set confirm
" set autowriteall

" Better command-line completion
set wildmenu

" Show partial commands in the last line of the screen
set showcmd

" Do not highlight searches by default
" (the vim-unimpaired plugin provides `coh` to toggle this when needed)
" (my <Leader><Space> mapping below also temporarily turns off highlighting)
set nohlsearch

" Modelines have historically been a source of security vulnerabilities.  As
" such, it may be a good idea to disable them and use the securemodelines
" script, <http://www.vim.org/scripts/script.php?script_id=1876>.
" set nomodeline


"------------------------------------------------------------
" Backups

" don't keep swp files
set noswapfile


"------------------------------------------------------------
" Usability options
"
" These are options that users frequently set in their .vimrc. Some of them
" change Vim's behaviour in ways which deviate from the true Vi way, but
" which are considered to add usability. Which, if any, of these options to
" use is very much a personal preference, but they are harmless.

" Use case insensitive search, except when using capital letters
set ignorecase
set smartcase

" Replace all matches on the line, not just the first,
"  by default, without requiring …/g
set gdefault

" Incremental search
set incsearch

" Set the search scan to wrap around the file
set wrapscan

" Allow backspacing over autoindent, line breaks and start of insert action
set backspace=indent,eol,start

" When opening a new line and no filetype-specific indenting is enabled, keep
" the same indent as the line you're currently on. Useful for READMEs, etc.
set autoindent

" Stop certain movements from always going to the first character of a line.
" While this behaviour deviates from that of Vi, it does what most users
" coming from other editors would expect.
set nostartofline

" Display the cursor position on the last line of the screen or in the status
" line of a window
set ruler

" Always display the status line, even if only one window is displayed
set laststatus=2

" Instead of failing a command because of unsaved changes, instead raise a
" dialogue asking if you wish to save changed files.
set confirm

" Use visual bell instead of beeping when doing something wrong
set visualbell

" And reset the terminal code for the visual bell.  If visualbell is set, and
" this line is also included, vim will neither flash nor beep.  If visualbell
" is unset, this does nothing.
set t_vb=

" Enable use of the mouse for all modes
set mouse=a

" Set the command window height to 2 lines, to avoid many cases of having to
" 'press <Enter> to continue'
" set cmdheight=2

" Quickly time out on keycodes, but never time out on mappings
set notimeout ttimeout ttimeoutlen=200

" Use <F11> to toggle between 'paste' and 'nopaste'
set pastetoggle=<F11>

color wombat256
set background=dark

" wrap, but only in the display, not in the file
set wrap
set linebreak
set nolist
set textwidth=0
set wrapmargin=0
" indent wrapped lines
set showbreak=↪\  " comment is here to make the whitespace not be trailing
if exists("+breakindent")
	set breakindent
	" the default breakindentopt settings are good
	
	" an alternative group of settings to try out when I work with
	"  a file with lots of wrapping:
	"set showbreak=
	"set breakindentopt=shift:1
endif

" enable matchit to have % jump between keywords such as Ruby's do and end
runtime macros/matchit.vim

" automatically create folds based on syntax
set foldmethod=syntax
set foldlevelstart=99
" enable folding for XML, where it's disabled by default
" I temporarily disable this when I have to edit large XML files
let g:xml_syntax_folding = 1

" scroll to show always show some lines and columns around the cursor
set scrolloff=3
set sidescroll=1
set sidescrolloff=15

" reload files changed on disk when Vim regains focus,
"  unless there are local changes
" if this isn't working for you, perhaps only outside of the GUI,
"  see these pages:
" http://stackoverflow.com/questions/2490227/how-does-vims-autoread-work
" https://groups.google.com/forum/?fromgroups=#!topic/vim_dev/uqQuSfvuTrc
set autoread

" use prettier characters to represent whitespace and long lines in list mode
" possible eol characters if I wanted one: ↩, ↲, ⬎, or ⤸
set listchars=eol:$,tab:▸\ ,trail:·,extends:…,precedes:…,conceal:…,nbsp:·

" remove comment markers when joining lines
try
	set formatoptions+=j
catch /^Vim\%((\a\+)\)\=:E539/ " the j option was added in Vim 7.4
endtry

" don’t display the intro message on starting Vim
set shortmess+=I

" open new split panes to right and bottom
set splitbelow
set splitright


"------------------------------------------------------------
" Indentation options
"
" Indentation settings according to personal preference.

" Use hard tabs for indent
set noexpandtab

" Display tabs as four characters wide
try
	set shiftwidth=0 " make 'sw' use the value of 'tabstop'
catch /^Vim\%((\a\+)\)\=:E487/ " before Vim 7.4, Vim did not support the value 0
	set shiftwidth=4
endtry
try
	set softtabstop=-1 " make 'sts' use the value of 'sw'
catch /^Vim\%((\a\+)\)\=:E487/ " before Vim 7.4, Vim did not support the value -1
	" I usually won’t need this because expandtab will be off, but setting
	"  this makes changing expandtab simpler
	set softtabstop=4
endtry
set tabstop=4

" Settings for the DetectIndent plugin
let g:detectindent_preferred_indent = 4
" I do not set g:detectindent_preferred_expandtab ;
"  this indicates that I prefer noexpandtab

" Note that indentation is customized per-language in the Autocommands section.


"------------------------------------------------------------
" Mappings

let mapleader=" "
let g:mapleader=" "
noremap <Space> <Nop>
sunmap <Space>

" Map Y to act like D and C, i.e. to yank until EOL, rather than act as yy,
" which is the default
" this is currently being overwritten by yrrecord in YankRing; TODO fix
noremap Y y$
sunmap Y

" Mapping to turn off search highlighting and clear any message displayed
nnoremap <silent> <Leader><Space> :nohl<Bar>:echo<CR>

" on wrapped lines, move up and down visually, not logically
nnoremap j gj
nnoremap k gk
xnoremap j gj
xnoremap k gk
nnoremap <Down> gj
nnoremap <Up> gk
vnoremap <Down> gj
vnoremap <Up> gk

" swap some mappings for moving to line boundaries and marks
"  so the more-useful commands have easier-to-hit key combos
" mappings afterwards:
"  hard-begin soft-begin end: ^ 0 `
"  jump-mark jump-mark-and-column: $ '
noremap 0 ^
noremap $ '
noremap ` $
noremap ' `
noremap ^ 0
noremap g0 g^
noremap g$ g'
noremap g` g$
noremap g' g`
noremap g^ g0
" undo all those mappings in Select mode
sunmap 0
sunmap $
sunmap `
sunmap '
sunmap ^
sunmap g0
sunmap g$
sunmap g`
sunmap g'
sunmap g^
" stop selecting the newline in Visual mode
xnoremap ` $h

" keep indentation if I press Esc right after o or O
" TODO make these mappings call a function that either does this or acts
"  normally depending on a global or buffer-local variable
"  like l:new_line_keep_indent and g:…
" and make DetectIndent set that setting appropriately, by having it be a hook
"  for the other plugin or vice versa
" I would want to set this on be default, but have it turned off if
" DetectIndent finds lots of empty blank lines
nnoremap o ox<BS>
nnoremap O Ox<BS>
" also keep indentation if I press Esc right after a newline in Insert mode
inoremap <Esc> x<BS><Esc>

" when indenting with < and >, make it easy to repeat
xnoremap < <gv
xnoremap > >gv

" run recorded macros easily
" use qq to record
" if you want Ex mode, run :normal! Q
nnoremap Q @q

" Disable regexes in search by default. When editing a search pattern,
" change V to v to enable standard (not Vim-flavored) regexes.
" see :help \V
nnoremap / /\V
xnoremap / /\V
nnoremap ? ?\V
xnoremap ? ?\V

" move to end of pasted text, to ease multiple pastes
xnoremap y y`]
xnoremap p p`]
nnoremap p p`]

" quickly select text you just pasted
" Overwrites a function only used in mappings.
"  Mappings only need to use normal! to be safe.
noremap gV `[v`]
sunmap gV

" TODO make { and } work with indented blank lines (see OO files in Notes)
" (already done; but see if I had better ideas in my OO files than what I've written)
" FIXME this should skip past consecutive blank lines when called when you're
"  already on a blank line
" FIXME this overwrites the current search and doesn't restore it
nnoremap } /\v^\s*$<CR>:nohl<Bar>:echo<CR>
nnoremap { ?\v^\s*$<CR>:nohl<Bar>:echo<CR>
xnoremap } /\v^\s*$<CR>
xnoremap { ?\v^\s*$<CR>
onoremap } /\v^\s*$<CR>:nohl<Bar>:echo<CR>
onoremap { ?\v^\s*$<CR>:nohl<Bar>:echo<CR>

" substitute
nnoremap <Leader>s :%s/\V/<left>
" in visual mode, the range '<,'> is typed automatically
xnoremap <Leader>s :s/\V/<left>

" view recently opened files
" I would type 'q' afterwards in the mapping, but that has no effect for some reason
nnoremap <Leader>bo :browse oldfiles<CR>

" toggle NERDTree easily
nnoremap <Leader>n :NERDTreeToggle<CR>

" open BufExplorer easily
nnoremap <Leader>b :BufExplorer<CR>

" CDC = Change to Directory of Current file
" CDCP = Change to Directory of Current file's Parent
" via http://vim.wikia.com/wiki/Set_working_directory_to_the_current_file
" TODO once saw this command fail when current directory was on a different
"  drive (Z instead of C). This command's fault? Can I fix it?
command! CDC  cd %:p:h
command! CDCP  cd %:p:h/..
command! CDCPP  cd %:p:h/../..

" Help command to open help in a new tab
" help-argument-taking syntax taken from http://stackoverflow.com/a/14601793/578288
" remember also that :vertical help opens help in a vertical split pane
command! -nargs=* -complete=help Help  tab help <args>

" reload vimrc, and gvimrc too if applicable, without restarting Vim
" this does not clear previous settings; it assumes *vimrc files are idempotent
function! s:ReloadVimConfig()
	source $MYVIMRC
	if has('gui_running')
		source $MYGVIMRC
	endif
endfunction
command! ReloadVimConfig  call <SID>ReloadVimConfig()

" search for trailing whitespace and confirm its deletion
" based on https://github.com/bronson/vim-trailing-whitespace
"  and http://vim.wikia.com/wiki/Highlight_unwanted_spaces#Highlighting_with_a_search
"  and http://vim.wikia.com/wiki/Remove_unwanted_spaces
function! s:TrailingWhitespaceDelete(line1,line2)
	let l:saved_cursor = getpos(".")
	let l:saved_hlsearch = &hlsearch
	let l:saved_list = &list
	set hlsearch
	set list
	silent! execute ':' . a:line1 . ',' . a:line2 . 's/\(\S\+\)\@<=\s\+$//c'
	call setpos('.', l:saved_cursor)
	let &hlsearch = l:saved_hlsearch
	let &list = l:saved_list
endfunction
command! -range=% TrailingWhitespaceDelete  call <SID>TrailingWhitespaceDelete(<line1>,<line2>)

" commands to edit the clipboard in a buffer
" useful for Vim for Windows, which doesn't have the Command key for Cmd-A and Cmd-V
" Load From Clipboard into buffer
command! Lfc  normal! ggVG"*pgg0
" Save buffer To Clipboard - copy buffer into clipboard, preserving cursor position
command! Stc  normal! VggoG"*y<C-O>


"------------------------------------------------------------
" Mappings that rely on other mappings
" Mappings that don’t use noremap should be placed here, near the end, so they
"  are not overwritten by noremap mappings.

" prevent v_p from swapping the paste buffer
" this makes it easier to rename a variable by pasting its new name
"  over all instances
" function from http://sheerun.net/2014/03/21/how-to-boost-your-vim-productivity/
function! RestoreRegister()
	let @" = s:restore_reg
	return ''
endfunction
function! s:Repl()
	let s:restore_reg = @"
	return "p@=RestoreRegister()\<cr>"
endfunction
xmap <silent> <expr> p <sid>Repl()

" easy variable rename (imperfect but useful)
" inspiration from http://stackoverflow.com/a/597932/578288
" uses indentation for block, not {}, which only works in C-like languages, or
"  b (`vib`), which doesn’t work at all with Ruby do…end blocks
" note: `vii` depends on plugin michaeljsmith/vim-indent-object, so not using nnoremap
" use 'r to get back to variable position afterwards (given my ' mapping)
" TODO stop it highlighting search results outside of the selected area
" TODO automatically return to mark r after :s completes
" TODO provide smarter scoping, or a variation or option for whole-file scope
" TODO map <Leader>rf for whole-file, <Leader>rl for local
" I don’t use `gd` in this because it’s inaccurate;
"  it finds similarly-named different symbols
" I could add another `ii` to select the next-outer indent
" I could define a set of macros, run them with @a, do something manual, @b for rest
nmap <Leader>r "ryiwmr:%s/\<<C-R>r\>//c<left><left><C-R>r
xmap <Leader>r   "rymr:%s/<C-R>r//c<left><left><C-R>r
"nmap <Leader>r "ryiwmrvii:s/\<<C-R>r\>//c<left><left><C-R>r
"xmap <Leader>r   "rymrvii:s/\<<C-R>r\>//c<left><left><C-R>r

" Remap <f1> to <esc> in every mode to accommodate fat-fingering
nmap <f1> <esc>
vmap <f1> <esc>
omap <f1> <esc>
imap <f1> <esc>
lmap <f1> <esc>
cmap <f1> <esc>


"------------------------------------------------------------
" Autocommands

" TODO look up good autocommand templates so I know I'm writing them
"  correctly, safely, and efficiently

" when loading a given file into a buffer for the first time, run `cd .`
"  so that its file path in the status line becomes relative to the
"  working directory
augroup make_file_path_in_status_line_relative
	autocmd BufReadPost *  cd .
augroup END

" detect indentation when opening a new file
augroup detect_indentation_automatically
	autocmd BufReadPost *  DetectIndent
augroup END

" TODO reload NERDTree’s file tree when switching focus back into Vim
" what I want: if NERDTree exists: switch to its window, hit R, then switch back to original window
" R’s “map option” is “NERDTreeMapRefreshRoot”, but I don’t know if I can use that
"autocmd FocusGained *  CustomFunctionToRefreshRoot

" file extensions that neither Vim nor vim-polyglot recognize correctly
augroup filetypes_for_file_extensions
	autocmd!
	autocmd BufNewFile,BufRead *.sscm  setfiletype scheme
	autocmd BufNewFile,BufRead *.wisp  setfiletype lisp
	autocmd BufNewFile,BufRead *.jisp  setfiletype lisp
	" don’t interpret .dat as CSV; it often isn’t
	autocmd BufNewFile,BufRead *.dat  setfiletype text
	" .md is always Markdown, never modula2 for the files I read
	autocmd BufNewFile,BufRead *.md  setfiletype markdown
	" fish shell is not supported; zsh is the closest but
	"  has irrelevant syntax checking; pretend it’s sh
	autocmd BufNewFile,BufRead *.fish  setfiletype sh
augroup END

" language indent settings: indent size and tab vs. space
augroup indent_settings_for_filetypes
	autocmd!
	autocmd FileType ruby  set tabstop=2 | set shiftwidth=2
	autocmd FileType coffee  set tabstop=2 | set shiftwidth=2
	autocmd FileType yaml  set expandtab
	" use spaces in Common Lisp and Clojure, but not in Scheme, where I sometimes use sweet-expressions
	autocmd FileType lisp  set expandtab
	autocmd FileType clojure  set expandtab
	" ANTLR grammars normally use indents for alignment, so should use spaces
	autocmd FileType antlr3  set expandtab
	autocmd FileType antlr4  set expandtab
augroup END

augroup enable_rainbow_parentheses_for_relevant_filetypes
	autocmd!
	autocmd FileType lisp  RainbowParenthesesActivate
	autocmd FileType scheme  RainbowParenthesesActivate
	autocmd FileType clojure  RainbowParenthesesActivate
	autocmd FileType clojure  RainbowParenthesesLoadRound
	autocmd FileType clojure  RainbowParenthesesLoadSquare
	autocmd FileType clojure  RainbowParenthesesLoadBraces
augroup END

" customize word characters
augroup word_characters_for_filetypes
	autocmd!
	autocmd FileType scss  setlocal iskeyword+=-,@-@,$,%
	autocmd FileType css  setlocal iskeyword+=-
	autocmd FileType coffee  setlocal iskeyword+=$
	autocmd FileType lisp  setlocal iskeyword-={,},[,]
augroup END

" TODO let `w` move past straight single quotes (apostrophes) in words,
"  only in plain text files
"autocmd FileType [no-file-type] setlocal iskeyword+='


"------------------------------------------------------------
" Todo list

" TODO fix that autoquoting in Insert mode breaks . repetition
" TODO fix repeat.vim not allowing me to repeat NERDCommenter commands
"  (e.g. ,c<Space>) as I think it’s supposed to

" TODO way to reindent tabs <-> spaces, change number of spaces

" TODO way to toggle between blank lines being empty or indented

" TODO when Vim opens a directory, keep NERDTree open after choosing a file
"  from its listing
" current best workaround is to open the first file in a vsplit with `s`, and
"  then manually resize the split to a smaller size
" another workaround is to :NERDTreeToggle after opening a directory, which
"  opens a persistent NERDTree, and then ignore the default,
"  automatically-opened one
" remember that <Leader>n is currently a shortcut to :NERDTreeToggle

" TODO fix that pasting lines adds an extra blank line to the end

" TODO add mapping to create blank comment from Normal or Insert mode,
"  by default with spaces between delimiters and content
" e.g. write '// ', '//', '/*  */', or '/**/'
" I feel like NERDCommenter should do this, but I don't think it does

" TODO stop ' in plain text mode from writing ''; I use it for apostrophe
" sometimes

" TODO find a good mapping for n_<tab>
" Tab is currently used only by Snipmate, I think in insert mode

" TODO finish adding useful tips from the following articles:
" http://stevelosh.com/blog/2010/09/coming-home-to-vim/
" http://sheerun.net/2014/03/21/how-to-boost-your-vim-productivity/

" TODO add useful customizations from the following vimrcs:
" https://github.com/tpope/vim-sensible
" https://github.com/sheerun/vimrc

" TODO set scrolloff to a higher number when moving to search results
"  with n or N

" TODO try out tcomment (http://vimawesome.com/plugin/tcomment) instead of NERDCommenter
"  for its language-in-language detection, like JS within HTML
"  make sure it works well with linewise and inline comments
"  and see if it is any better with letting you add spacing around comment delimiters

" TODO in an Autocommand function that runs on loading an XML file,
"  `let l:xml_syntax_folding = 1` (locally) only if the XML file is small enough
"  have it turned off by default
"  e.g. 'iTunes Music Library.xml' is too large, IndustrySafe XML files are small enough
"  depending on autocommand run order, I might need to `:e` to
"  reload the file after change the setting
