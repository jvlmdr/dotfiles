set nocompatible

syntax enable
"set background=dark
"colorscheme solarized

"set backspace=indent,eol,start

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Some Linux distributions set filetype in /etc/vimrc.
" Clear filetype flags before changing runtimepath to force Vim to reload them.
if exists("g:did_load_filetypes")
filetype off
filetype plugin indent off
endif
set runtimepath+=/home/n8016577/src/vim-ft-go
filetype plugin indent on
syntax on
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set history=50
set ruler
set showcmd
set incsearch

if has('mouse')
  set mouse=a
endif

au BufNewFile,BufRead *.go set shiftwidth=4
au BufNewFile,BufRead *.go set tabstop=4

au BufNewFile,BufRead *.c,*.cc,*.cpp,*.h,*.hh,*.hpp,*.m,*.tex,*.py set expandtab
au BufNewFile,BufRead *.c,*.cc,*.cpp,*.h,*.hh,*.hpp,*.m,*.tex,*.py set shiftwidth=2
au BufNewFile,BufRead *.c,*.cc,*.cpp,*.h,*.hh,*.hpp,*.m,*.tex,*.py set tabstop=2
au BufNewFile,BufRead *.c,*.cc,*.cpp,*.h,*.hh,*.hpp,*.m,*.tex,*.py set softtabstop=2

set nojoinspaces

au BufReadPre SConstruct,SConscript set filetype=python
au BufReadPre *.tex set filetype=latex
au BufNewFile,BufRead *.plt,*.gnuplot setf gnuplot

au BufNewFile,BufRead *.c,*.cc,*.cpp,*.h,*.hh,*.hpp set cindent
au BufNewFile,BufRead *.m,*.tex set smartindent
au BufNewFile,BufRead *.py set autoindent

au BufNewFile,BufRead *.c,*.cc,*.cpp,*.h,*.hh,*.hpp,*.m,*.py set textwidth=80
au BufNewFile,BufRead *.tex set textwidth=0

au BufNewFile,BufRead *.tex set linebreak
au BufNewFile,BufRead *.tex set wrap
au BufNewFile,BufRead *.tex set spell
au BufNewFile,BufRead *.tex set spelllang=en_au,en_gb,en_us
