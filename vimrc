" I, Rory O'Kane, have edited this file, but it is based on the following:
"
" https://github.com/gmarik/vundle
" https://github.com/smt/dotvim/
" http://vim.wikia.com/wiki/Example_vimrc

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


"------------------------------------------------------------
" Vundle plugins

filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
Bundle 'gmarik/vundle'

" my plugins:
Bundle 'flazz/vim-colorschemes'
Bundle 'altercation/vim-colors-solarized'
Bundle 'wincent/Command-T'
Bundle 'ScrollColors'
Bundle 'ap/vim-css-color'
Bundle 'kchmck/vim-coffee-script'
Bundle 'othree/html5.vim'
Bundle 'tpope/vim-haml'
Bundle 'michaeljsmith/vim-indent-object'
Bundle 'jQuery'
Bundle 'pangloss/vim-javascript'
Bundle 'gmarik/vim-markdown'
Bundle 'MarcWeber/vim-addon-mw-utils'
Bundle 'tomtom/tlib_vim'
Bundle 'honza/snipmate-snippets'
Bundle 'garbas/vim-snipmate'
Bundle 'scrooloose/nerdcommenter'
Bundle 'scrooloose/nerdtree'
Bundle 'airblade/vim-rooter'
" Syntastic below is not recommended for Windows;
" disable if it pops up too many cmd windows
Bundle 'scrooloose/syntastic'
Bundle 'timcharper/textile.vim'
Bundle 'tpope/vim-unimpaired'
Bundle 'godlygeek/tabular'
Bundle 'majutsushi/tagbar'
Bundle 'tpope/vim-surround'
Bundle 'kogakure/vim-sparkup'
Bundle 'ervandew/supertab'
Bundle 'sjl/gundo.vim'
Bundle 'greplace.vim'
Bundle 'tpope/vim-fugitive'
Bundle 'int3/vim-extradite'
Bundle 'tpope/vim-endwise'
Bundle 'bufkill.vim'
Bundle 'bufexplorer.zip'
Bundle 'tpope/vim-abolish'
" disabling YankRing until I fix it overriding my Y mapping
"Bundle 'YankRing.vim'
" delimitMate is an untried alternative to the below AutoClose--Alves
Bundle 'AutoClose--Alves'
Bundle 'L9'
Bundle 'FuzzyFinder'
Bundle 'tpope/vim-repeat'
Bundle 'paredit.vim'
" I can't get swapit to work; try some more
Bundle 'mjbrownie/swapit'
Bundle 'tpope/vim-speeddating'
Bundle 'sukima/xmledit'
Bundle 'vbnet.vim'

" Attempt to determine the type of a file based on its name and possibly its
" contents.  Use this to allow intelligent auto-indenting for each filetype,
" and for plugins that are filetype specific.
filetype indent plugin on


"------------------------------------------------------------
" Plugin settings

let g:yankring_history_dir = '$HOME/.vim'


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
" (my <Space> mapping below also temporarily turns off highlighting)
set nohlsearch

" Modelines have historically been a source of security vulnerabilities.  As
" such, it may be a good idea to disable them and use the securemodelines
" script, <http://www.vim.org/scripts/script.php?script_id=1876>.
" set nomodeline


" ----------------------------------------------------------------------------
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

" wrap, but only in the display, not in the file
set wrap
set linebreak
set nolist
set textwidth=0
set wrapmargin=0
" indent wrapped lines
set showbreak=->
" set breakindent " not in main vim; need to compile with a patch

" enable matchit to have % jump between keywords such as Ruby's do and end
runtime macros/matchit.vim

" automatically create folds based on syntax
set foldmethod=syntax
set foldlevelstart=99
" enable folding for XML, where it's disabled by default
let g:xml_syntax_folding = 1

" scroll to show always show some lines around the cursor
set scrolloff=3

" reload files changed on disk when Vim regains focus,
"  unless there are local changes
" if this isn't working for you, perhaps only outside of the GUI,
"  see these pages:
" http://stackoverflow.com/questions/2490227/how-does-vims-autoread-work
" https://groups.google.com/forum/?fromgroups=#!topic/vim_dev/uqQuSfvuTrc
set autoread

" use prettier characters to represent whitespace in list mode,
"  and long lines and line wraps
" possible eol characters if I wanted one: ↩, ↲, ⬎, or ⤸
set listchars=eol:$,tab:▸\ ,trail:·,extends:…,precedes:…,conceal:…,nbsp:·
set showbreak=↪\ 

" remove comment markers when joining lines
try
	set formatoptions+=j
catch /^Vim\%((\a\+)\)\=:E539/ " the j option was added in Vim 7.4
endtry

" TODO automatically reload changed files if the buffer was unedited
" currently, the GUI pops up a dialog every time

" TODO stop ' in plain text mode from writing ''; I use it for apostrophe
" sometimes


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
set tabstop=4


"------------------------------------------------------------
" Mappings

let mapleader=","
let g:mapleader=","

" Map Y to act like D and C, i.e. to yank until EOL, rather than act as yy,
" which is the default
" this is currently being overwritten by yrrecord in YankRing; TODO fix
noremap Y y$

" Press space bar to turn off search highlighting and clear any message displayed
nnoremap <silent> <Space> :nohl<Bar>:echo<CR>

