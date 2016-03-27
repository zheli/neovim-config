call plug#begin('~/.config/nvim/plugged')
" Plugins {
  " ctrl-p is a fuzzy file finder.
  Plug 'kien/ctrlp.vim'

  " Interface
  " ---
  " airline is a better status line and a tab-bar for nvim.
  Plug 'bling/vim-airline'
  Plug 'vim-airline/vim-airline-themes'
  " solarized
  Plug 'https://github.com/frankier/neovim-colors-solarized-truecolor-only.git'
" }
call plug#end()

if has('autocmd')
  filetype plugin indent on
endif
if has('syntax') && !exists('g:syntax_on')
  syntax enable
endif

" Configuration {
" }

" General {
  set backspace=indent,eol,start      " Allow backspace over everything in insert mode.
  set complete-=i
  set nrformats-=octal
  set smarttab

  "set autoindent         
  set noautoindent        " I indent my code myself.
  set nocindent           " I indent my code myself.
  "set smartindent        " Or I let the smartindent take care of it.
  
  set ttimeout
  set ttimeoutlen=100
  set mouse=r " keep copy/paste in iterm2

  " color scheme
"  let $NVIM_TUI_ENABLE_TRUE_COLOR=2
"  set background=dark
"  colorscheme solarized
" }

" Plugin Settings {
  " Airline {
    let g:airline_theme = 'serene'
    let g:airline_powerline_fonts = 1
    let g:airline#extensions#tabline#enabled = 1
    let g:airline#extensions#tabline#fnamemod = ':t'
    let g:airline#extensions#tabline#left_sep = ' '
    let g:airline#extensions#tabline#left_alt_sep = '|'
    let g:airline#extensions#tabline#right_sep = ' '
    let g:airline#extensions#tabline#right_alt_sep = '|'
    let g:airline_left_sep = ' '
    let g:airline_left_alt_sep = '|'
    let g:airline_right_sep = ' '
    let g:airline_right_alt_sep = '|'
  " }
" }
