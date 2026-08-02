set history=50
set number
set ruler
set showcmd
set incsearch

" if has('mouse')
"   set mouse=a
" endif

" " https://github.com/tpope/vim-pathogen
" execute pathogen#infect()

" set nocompatible " vim not vi

" Automatic regexp engine selection. This is the documented default, but
" Apple's /usr/bin/vim ships with re=1, whose backtracking engine
" near-hangs on TypeScript syntax regexes.
" https://stackoverflow.com/questions/69145357/vim-almost-hangs-with-100-line-typescript-file
if exists('&regexpengine')
  set regexpengine=0
endif
syntax enable

" Detect 'background' by asking the terminal for its colour (OSC 11).
" Vim only enables this query for xterm-like values of TERM, so under
" tmux-256color or screen-256color it otherwise assumes a light background.
if empty(&t_RB)
  let &t_RB = "\<Esc>]11;?\<Esc>\\"
endif

" colorscheme solarized
" " https://stackoverflow.com/questions/5560658/ubuntu-vim-and-the-solarized-color-palette
" set t_Co=16
" "let g:solarized_termcolors=16
" "set t_Co=256

"source ~/.vim/plugin/matchit.vim

"set backspace=indent,eol,start

let g:tex_flavor = 'latex'
let g:tex_comment_nospell=1

"filetype off
"set rtp+=/Users/jack/src/vim-go
"" Disable indent because Matlab indentation is broken with keyword "end".
""filetype plugin indent on
"filetype plugin on

" expandtab -- insert spaces when tab is inserted
" tabstop -- the width of a tab character
" softtabstop -- the width of an inserted tab
"   (should probably match tabstop when expandtab is false)
" shiftwidth -- the shift of operators >> and <<

set expandtab tabstop=4 softtabstop=4 shiftwidth=4  " Defaults.

au BufNewFile,BufRead *.go   set noexpandtab tabstop=4 softtabstop=4 shiftwidth=4
au BufNewFile,BufRead *.json set noexpandtab tabstop=2 softtabstop=2 shiftwidth=2
au BufNewFile,BufRead *.py   set   expandtab tabstop=4 softtabstop=4 shiftwidth=4
au BufNewFile,BufRead *.m    set   expandtab tabstop=2 softtabstop=2 shiftwidth=2
au BufNewFile,BufRead *.tex  set   expandtab tabstop=2 softtabstop=2 shiftwidth=2
au BufNewFile,BufRead *.sh   set   expandtab tabstop=4 softtabstop=4 shiftwidth=4
au BufNewFile,BufRead *.hs   set   expandtab tabstop=4 softtabstop=4 shiftwidth=4

au BufNewFile,BufRead *.md,*.markdown set expandtab tabstop=4 softtabstop=4 shiftwidth=4
au BufNewFile,BufRead *Makefile* set noexpandtab tabstop=4 softtabstop=4 shiftwidth=4
au BufNewFile,BufRead *.html,*.htm set expandtab tabstop=2 softtabstop=2 shiftwidth=2
au BufNewFile,BufRead *.c,*.cc,*.cpp,*.h,*.hh,*.hpp set expandtab tabstop=4 softtabstop=4 shiftwidth=4

" SWI-Prolog. Must be 'set filetype=' rather than setf: vim's own detection
" runs first and may pick perl for *.pl, which setf would not override.
au BufNewFile,BufRead *.pl,*.plt set filetype=prolog

set nojoinspaces

" au BufNewFile,BufRead SConstruct,SConscript set filetype=python
" "au BufNewFile,BufRead *.tex set filetype=latex
" au BufNewFile,BufRead *.plt,*.gnuplot setf gnuplot
" 
" au BufNewFile,BufRead *.c,*.cc,*.cpp,*.h,*.hh,*.hpp set cindent
" au BufNewFile,BufRead *.m  set autoindent
" au BufNewFile,BufRead *.py set autoindent
" au BufNewFile,BufRead *.sh set autoindent
" 
" au BufNewFile,BufRead *.c,*.cc,*.cpp,*.h,*.hh,*.hpp set textwidth=80
" au BufNewFile,BufRead *.m   set textwidth=80
" au BufNewFile,BufRead *.py  set textwidth=80
" au BufNewFile,BufRead *.tex set textwidth=0
" 
" au BufNewFile,BufRead *.tex set linebreak
" au BufNewFile,BufRead *.tex set wrap
" au BufNewFile,BufRead *.tex set spell
" au BufNewFile,BufRead *.tex set spelllang=en_au,en_gb,en_us
" au BufNewFile,BufRead *.tex syn spell toplevel
" "au BufNewFile,BufRead *.tex map j gj
" "au BufNewFile,BufRead *.tex map k gk
" "au BufNewFile,BufRead *.tex map $ g$
" "au BufNewFile,BufRead *.tex map ^ g^
" "au BufNewFile,BufRead *.tex map 0 g0
" "let g:tex_indent_brace=0

" " Enable local .vimrc files.
" set exrc
" " For safety (see https://andrew.stwrt.ca/posts/project-specific-vimrc/)
" set secure
