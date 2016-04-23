call plug#begin('~/.config/nvim/plugged')

" Plugins {
  " ctrl-p is a fuzzy file finder.
  Plug 'kien/ctrlp.vim'
  " save sessions
  Plug 'https://github.com/tpope/vim-obsession.git'
  "  YouCompleteMe
  Plug 'Valloric/YouCompleteMe'

  " Interface
  " ---
  " airline is a better status line and a tab-bar for nvim.
  Plug 'bling/vim-airline'
  Plug 'vim-airline/vim-airline-themes'
  " colorschemes
  Plug 'https://github.com/frankier/neovim-colors-solarized-truecolor-only.git'
  Plug 'https://github.com/freeo/vim-kalisi.git'
  " fugitive
  Plug 'https://github.com/tpope/vim-fugitive.git'
  " nerdtree
  Plug 'https://github.com/scrooloose/nerdtree.git'

  " File Type
  " ---
  "  SaltStack
  Plug 'https://github.com/saltstack/salt-vim.git'
  "  YAML
  Plug 'avakhov/vim-yaml'

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
  set showcmd             " Show (partial) command in status line.
  set modeline            " Enable modeline.
  set number              " Show the line numbers on the left side.

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
  colorscheme kalisi

  " font
  let g:Guifont="Inconsolata-g for Powerline:g12"

  " remap terminal keys
  tnoremap <Esc> <C-\><C-n>
" }

" Plugin Settings {
  " Airline {
"    let g:airline_theme = 'serene'
    let g:airline_theme = 'kalisi'
    let g:airline_powerline_fonts = 1
    let airline#extensions#default#section_use_groupitems = 0
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

  " Nerdtree {
    silent! nmap <C-e> :NERDTreeToggle<CR> " nerdtree hotkeys
    "let NERDTreeQuitOnOpen=1 "auto close nerdtree
  " }
" }

" Helper Functions {
    " remove trailing whitespace
    fun! <SID>StripTrailingWhitespaces()
        let l = line(".")
        let c = col(".")
        %s/\s\+$//e
        call cursor(l, c)
    endfun
" }
" vim: noai:ts=4:sw=4
