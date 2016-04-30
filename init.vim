call plug#begin('~/.config/nvim/plugged')

" Plugins {
" ctrl-p is a fuzzy file finder.
Plug 'kien/ctrlp.vim'
" save sessions
Plug 'https://github.com/tpope/vim-obsession.git'
"  YouCompleteMe
Plug 'Valloric/YouCompleteMe'

" Comments
Plug 'https://github.com/scrooloose/nerdcommenter.git'
" Pair parenthesis
Plug 'https://github.com/tpope/vim-unimpaired.git'
Plug 'https://github.com/jiangmiao/auto-pairs.git'

" Interface
" ---
" airline is a better status line and a tab-bar for nvim.
Plug 'bling/vim-airline', 'v0.8'
Plug 'vim-airline/vim-airline-themes'
" colorschemes
Plug 'https://github.com/frankier/neovim-colors-solarized-truecolor-only.git'
Plug 'https://github.com/freeo/vim-kalisi.git'
Plug 'https://github.com/easysid/mod8.vim.git'
" fugitive
Plug 'https://github.com/tpope/vim-fugitive.git'
" nerdtree
Plug 'https://github.com/scrooloose/nerdtree.git'
" numbers.vim is a plugin for intelligently toggling line numbers
Plug 'myusuf3/numbers.vim'

" File Type
" ---
" JavaScript
Plug 'pangloss/vim-javascript'
Plug 'https://github.com/ternjs/tern_for_vim.git' " don't forget to run npm install inside plugged folder

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
"  set mouse=a

" tabs
" show existing tab with 4 spaces width
set tabstop=4
" when indenting with '>', use 4 spaces width
set shiftwidth=4
" On pressing tab, insert 4 spaces
set expandtab
"set autoindent
set noautoindent        " I indent my code myself.
set nocindent           " I indent my code myself.
set smartindent         " Or I let the smartindent take care of it.

" Enable Spell Checking
set spell

set ttimeout
set ttimeoutlen=100
set mouse=r " keep copy/paste in iterm2

" color scheme
let $NVIM_TUI_ENABLE_TRUE_COLOR=1
set background=dark
colorscheme solarized
"  colorscheme kalisi

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

" CtrlP {
let g:ctrlp_working_path_mode = 0
" }

" Nerdtree {
silent! nmap <C-e> :NERDTreeToggle<CR> " nerdtree hotkeys
"let NERDTreeQuitOnOpen=1 "auto close nerdtree
" }

" numbers {
nnoremap <F3> :NumbersToggle<CR>
" }
" YouCompleteMe {
let g:ycm_key_list_select_completion = ['<C-j>']
let g:ycm_key_list_previous_completion = ['<C-k>']
let g:ycm_autoclose_preview_window_after_completion=1
nnoremap <leader>g :YcmCompleter GoToDefinitionElseDeclaration<CR>
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
