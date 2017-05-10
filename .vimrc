set nocompatible " vim not vi

syntax enable
set background=dark
colorscheme solarized
" https://stackoverflow.com/questions/5560658/ubuntu-vim-and-the-solarized-color-palette
set t_Co=16
"let g:solarized_termcolors=16
"set t_Co=256

"source ~/.vim/plugin/matchit.vim

"set backspace=indent,eol,start

"filetype off
"set rtp+=/Users/jack/src/vim-go
"" Disable indent because Matlab indentation is broken with keyword "end".
""filetype plugin indent on
"filetype plugin on

set history=50
set number
set ruler
set showcmd
set incsearch

if has('mouse')
  set mouse=a
endif

" expandtab -- insert spaces when tab is inserted
" tabstop -- the width of a tab character
" softtabstop -- the width of an inserted tab
"   (should probably match tabstop when expandtab is false)
" shiftwidth -- the shift of operators >> and <<

au BufNewFile,BufRead *.go   set noexpandtab tabstop=4 softtabstop=4 shiftwidth=4
au BufNewFile,BufRead *.json set noexpandtab tabstop=2 softtabstop=2 shiftwidth=2
au BufNewFile,BufRead *.py   set   expandtab tabstop=4 softtabstop=4 shiftwidth=4
au BufNewFile,BufRead *.m    set   expandtab tabstop=2 softtabstop=2 shiftwidth=2
au BufNewFile,BufRead *.tex  set   expandtab tabstop=2 softtabstop=2 shiftwidth=2
au BufNewFile,BufRead *.sh   set   expandtab tabstop=4 softtabstop=4 shiftwidth=4

au BufNewFile,BufRead *.html,*.htm set expandtab tabstop=2 softtabstop=2 shiftwidth=2
au BufNewFile,BufRead *.c,*.cc,*.cpp,*.h,*.hh,*.hpp set expandtab tabstop=2 softtabstop=2 shiftwidth=2

set nojoinspaces

au BufNewFile,BufRead SConstruct,SConscript set filetype=python
au BufNewFile,BufRead *.tex set filetype=latex
au BufNewFile,BufRead *.plt,*.gnuplot setf gnuplot

au BufNewFile,BufRead *.c,*.cc,*.cpp,*.h,*.hh,*.hpp set cindent
au BufNewFile,BufRead *.m  set autoindent
au BufNewFile,BufRead *.py set autoindent
au BufNewFile,BufRead *.sh set autoindent

au BufNewFile,BufRead *.c,*.cc,*.cpp,*.h,*.hh,*.hpp set textwidth=80
au BufNewFile,BufRead *.m   set textwidth=80
au BufNewFile,BufRead *.py  set textwidth=80
au BufNewFile,BufRead *.tex set textwidth=0

au BufNewFile,BufRead *.tex set linebreak
au BufNewFile,BufRead *.tex set wrap
au BufNewFile,BufRead *.tex set spell
au BufNewFile,BufRead *.tex set spelllang=en_au,en_gb,en_us
au BufNewFile,BufRead *.tex syn spell toplevel
"au BufNewFile,BufRead *.tex map j gj
"au BufNewFile,BufRead *.tex map k gk
"au BufNewFile,BufRead *.tex map $ g$
"au BufNewFile,BufRead *.tex map ^ g^
"au BufNewFile,BufRead *.tex map 0 g0
"let g:tex_indent_brace=0

" Enable local .vimrc files.
set exrc
" For safety (see https://andrew.stwrt.ca/posts/project-specific-vimrc/)
set secure