" on wrapped lines, move up and down visually, not logically
nnoremap j gj
nnoremap k gk
vnoremap j gj
vnoremap k gk
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
" stop selecting the newline in Visual mode
vnoremap ` $h

" keep indentation if I press Esc right after o or O
nnoremap o ox<BS>
nnoremap O Ox<BS>
" also keep indentation if I press Esc right after a newline in Insert mode
inoremap <Esc> x<BS><Esc>

" when indenting with < and >, make it easy to repeat
vnoremap < <gv
vnoremap > >gv

" run recorded macros easily
" use qq to record
" if you want Ex mode, run :normal! Q
nnoremap Q @q

" Disable regexes in search by default. When editing a search pattern,
" change V to v to enable standard (not Vim-flavored) regexes.
" see :help \V
nnoremap / /\V
vnoremap / /\V
nnoremap ? ?\V
vnoremap ? ?\V

" substitute
nnoremap <Leader>s :%s/\V/g<left><left>
" in visual mode, the range '<,'> is typed automatically
vnoremap <Leader>s :s/\V/g<left><left>

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
nmap <Leader>r "ryiwmr:%s/\<<C-R>r\>//gc<left><left><left><C-R>r
vmap <Leader>r   "rymr:%s/<C-R>r//gc<left><left><left><C-R>r
"nmap <Leader>r "ryiwmrvii:s/\<<C-R>r\>//gc<left><left><left><C-R>r
"vmap <Leader>r   "rymrvii:s/\<<C-R>r\>//gc<left><left><left><C-R>r

" view recently opened files
" I would type 'q' afterwards in the mapping, but that has no effect for some reason
nnoremap <Leader>bo :browse oldfiles<CR>

" Remap <f1> to <esc> in every mode to accommodate fat-fingering
nmap <f1> <esc>
vmap <f1> <esc>
xmap <f1> <esc>
smap <f1> <esc>
omap <f1> <esc>
imap <f1> <esc>
lmap <f1> <esc>
cmap <f1> <esc>

" CDC = Change to Directory of Current file
" CDCP = Change to Directory of Current file's Parent
" via http://vim.wikia.com/wiki/Set_working_directory_to_the_current_file
" TODO once saw this command fail when current directory was on a different
"  drive (Z instead of C). This command's fault? Can I fix it?
command CDC cd %:p:h
command CDCP cd %:p:h/..
command CDCPP cd %:p:h/../..

" search for trailing whitespace and confirm its deletion
" based on http://vim.wikia.com/wiki/Highlight_unwanted_spaces#Highlighting_with_a_search
"  and http://vim.wikia.com/wiki/Remove_unwanted_spaces
" TODO set options 'highlight' and 'list' before the search
command TrailingWhitespaceDelete :%s/\(\S\+\)\@<=\s\+$//c

" commands to edit the clipboard in a buffer
" useful for Vim for Windows, which doesn't have the Command key for Cmd-A and Cmd-V
" Load Clipboard into buffer
command LC normal ggVG"*pgg0
" Save Clipboard - copy buffer into clipboard, preserving cursor position
command SC normal VggoG"*y<C-O>

" TODO make { and } work with indented blank lines (see OO files in Notes)
" (already done; but see if I had better ideas in my OO files than what I've written)
" FIXME this should skip past consecutive blank lines when called when you're
"  already on a blank line
" FIXME this overwrites the current search and doesn't restore it
nnoremap } /\v^\s*$<CR>:nohl<Bar>:echo<CR>
nnoremap { ?\v^\s*$<CR>:nohl<Bar>:echo<CR>
vnoremap } /\v^\s*$<CR>
vnoremap { ?\v^\s*$<CR>
onoremap } /\v^\s*$<CR>:nohl<Bar>:echo<CR>
onoremap { ?\v^\s*$<CR>:nohl<Bar>:echo<CR>


"------------------------------------------------------------
" Autocommands

" TODO look up good autocommand templates so I know I'm writing them
"  correctly, safely, and efficiently

" when loading a given file into a buffer for the first time, run `cd .`
"  so that its file path in the status line becomes relative to the
"  working directory
au BufReadPost *  cd .

" file extensions Vim doesn’t recognize
au BufNewFile,BufRead *.sscm  setf scheme

" when editing Ruby, use size-2 tabs
au FileType ruby  set tabstop=2 | set shiftwidth=2

" when editing YAML, use spaces for indentation
au FileType yaml  set expandtab

" customize word characters
au FileType scss  setlocal iskeyword+=-,@-@,$,%
au FileType css  setlocal iskeyword+=-
au FileType coffee  setlocal iskeyword+=$

" TODO let `w` move past straight single quotes (apostrophes) in words,
"  only in plain text files
"au FileType [no-file-type] setlocal iskeyword+='


"------------------------------------------------------------
" Todo list

" TODO fix that autoquoting in Insert mode breaks . repetition
" TODO fix repeat.vim not allowing me to repeat NERDCommenter commands
"  (e.g. ,c<Space>) as I think it’s supposed to

" TODO way to reindent tabs <-> spaces, change number of spaces
" TODO language-specific indentation styles/sizes

" TODO way to toggle between blank lines being empty or indented

" TODO when Vim opens a directory, keep NERDTree open after choosing a file
"  from its listing

" TODO fix that pasting lines adds an extra blank line to the end

" TODO add mapping to create blank comment from Normal or Insert mode,
"  by default with spaces between delimiters and content
" e.g. write '// ', '//', '/*  */', or '/**/'
" I feel like NERDCommenter should do this, but I don't think it does
