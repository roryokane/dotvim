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
Bundle 'repeat.vim'
Bundle 'paredit.vim'
" I can't get swapit to work; try some more
Bundle 'mjbrownie/swapit'
Bundle 'tpope/vim-speeddating'

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

" Highlight searches (use <C-L> to temporarily turn off highlighting; see the
" mapping of <C-L> below)
set hlsearch

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
" "press <Enter> to continue"
" set cmdheight=2

" Quickly time out on keycodes, but never time out on mappings
set notimeout ttimeout ttimeoutlen=200

" Use <F11> to toggle between 'paste' and 'nopaste'
set pastetoggle=<F11>

color wombat
" set guifont=Consolas:h11:cANSI
set guifont=Consolas:h14

" wrap, but only in the display, not in the file
set wrap
set linebreak
set nolist
set textwidth=0
set wrapmargin=0
" indent wrapped lines
set showbreak=->
" set breakindent " not in main vim; need to compile with a patch

"------------------------------------------------------------
" Indentation options
"
" Indentation settings according to personal preference.

" Indentation settings for using hard tabs for indent. Display tabs as
" four characters wide.
set shiftwidth=4
set tabstop=4


"------------------------------------------------------------
" Mappings
"
" Useful mappings

let mapleader=","
let g:mapleader=","

" Map Y to act like D and C, i.e. to yank until EOL, rather than act as yy,
" which is the default
" this is currently being overwritten by yrrecord in YankRing; TODO fix
noremap Y y$

" Map <C-L> (redraw screen) to also turn off search highlighting until the
" next search
nnoremap <C-L> :nohl<CR><C-L>

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

" run recorded macros easily
" use qq to record
" if you want Ex mode, run :normal! Q
nnoremap Q @q

" substitute
nnoremap <Leader>s :%s//g<left><left>
" in visual mode, the range '<,'> is typed automatically
vnoremap <Leader>s :s//g<left><left>

" Remap <f1> to <esc> in every mode to accommodate fat-fingering
nmap <f1> <esc>
vmap <f1> <esc>
xmap <f1> <esc>
smap <f1> <esc>
omap <f1> <esc>
imap <f1> <esc>
lmap <f1> <esc>
cmap <f1> <esc>


"------------------------------------------------------------
