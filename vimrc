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


" my plugins:

" TODO review installed plugins and delete ones I don't use
"  to improve startup time

" libraries used by other scripts
" used by most tpope scripts, at least
Plugin 'tpope/vim-repeat'
" used by snipmate, at least
Plugin 'MarcWeber/vim-addon-mw-utils'
" used by snipmate, at least
Plugin 'tomtom/tlib_vim'
" used by xolox/vim-session, xolox/vim-easytags
Plugin 'xolox/vim-misc'
" used by my own vimrc
Plugin 'kana/vim-textobj-user'

" for all of Vim
Plugin 'flazz/vim-colorschemes'
Plugin 'altercation/vim-colors-solarized'
Plugin 'godlygeek/csapprox'
Plugin 'ScrollColors'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'garbas/vim-snipmate'
Plugin 'honza/vim-snippets'
Plugin 'scrooloose/nerdcommenter'
Plugin 'scrooloose/nerdtree'
Plugin 'airblade/vim-rooter'
" Syntastic below is not recommended for Windows;
" disable if it pops up too many cmd windows
Plugin 'scrooloose/syntastic'
Plugin 'tpope/vim-unimpaired'
Plugin 'tpope/vim-surround'
Plugin 'junegunn/vim-easy-align'
Plugin 'tommcdo/vim-exchange'
Plugin 'majutsushi/tagbar'
Plugin 'ervandew/supertab'
Plugin 'mbbill/undotree'
" TODO consider replacing greplace with 'thinca/vim-qfreplace'.
" It’s similar but works with any quickfix data.
Plugin 'greplace.vim'
Plugin 'bufkill.vim'
Plugin 'tpope/vim-abolish'
" delimitMate is an untried alternative to the below AutoClose--Alves
Plugin 'AutoClose--Alves'
" I can't get swapit to work; try some more
Plugin 'mjbrownie/swapit'
Plugin 'tpope/vim-speeddating'
" DetectIndent is my own fork, with more features than the abandoned original
"  and a few improvements from the fork it’s based on
Plugin 'roryokane/detectindent', {'pinned': 1}
Plugin 'othree/eregex.vim'
Plugin 'dahu/bisectly'
Plugin 'xolox/vim-session'
Plugin 'junegunn/vader.vim'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'Shougo/unite.vim'

" integration with external tools
Plugin 'rking/ag.vim'
Plugin 'xolox/vim-easytags'
Plugin 'tpope/vim-fugitive'
Plugin 'int3/vim-extradite'
Plugin 'itspriddle/vim-marked'

" specific to certain languages
" TODO change vim-polyglot to use my old Markdown library, which was better
"  (in more visible syntax highlighting of elements like headers and code)
"  (in correctly recognizing the .md extension, which I have worked around
"  using an autocommand)
" FIXME vim-polyglot breaks my newly-fixed HTML indenting
"  everything now indents fine when the plugin is disabled
"  yet disabling vim-polyglot’s HTML indent file with `finish` doesn’t help
Plugin 'sheerun/vim-polyglot'
Plugin 'michaeljsmith/vim-indent-object'
Plugin 'tpope/vim-endwise'
Plugin 'AndrewRadev/splitjoin.vim'
Plugin 'tpope/vim-scriptease'
Plugin 'tristen/vim-sparkup'
Plugin 'sukima/xmledit'
Plugin 'jQuery'
Plugin 'leafo/moonscript-vim'
Plugin 'jrozner/vim-antlr'
Plugin 'kien/rainbow_parentheses.vim'
Plugin 'guns/vim-sexp'
Plugin 'tpope/vim-sexp-mappings-for-regular-people'
Plugin 'guns/vim-clojure-static'
Plugin 'tpope/vim-leiningen'
Plugin 'tpope/vim-fireplace'
Plugin 'dag/vim-fish'
Plugin 'mxw/vim-jsx'


" Attempt to determine the type of a file based on its name and possibly its
" contents.  Use this to allow intelligent auto-indenting for each filetype,
" and for plugins that are filetype specific.
filetype plugin indent on


"------------------------------------------------------------
" Plugin settings
" (Not all plugin settings go here. Settings closely related to other
" functionality in this vimrc are near that specific place.)

