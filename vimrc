set vb t_vb=
set tags=./tags,../tags,../../tags,$SRC_ROOT/tags
set ic
set autoindent
set smartindent
set cindent
filetype plugin indent on

set ts=4
set tabstop=4
set textwidth=80
set expandtab
set shiftwidth=2
set softtabstop=2

"take care to not add "="
" 
"   gN    Place C++ scope declarations N characters from the indent of the
"         block they are in.  (default 'shiftwidth'). (public/private)

"   +N    Indent a continuation line (a line that spills onto the next)
"         inside a function N additional characters.  (default 'shiftwidth').
"   
"   >N    Amount added for "normal" indent.  Used after a line that should
"         increase the indent (lines starting with "if", an opening brace, etc.).
"   
"   ^N    Add N to the prevailing indent inside a set of braces if the
"         opening brace is in column 0.

"   :N    Place case labels N characters from the indent of the switch().
"   =N    Place statements occurring after a case label N characters from
"         the indent of the label.  (default 'shiftwidth').
"   
"   (N    When in unclosed parentheses, indent N characters from the line (if conditions)
"         with the unclosed parentheses.  Add a 'shiftwidth' for every unclosed parentheses.
"   
"   hN    Place statements occurring after a C++ scope declaration N
"         characters from the indent of the label.

"   tN    Indent a function return type declaration N characters from the
"         margin.  (default 'shiftwidth').

"	lN    If N != 0 Vim will align with a case label instead of the
"         statement after it in the same line.

se cinoptions=g-2,+0,>2,^2,:2,=2,(0,h4,t0,l1

"wrap text visually (http://vim.wikia.com/wiki/Word_wrap_without_line_breaks)
set wrap
set linebreak
set formatoptions+=l
set wrapmargin=0

set nocp 
filetype plugin on

"Set various width parameters
"setlocal sw=2 ts=8 tw=78
"setlocal sw=2 ts=2 tw=78
"setlocal cinoptions=>2s,e-s,n-s,f0,{s,^-s,:s,=s,g0,+.5s,p2s,t0,(0 cindent
"set noexpandtab


"se cinoptions=g-2,=,:2,=0,=(0
set noerrorbells
set ruler
set vb t_vb=
set novisualbell
"set guifont=7X13
"set aw sw=4 mouse=a
set title
set dir=/tmp
set nobackup writebackup
set backupdir=/tmp,.
set sm
set incsearch
set hlsearch

autocmd BufRead *.cs set syntax=xml
autocmd BufRead *       set formatoptions=tcql nocindent comments&
"autocmd BufRead *.c,*.cpp,*.h set ts=4 sw=4 expandtab
autocmd BufRead *.c,*.cpp,*.h set formatoptions=tcroq cindent comments=sr:/*,mb:*,el:*/,://

"autocmd BufNewFile *.c,*.cpp,*.h set ts=4 sw=4 expandtab
autocmd BufNewFile *.c,*.cpp,*.h set formatoptions=tcroq cindent comments=sr:/*,mb:*,el:*/,://

set showmode
map #1 :!more /.vi_help<CR>
map #2 :set number<CR>
map #3 :set nonumber<CR>
map #3 :NERDTreeToggle<CR>



"map q mgMkmh3G/modified:f:D:r !dtkJx'h`g
map [19~ :w
map [20~ wbk
map [23~ :n
map [24~ 
map OH H
map OF L
map w :w
map r :n
map s :e#
map  x 

if has("terminfo")
  set t_Co=16
  set t_AB=[%?%p1%{8}%<%t%p1%{40}%+%e%p1%{92}%+%;%dm
  set t_AF=[%?%p1%{8}%<%t%p1%{30}%+%e%p1%{82}%+%;%dm
else
  set t_Co=16
  set t_Sf=[3%dm
  set t_Sb=[4%dm
endif

"autocmd BufEnter *.[Cch]  source ~/c.vim
"let mysyntaxfile = "~/syntax.vim"
": au BufNewFile,BufRead ad*    source /usr/share/vim/vim56/syntax/cvxlog.vim

:filetype on
":autocmd FileType c,cpp :set cindent
:set cindent
:set nohls



set incsearch
set ic
set shell=/bin/sh
set sm
"set guifont=7X13


" if version <= 300
" An example for a gvimrc file.
" The commands in this are executed when the GUI is started.
"
" Maintainer:	Bram Moolenaar <Bram@vim.org>
" Last change:	2001 Sep 02
"
" To use it, copy it to
"     for Unix and OS/2:  ~/.gvimrc
"	      for Amiga:  s:.gvimrc
"  for MS-DOS and Win32:  $VIM\_gvimrc
"	    for OpenVMS:  sys$login:.gvimrc

" Make external commands work through a pipe instead of a pseudo-tty
"set noguipty

" set the X11 font to use
" set guifont=-misc-fixed-medium-r-normal--14-130-75-75-c-70-iso8859-1

set ch=2		" Make command line two lines high

set mousehide		" Hide the mouse when typing text

" Make shift-insert work like in Xterm
map <S-Insert> <MiddleMouse>
map! <S-Insert> <MiddleMouse>
map! <CONTROL><SHIFT>v "g+P<CR>"

" Only do this for Vim version 5.0 and later.
if version >= 500

  " I like highlighting strings inside C comments
  let c_comment_strings=1

  " Switch on syntax highlighting if it wasn't on yet.
  if !exists("syntax_on")
    syntax on
  endif

  " Switch on search pattern highlighting.
  set hlsearch

  " For Win32 version, have "K" lookup the keyword in a help file
  "if has("win32")
  "  let winhelpfile='windows.hlp'
  "  map K :execute "!start winhlp32 -k <cword> " . winhelpfile <CR>
  "endif

  " Set nice colors
  " background for normal text is light grey
  " Text below the last line is darker grey
  " Cursor is green, Cyan when ":lmap" mappings are active
  " Constants are not underlined but have a slightly lighter background
  highlight Normal guibg=grey90
  highlight Cursor guibg=Black guifg=NONE
  highlight lCursor guibg=Cyan guifg=NONE
  highlight NonText guibg=grey80
  highlight Constant gui=NONE guibg=grey95
  highlight Special gui=NONE guibg=grey95

endif

set nocsverb
    " add any cscope database in current directory
    if filereadable("src.out")
        cs add src.out
    " else add the database pointed to by environment variable
    elseif $CSCOPE_DB != ""
        cs add $CSCOPE_DB
    endif


source ~/.cscope_map.vim


:au BufNewFile,BufRead *log    source ~/.cvxlog.vim
:au BufNewFile,BufRead *latest    source ~/.cvxlog.vim
":au BufNewFile,BufRead *.h    source /usr/local/share/vim/vim70/syntax/cpp.vim


map ` <ESC>:!p4 edit %<CR>


":winpos 350 350
":set lines=50
":set columns=80

:autocmd BufNewFile  *.c	0r ~/.skeleton.c
:autocmd BufNewFile  *.cpp	0r ~/.skeleton.cpp
:autocmd BufNewFile  *.h	0r ~/.skeleton.h

au BufRead,BufNewFile *.yang set filetype=yang

au FileType c,cpp setlocal comments=sO:*\ -,mO:*\ \ ,exO:*/,s1:/*,mb:*,ex:*/,f://
"au FileType xml exe ":silent 1,$!xmllint --format --recover - 2>/dev/null"
"au FileType cs exe ":silent 1,$!xmllint --format --recover - 2>/dev/null"


"folding settings
set foldmethod=indent   "fold based on indent
set foldnestmax=10      "deepest fold is 10 levels
set nofoldenable        "dont fold by default
set foldlevel=1         "this is just what i use

map  <F7>   <Plug>ShowFunc 
map! <F7>   <Plug>ShowFunc

function! Paste(mode)
if a:mode == "v"
normal gv
normal "+P
normal l
elseif a:mode == "i"
set virtualedit=all
normal `^"+gP
let &virtualedit = ""
endif
endfunction

"vnoremap <C-X> "+d
"vnoremap <C-C> "+y
"nnoremap <C-V> "+gPl
"vnoremap <C-V> :<C-U>call Paste("v")<CR>
"inoremap <C-V> <C-O>:call Paste("i")<CR>

set nocompatible          " get rid of Vi compatibility mode. SET FIRST!
filetype plugin indent on " filetype detection[ON] plugin[ON] indent[ON]
set t_Co=256              " enable 256-color mode.
syntax enable             " enable syntax highlighting (previously syntax on).
"colorscheme desert        " set colorscheme
set number                " show line numbers
set laststatus=2          " last window always has a statusline
filetype indent on        " activates indenting for files
set nohlsearch            " Don't continue to highlight searched phrases.
set incsearch             " But do highlight as you type your search.
set ignorecase            " Make searches case-insensitive.
set ruler                 " Always show info along bottom.
set autoindent            " auto-indent
set tabstop=4             " tab spacing
set softtabstop=4         " unify
set shiftwidth=4          " indent/outdent by 4 columns
set shiftround            " always indent/outdent to the nearest tabstop
set expandtab             " use spaces instead of tabs
set smarttab              " use tabs at the start of a line, spaces elsewhere