let g:airline_left_sep=''
let g:airline_right_sep=''
" don’t warn about trailing whitespace, because I like to indent even
"  blank lines, but Vim sees that indentation as trailing whitespace
let g:airline#extensions#whitespace#checks = [ 'indent' ]

" Set 'grepprg' for the Greplace plugin. Changing this also affects the
"  built-in :grep command and plugins that use it, but I don’t think I
"  depend on any of those.
set grepprg=ag
let g:grep_cmd_opts = '--line-numbers --noheading'

" settings for vim-session
let g:session_autosave = 'no'
let g:session_autoload = 'no'
let g:session_command_aliases = 1

" settings for vim-surround
" add custom surroundings: ‘’ “”
" FIXME this doesn’t let me create or delete these surroundings;
"  only add them
" look at vim-surround’s GitHub issues to see if this has been
"  reported already
let g:surround_8216 = "‘\r’"
let g:surround_8217 = "‘\r’"
let g:surround_8220 = "“\r”"
let g:surround_8221 = "“\r”"

" RainbowParens colors
" the colors must contrast from Lisp code highlighted with my color scheme,
"  and be of similar brightnesses
" compared to default, the unusually-light SeaGreen3 is changed to a dark yellow
let g:rbpt_colorpairs = [
    \ ['brown',       'RoyalBlue3'],
    \ ['Darkblue',    '#b07000'],
    \ ['darkgray',    'DarkOrchid3'],
    \ ['darkgreen',   'FireBrick3'],
    \ ['darkcyan',    'RoyalBlue3'],
    \ ['darkred',     '#b07000'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['brown',       'FireBrick3'],
    \ ['gray',        'RoyalBlue3'],
    \ ['black',       '#b07000'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['Darkblue',    'FireBrick3'],
    \ ['darkgreen',   'RoyalBlue3'],
    \ ['darkcyan',    '#b07000'],
    \ ['darkred',     'DarkOrchid3'],
    \ ['red',         'FireBrick3'],
    \ ]

let g:tagbar_sort = 0

" disable easytags becasue it makes saving buffers too slow
" I will re-enable it after it implements async in a Vim-8-compatible way
let g:easytags_events = []

" Unite
let g:unite_source_history_yank_enable = 1
call unite#filters#matcher_default#use(['matcher_fuzzy'])
call unite#filters#sorter_default#use(['sorter_rank'])
" mappings for Unite are in the Mappings section,
"  so they can use its <Leader> value

" vim-multiple-cursors
" first, initialize the setting to the default, so it
" exists while the vimrc is running
let g:multi_cursor_normal_maps = {'!':1, '@':1, '=':1, 'q':1, 'r':1, 't':1, 'T':1, 'y':1, '[':1, ']':1, '\':1, 'd':1, 'f':1, 'F':1, 'g':1, '"':1, 'z':1, 'c':1, 'm':1, '<':1, '>':1}
" then edit the setting
let g:multi_cursor_normal_maps[' '] = 1

let g:undotree_SetFocusWhenToggle = 1
let g:undotree_TreeNodeShape = '○'

let g:marked_app = "Marked"

" vim-jsx
"let g:jsx_ext_required = 0


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
" Alternatives include using tabs or split windows instead of re-using the
" same window for multiple buffers, and/or:
" set confirm
" set autowriteall

" Better command-line completion
set wildmenu
" Complete like most shells – longest substring first, then iterate through
"  full matches
set wildmode=longest:full,full

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

" Allow positioning the cursor past the end of the line in visual block mode.
" Makes selecting columns easier if the first row isn’t the longest row.
set virtualedit=block

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

" how to load various color schemes
function! s:LoadCLIColorSchemeWombat()
	set background=dark
	colorscheme wombat256
endfunction
function! s:LoadCLIColorSchemeSolarized()
	let g:solarized_visibility = "normal"
	let g:solarized_menu = 0
	" I don’t use Solarized globally in my Terminal, so approximate the colors
	let g:solarized_termcolors = 256
	colorscheme solarized
endfunction
function! s:LoadCLIColorSchemeSolarizedLight()
	set background=light
	call s:LoadCLIColorSchemeSolarized()
endfunction
function! s:LoadCLIColorSchemeSolarizedDark()
	" set background *before* the call; necessary for termcolors approximation
	set background=dark
	call s:LoadCLIColorSchemeSolarized()
endfunction
"call s:LoadCLIColorSchemeWombat()
call s:LoadCLIColorSchemeSolarizedLight()

" wrap, but only in the display, not in the file
set wrap
set linebreak
set nolist
set textwidth=0
set wrapmargin=0
" indent wrapped lines
let &showbreak = "↪\ "
if exists("+breakindent")
	set breakindent
	" the default breakindentopt settings are good
	
	" an alternative group of settings to try out when I work with
	"  a file with lots of wrapping:
	"set showbreak=
	"set breakindentopt=shift:1
endif

" enable matchit to have % jump between keywords such as Ruby’s `do` and `end`
runtime macros/matchit.vim

" automatically create folds based on syntax
set foldmethod=syntax
set foldlevelstart=99
" enable folding for XML, where it's disabled by default
" I temporarily disable this when I have to edit large XML files
" next time I might disable this, try installing https://github.com/Konfekt/FastFold instead
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

" persist file undo history across Vim launches
set undofile undodir=$HOME/.vim/undofiles,$HOME/_vim/undofiles

" use prettier characters to represent whitespace and long lines in list mode
" some more-indicative but too-wide eol characters: ↩, ↲, ⬎, or ⤸
set listchars=eol:¬,tab:▸\ ,trail:·,extends:…,precedes:…,conceal:…,nbsp:·

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

" don’t save (global) options inside a session, so that sessions get vimrc updates
set sessionoptions-=options
" do save local options, such 'modifiable' for helpfiles
" FIXME helpfiles are still wrongly loaded as modifiable
"  What other options do I need to change?
"  Or is :SaveSession changing sessionoptions compared to :mksession?
"  It may have to do with the following from the session plugin’s session.txt:
"      Note that the vim-session plug-in automatically and unconditionally executes
"      the following change just before saving a session:
"      
"        " Don't persist options and mappings because it can corrupt sessions.
"        set sessionoptions-=options
"  Test whether -=options removes localoptions if options was already removed
"  No, -=options doesn’t remove localoptions; that’s not the problem
set sessionoptions+=localoptions


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

" Note that indentation type/size settings are set per-filetype in the Autocommands section.

" HTML indent script settings; `:help html-indent`:
" indent content within *all* HTML tags, except for the g:html_indent_autotags ones
" below list of elements transcribed from https://developer.mozilla.org/en-US/docs/Web/Guide/HTML/HTML5/HTML5_element_list
let all_html5_elements_comma_separated = "html,head,title,base,link,meta,style,script,noscript,template,body,section,nav,article,aside,h1,h2,h3,h4,h5,h6,header,footer,address,main,p,hr,pre,blockquote,ol,ul,li,dl,dt,dd,figure,figcaption,div,a,em,strong,small,s,cite,q,dfn,abbr,data,time,code,var,samp,kbd,sub,sup,i,b,u,mark,ruby,rt,rp,bdi,bdo,span,br,wbr,ins,del,img,iframe,embed,object,param,video,audio,source,track,canvas,map,area,svg,math,table,caption,colgroup,col,tbody,thead,tfoot,tr,td,th,form,fieldset,legend,label,input,button,select,datalist,optgroup,option,textarea,keygen,output,progress,meter,details,summary,menuitem,menu"
" inctags lists *additional* tags to be indented, not the whole list. But
"  there is no harm in my redundancy, and it makes maintaining the list
"  of elements easier.
let g:html_indent_inctags = all_html5_elements_comma_separated
" autotags overrides inctags, so I don’t have to remove these from inctags
let g:html_indent_autotags = "html,head,body"
let g:html_indent_script1 = 1
let g:html_indent_style1 = 1


"------------------------------------------------------------
" Mappings

let mapleader=" "
let g:mapleader=" "
noremap <Space> <Nop>
sunmap <Space>

" Map Y to act like D and C, i.e. to yank until EOL, rather than act as yy,
"  which is the default
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
"  like g:new_line_keep_indent and b:new_line_keep_indent
" and make DetectIndent set that setting appropriately, by having it be a hook
"  for the other plugin or vice versa
" I would want to set this on by default, but have it turned off if
"  DetectIndent finds lots of empty blank lines
nnoremap o ox<BS>
nnoremap O Ox<BS>
" also keep indentation if I press Esc right after a newline in Insert mode
inoremap <Esc> x<BS><Esc>
" in-development function version
"function! s:OpenBlankLineAndKeepIndentIfWanted()
"	normal! o
"	if get(g:, "new_line_keep_indent") || get(b:, "new_line_keep_indent")
"		normal! x<BS>
"	endif
"	return ''
"endfunction
"let g:new_line_keep_indent = 1
"nnoremap <expr> o <sid>OpenBlankLineAndKeepIndentIfWanted()

" add mapping in next section from ]<Space> to o<Esc>^O

" when indenting with < and >, make it easy to repeat
xnoremap < <gv
xnoremap > >gv

" run recorded macros easily
" use qq to record
" if you want Ex mode, run :normal! Q
nnoremap Q @q

" Disable regexes in search by default. When editing a search pattern,
" change V to v to enable standard (mostly not-Vim-flavored) regexes.
" see :help \V
nnoremap / /\V
xnoremap / /\V
nnoremap ? ?\V
xnoremap ? ?\V
" don’t let the eregex plugin overwrite this
"  Because I want to search text-only by default.
"  Use the plugin manually with :M/ and :M? (and :S to substitute).
let g:eregex_default_enable=0

" make v_* and v_# search for the selected text
" based on my Stack Overflow answer http://stackoverflow.com/a/40055926/578288
" TODO replace with more-robust plugin https://github.com/thinca/vim-visualstar
xnoremap * y/\V<C-R>"<CR>
xnoremap # y?\V<C-R>"<CR>

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
" FIXME this should disable 'wrapscan', only while running
" TODO respect g:new_line_keep_indent, or whatever setting I decide on
"  that the o mapping also uses
" TODO make indentation (=, >, >>, etc.) also respect g:new_line_keep_indent
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
" The `set nocursorline` improves NERDTree when opening it
" more than it hurts normal viewing when closing NERDTree.
" I don’t know of a cleaner way to set it yet.
nnoremap <Leader>n :NERDTreeToggle<CR>:set nocursorline<CR>

" edit vimrc
nnoremap <Leader>ev :edit $MYVIMRC<CR>
" edit gvimrc
nnoremap <Leader>eg :edit $MYGVIMRC<CR>

" make <Ctrl-W> window mappings easier to type
nnoremap <Leader>w <C-W>
xnoremap <Leader>w <C-W>

" command-line mappings
" to go with <C-E> as an easy-to-remember Emacs-like mapping, and because
"  I wlll probably never need to use the default behavior of <C-A>
cnoremap <C-A> <Home>
" delete the previous word with Option-Delete (for Mac)
cnoremap <M-BS> <C-W>
" or with Ctrl-Backspace (for Windows)
cnoremap <C-BS> <C-W>

" search the whole project easily
nnoremap <Leader>/ :Ag ''<Left>

" search for the current word or selection in the whole project
" (° is <A-*> on Mac; neither <A-*> nor <S-A-8> work for some reason)
nnoremap °    :Ag '\b<C-R>=expand("<cword>")<CR>\b'<CR>
xnoremap ° "sy:Ag '<C-R>s'<CR>

" start interactive EasyAlign from visual mode (e.g. after `vip`)
xmap + <Plug>(EasyAlign)

" mappings for the Unite plugin
nnoremap <Leader>be :Unite -no-split -buffer-name=buffer buffer<CR>
nnoremap <Leader>y  :Unite -buffer-name=yank history/yank<cr>

" browse Most-Recently Updated files with the Ctrl-P plugin
nnoremap <Leader>mr :CtrlPMRUFiles<CR>

" text objects to select “…” and ‘…’ – text in smart quotes
" I use [^”]* instead of .* or .\{-} to match the minimum possible
" for select i, I use lookbehind and lookahead to match within quotes
" for select a, I treat trailing and leading whitespace the same as |v_aquote|,
"  using negative lookahead to properly prioritize trailing whitespace
" cases not handled:
" • nested same-type quotes (too rare)
" • distinguishing apostrophes from closing single quotes
"   (too complex; would require a database of apostrophized English words)
" • selecting inner when on a closing quote
"   (would require reimplementing 'pattern' with 'select-function', because
"   the textobj-user plugin does not implement this automatically)
call textobj#user#plugin('smartquotes', {
\   'i“”': {
\     'pattern': '\(“\)\@<=[^”]*\(”\)\@=',
\     'select': ['i“', 'i”'],
\   },
\   'i‘’': {
\     'pattern': '\(‘\)\@<=[^’]*\(’\)\@=',
\     'select': ['i‘', 'i’'],
\   },
\   'a“”': {
\     'pattern': '“[^”]*”\s\+\|\s*“[^”]*”\(\s\)\@!',
\     'select': ['a“', 'a”'],
\   },
\   'a‘’': {
\     'pattern': '‘[^’]*’\s\+\|\s*‘[^’]*’\(\s\)\@!',
\     'select': ['a‘', 'a’'],
\   },
\ })

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
" I check whether the function exists first so that Vim doesn’t redefine it
"  while it’s running, resulting in showing me an error
if !exists("*s:ReloadVimConfig")
	function! s:ReloadVimConfig()
		source $MYVIMRC
		if has('gui_running')
			source $MYGVIMRC
		endif
	endfunction
endif
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

" commands and mappings to transfer between a buffer and the system clipboard
" better than MacVim's Cmd-A, Cmd-C, and Cmd-V in that they preserve cursor position
" commands:
" Load From Clipboard into buffer
command! Lfc  normal! ggVG"*pgg0
" Save buffer To Clipboard - copy buffer into clipboard, preserving cursor position
command! Stc  normal! VggoG"*y<C-O>
" mappings:
" pasteboard (is source of) paste
nnoremap <Leader>pp ggVG"*pgg0
" pasteboard (is destination of) yank
nnoremap <Leader>py VggoG"*y<C-O>


"------------------------------------------------------------
" Mappings that rely on other mappings
" Mappings that don’t use noremap should be placed here, near the end, so they
"  are not overwritten by noremap mappings.

" prevent v_p from swapping the paste buffer
" this makes it easier to rename a variable by pasting its new name
"  over all instances
" function from http://stackoverflow.com/a/290723/578288 and
"  https://code.google.com/p/lh-vim/source/browse/misc/trunk/macros/repl-visual-no-reg-overwrite.vim
"  and also edited manually
function! RestoreClipboardRegister()
	if &clipboard == 'unnamed'
		let @* = s:restore_reg
	elseif &clipboard == 'unnamedplus'
		let @+ = s:restore_reg
	else
		let @" = s:restore_reg
	endif
	return ''
endfunction
function! s:Repl()
	let s:restore_reg = @"
	return "p@=RestoreClipboardRegister()\<cr>"
endfunction
xmap <silent> <expr> p <sid>Repl()

" easy variable rename (imperfect but useful)
" inspiration from http://stackoverflow.com/a/597932/578288
" less-advanced, working version, with no dependencies:
nnoremap <Leader>r    mr:%s/\V\<<C-R>=expand("<cword>")<CR>\>//c<left><left><C-R>=expand("<cword>")<CR>
xnoremap <Leader>r "rymr:%s/\V<C-R>r//c<left><left><C-R>r
" in-progress commented-out version, with dependencies:
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
"nnoremap <Leader>r "ryiwmrvii:s/\V\<<C-R>r\>//c<left><left><C-R>r
"xnoremap <Leader>r   "rymrvii:s/\V\<<C-R>r\>//c<left><left><C-R>r

" Remap <f1> to <esc> in every mode to accommodate fat-fingering
nmap <f1> <esc>
xmap <f1> <esc>
smap <f1> <esc>
omap <f1> <esc>
imap <f1> <esc>
lmap <f1> <esc>
cmap <f1> <esc>


"------------------------------------------------------------
" Autocommands

" when loading a given file into a buffer for the first time, run `cd .`
"  so that its file path in the status line becomes relative to the
"  working directory
augroup make_file_path_in_status_line_relative
	autocmd!
	autocmd BufReadPost *  cd .
augroup END

" detect indentation when opening a new file
augroup detect_indentation_automatically
	autocmd!
	autocmd BufReadPost *  DetectIndent
augroup END

" TODO reload NERDTree’s file tree when switching focus back into Vim
" what I want: if NERDTree exists: switch to its window, hit R, then switch back to original window
" R’s “map option” is “NERDTreeMapRefreshRoot”, but that is just a variable
"  controlling what mapping performs the command when in a NERDTree window
"  (R by default).
" one possibility is finding a command to switch to the NERDTree window and
"  calling it, pressing the appropriate mapping in the
"  `g:NERDTreeMapRefreshRoot` variable, and then moving the cursor back to the
"  previous window.
"autocmd FocusGained *  CustomFunctionToRefreshRoot

" file extensions that neither Vim nor vim-polyglot recognize correctly
augroup filetypes_for_file_extensions
	autocmd!
	autocmd BufNewFile,BufRead *.sscm  setfiletype scheme
	autocmd BufNewFile,BufRead *.wisp  setfiletype lisp
	autocmd BufNewFile,BufRead *.jisp  setfiletype lisp
	autocmd BufNewFile,BufRead *.sweet-clj  setfiletype clojure
	autocmd BufNewFile,BufRead *.js.es6  setfiletype javascript
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
	autocmd FileType ruby  setlocal tabstop=2 shiftwidth=2
	autocmd FileType coffee  setlocal tabstop=2 shiftwidth=2
	autocmd FileType markdown  setlocal expandtab tabstop=8 shiftwidth=4 softtabstop=4
	autocmd FileType yaml  setlocal expandtab
	" use spaces in Common Lisp and Clojure, but not in Scheme, where I
	"  sometimes use sweet-expressions
	" also disable soft tabstops in those Lisps, because their indents are
	"  mostly for alignment, not at multiples of 'tabstop'
	autocmd FileType lisp  setlocal expandtab softtabstop=0
	autocmd FileType clojure  setlocal expandtab softtabstop=0
	" ANTLR grammars normally use indents for alignment, so should use spaces
	autocmd FileType antlr3  setlocal expandtab
	autocmd FileType antlr4  setlocal expandtab
augroup END

augroup enable_rainbow_parentheses_for_relevant_filetypes
	autocmd!
	autocmd FileType lisp  RainbowParenthesesActivate
	autocmd FileType lisp  RainbowParenthesesLoadRound
	autocmd FileType scheme  RainbowParenthesesActivate
	autocmd FileType scheme  RainbowParenthesesLoadRound
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

" when Vim is started with a single directory argument,
"  change to that directory and set up a *real* NERDTree 
function! s:SetUpNERDTreeIfVimStartedWithOneDirectoryArgument()
	if argc() == 1 && getftype(argv(0)) == 'dir'
		bdelete " delete the automatically-opened directory browser
		exec 'cd' fnameescape(argv(0))
		NERDTree
		" I don’t know of any other way to configure the below for NERDTree
		set nocursorline
	endif
endfunction
augroup set_up_NERDTree_if_Vim_started_with_one_directory_argument
	autocmd!
	autocmd VimEnter *  call s:SetUpNERDTreeIfVimStartedWithOneDirectoryArgument()
augroup END

" TODO let `w` move past straight single quotes (apostrophes) in words,
"  only in plain text files
"autocmd FileType [no-file-type] setlocal iskeyword+='


"------------------------------------------------------------
" Todo list

" TODO fix that autoquoting in Insert mode breaks . repetition

" TODO way to reindent tabs <-> spaces, change number of spaces

" TODO way to toggle between blank lines being empty or indented

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
" make sure it works well with linewise and inline comments
"  and see if it is any better with letting you add spacing around comment delimiters

" TODO in an Autocommand function that runs on loading an XML file,
"  `let l:xml_syntax_folding = 1` (locally) only if the XML file is small enough
" have it turned off by default
" e.g. 'iTunes Music Library.xml' is too large, IndustrySafe XML files are small enough
" depending on autocommand run order, I might need to `:e` to
"  reload the file after changing the setting

" TODO run `:smap` followed by each printable character to find Select-mode
"  mappings (which shouldn’t exist) from plugins. Then update each plugin to
"  add `sunmap` to fix this, and make a pull request, or a fork if the
"  original is abandoned. I have already done this for bufexplorer and
"  vim-rooter; see those commits and pull requests for templates.

" TODO fix the sukima/xmledit plugin so that it loads properly in HTML
" Right now, auto-closing of HTML tags is only enabled in HTML mode after
"  previously opening XML mode. (It is always enabled in XML mode, as it
"  should be.)
" The insert-mode mapping for `>` to InsertGt (see it with `:imap >`) is
"  missing in HTML mode unless I open XML mode first.
" Add trace statements to the code to see if and when `html.vim` and `xml.vim`
"  are called when the filetype is set to html and to xml.
" The auto-closing does not happen in other filetypes, so whatever plugin it
"  is is tailored specifically for HTML and XML. It is just loading one of its
"  features wrong so that it is only activated when loading XML.
" See also :help 'runtimepath'
" Actually, even if I disable the single other plugin with a `filetypes/xml.vim`
"  or whatever, the problem still happens.
" I am debugging events using global variables g:ran_html_vim and g:ran_xml_vim,
"  inspecting their values when I just load HTML, just load XML, and load
"  XML followed by HTML.
" Look up Vim’s rules for loading ftplugin files
" look for related problems in https://github.com/sukima/xmledit/issues
" If I can’t get xmledit to work, I could use
"  https://github.com/docunext/closetag.vim. But I’m not sure if that’s a
"  better idea than just switching to XML mode when necessary.

" TODO wait for plugin 'henrik/vim-indexed-search' to actually work,
"  then install it.
" I tested it by commenting out everything in my vimrc except the plugin, and
"  it still didn’t work. I guess it broke with some Vim update, and I should
"  just wait for the developers to fix it.
" After I install it and it works, I will need to fix it overwriting my custom
"  / and ? mappings. I can do that with this strategy:
"  http://stackoverflow.com/questions/12770103/overriding-a-remapping-from-a-plugin#comment17258140_12770103
" That is, create a global variable `g:vim_indexed_search_map_forward_search`.
" Let it default to '/' if not set. If it is set, use `execute()` and
"  `get(g:, …)` to write the mapping with that variable contents.
" Have a similar mapping for backwards search, too. And maybe for n, N, *, and
"  #, to be thorough.
" Mapping contents could be like '/\V' (my current mapping; verynomagic search),
"  or like ':M/' (for users of the 'othree/eregex.vim' plugin)
" Instead of waiting for the plugin to be fixed, I have other options, too:
" http://stackoverflow.com/a/4671105/578288
"  write code to put the search index in the status line
" http://stackoverflow.com/a/4681402/578288
"  have a command or mapping that prints the number of instances of the search
" http://www.vim.org/scripts/script.php?script_id=1682
"  see if the older, original plugin doesn’t work with newer Vim too

" TODO fix that when indenting with >> or <<, the cursor stays at the same column –
"  it should stay on the same character instead

" FIXME for all new NERDTree tree browsers, `setlocal sidescrolloff=1`
" this will prevent double-clicking on an entry from sometimes scrolling the
"  list horizontally
" I think I will have to edit or fork NERDTree to implement that; I don’t see
"  a general way with NERDTree’s current customization possibilities, and
"  there are too many entry points for me to do it just in my NERDTree-opening
"  mappings and autocommands. I could wrap `:NERDTree`, but that might be too
"  brittle – for example, is that called by `:NERDTreeToggle`?

" TODO set 'foldtext' so that folds look just like the first and last lines
"  surrounding text about the number of lines folded, including the same
"  starting indentation
" for example, when folding some code “\t\tfunction() {\n\t\t\treturn 2 + 2;\n\t\t}”,
"  the fold text should be “\t\tfunction() {  (1 line)  }”
" in an autocommand for specific languages, such as Python and Lisps, I will
"  override 'foldtext' to not show the last line in the preview

" TODO switch from Vundle to NeoBundle so I can use its 'depends' feature and
"  stop manually tracking dependencies
" (https://github.com/Shougo/neobundle.vim/blob/dab02f0513dc7f8832cb7c191d43b84982ef34cb/doc/neobundle.txt#L810)
" settings up 'depends' would take a while, because I would have to read the
"  installation instructions in the README of every existing plugin

" TODO try the gruvbox color scheme (https://github.com/morhetz/gruvbox),
"  which has light/dark modes with the same colors like solarized, and which
"  uses many hues, but which uses a dark grey background for dark mode
"  instead of solarized's dark blue one that clashes with green text
