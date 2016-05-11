call plug#begin('~/.config/nvim/plugged')

" Plugins {
" ctrl-p is a fuzzy file finder.
Plug 'https://github.com/ctrlpvim/ctrlp.vim.git'
" save sessions
Plug 'https://github.com/tpope/vim-obsession.git'
"  YouCompleteMe
Plug 'Valloric/YouCompleteMe'

" Comments
Plug 'https://github.com/scrooloose/nerdcommenter.git'
" Pair parenthesis
Plug 'https://github.com/tpope/vim-unimpaired.git'
Plug 'https://github.com/jiangmiao/auto-pairs.git'

"Ag search
Plug 'rking/ag.vim'
Plug 'https://github.com/Chun-Yang/vim-action-ag.git'

"Tags
Plug 'https://github.com/szw/vim-tags.git'

" Interface
" ---
" airline is a better status line and a tab-bar for nvim.
Plug 'bling/vim-airline', 'v0.8'
Plug 'vim-airline/vim-airline-themes'
" colorschemes
Plug 'https://github.com/frankier/neovim-colors-solarized-truecolor-only.git'
Plug 'https://github.com/freeo/vim-kalisi.git'
Plug 'https://github.com/easysid/mod8.vim.git'
Plug 'mhartington/oceanic-next'
" fugitive
Plug 'https://github.com/tpope/vim-fugitive.git'
" nerdtree
Plug 'https://github.com/scrooloose/nerdtree.git'
Plug 'Xuyuanp/nerdtree-git-plugin'
" numbers.vim is a plugin for intelligently toggling line numbers
Plug 'myusuf3/numbers.vim'
" Choose window like tmux
Plug 'https://github.com/t9md/vim-choosewin.git'
" Tag
Plug 'utags'
" Tagbar
Plug 'https://github.com/majutsushi/tagbar.git'

" File Type
" ---
" Angular
Plug 'burnettk/vim-angular'
" JavaScript
"Plug 'pangloss/vim-javascript'
Plug 'https://github.com/jelera/vim-javascript-syntax.git'
Plug 'https://github.com/zheli/JavaScript-Indent.git' " better indentation
Plug 'https://github.com/ternjs/tern_for_vim.git' " don't forget to run npm install inside plugged folder
" HTML
Plug 'othree/html5.vim'
" Python
Plug 'https://github.com/klen/python-mode.git'
"  SaltStack
Plug 'https://github.com/saltstack/salt-vim.git'
"  YAML
Plug 'avakhov/vim-yaml'
" devicons (must be the last one)
Plug 'https://github.com/ryanoasis/vim-devicons.git'
"
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
set showcmd             " Show (partial) command in status line.
set modeline            " Enable modeline.
set number              " Show the line numbers on the left side.
set encoding=utf8

" tabs
"set smarttab
" show existing tab with 4 spaces width
set tabstop=4
" when indenting with '>', use 4 spaces width
set shiftwidth=4
" On pressing tab, insert 4 spaces
set expandtab
set autoindent
"set noautoindent        " I indent my code myself.
"set nocindent           " I indent my code myself.
"set smartindent         " Generally, smartindent shouldn't be used at all.
"html
"autocmd FileType html set tabstop=2|set shiftwidth=2
"javascript
autocmd FileType javscript set tabstop=4|set shiftwidth=4

" Enable Spell Checking
set spell

"wrap line that is longer than 100
set wrap
set textwidth=100
set formatoptions+=t
set wrapmargin=0
set linebreak

"color text when length is over 100
set colorcolumn=+1

" note trailing space at end of next line
set showbreak=>\ \ \

set ttimeout
set ttimeoutlen=100
set mouse=r " keep copy/paste in iterm2
"  set mouse=a

" cursor
let $NVIM_TUI_ENABLE_CURSOR_SHAPE=1

" color scheme
let $NVIM_TUI_ENABLE_TRUE_COLOR=1
set background=dark
"colorscheme solarized
colorscheme kalisi

" font
let g:Guifont="Inconsolata-g for Powerline:g12"

" key bindings
 " quickfix window
 map <F6> :copen<CR>
 " choosewin
 nmap <Leader>=  <Plug>(choosewin)
 " switch window
 nmap <C-w><C-j> <C-w><C-w>
 " tagbar
nmap <F8> :TagbarToggle<CR>
 " search current word
 nnoremap <Leader>s :%s/\<<C-r><-C-w>\>/
 " search current word
 nnoremap <Leader>ag :Ag -inr '<C-r><-C-w>'<CR>
 " remap terminal keys
 tnoremap <Esc> <C-\><C-n>
" numbers
nnoremap <F3> :NumbersToggle<CR>
" }

" Plugin Settings {
" Airline {
"    let g:airline_theme = 'serene'
let g:airline_theme = 'kalisi'
let g:airline_powerline_fonts = 1
let airline#extensions#default#section_use_groupitems = 0
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t'
"let g:airline#extensions#tabline#left_sep = ' '
"let g:airline#extensions#tabline#left_alt_sep = '|'
"let g:airline#extensions#tabline#right_sep = ' '
"let g:airline#extensions#tabline#right_alt_sep = '|'
"let g:airline_left_sep = ' '
"let g:airline_left_alt_sep = '|'
"let g:airline_right_sep = ' '
"let g:airline_right_alt_sep = '|'
" }
"
" angular settings {
let g:angular_filename_convention = 'camelcased'
" }
" choosewin {
let g:choosewin_overlay_enable = 1
" }
"
" jsctags shortcut key {
nnoremap <leader>jt :! find . -type f -iregex \".*\.js$\" -not -path \"./node_modules/*\" -exec jsctags {} -f \; \| sed '/^$/d' \| sort > tags<CR>
" }

" CtrlP {
let g:ctrlp_working_path_mode = 'ra'
nnoremap <leader>f :CtrlP<CR>
nnoremap <leader>b :CtrlPBuffer<CR>
" }

" Nerdtree {
silent! nmap <C-e> :NERDTreeToggle<CR> " nerdtree hotkeys
let g:NERDTreeWinSize = 40 "nerdtree window width
"let NERDTreeQuitOnOpen=1 "auto close nerdtree
" }
" pymode settings
let g:pymode_options_max_line_length = 100
let g:pymode_lint_options_pep8 = {'max_line_length': g:pymode_options_max_line_length}
"turn off pymode doc
"let g:pymode_doc = 0
set completeopt=menu
let g:pymode_rope = 1
let g:pymode_rope_completion = 0
let g:pymode_rope_rename_bind='<C-c>rr'
" }
" tagbar {
let g:tagbar_width=40
let g:tagbar_autoclose=1
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

" Close all open buffers on entering a window if the only
" buffer that's left is the NERDTree buffer
function! s:CloseIfOnlyNerdTreeLeft()
  if exists("t:NERDTreeBufName")
    if bufwinnr(t:NERDTreeBufName) != -1
      if winnr("$") == 1
        q
      endif
    endif
  endif
endfunction

augroup vimrc_autocmd
  autocmd!
  " auto remove trailling whitespace on save
  autocmd filetype html,c,cpp,java,php,ruby,python,php,vimrc,javascript autocmd bufwritepre <buffer> :call <sid>StripTrailingWhitespaces()
  " auto close when only nerdtree is left
  autocmd WinEnter * call s:CloseIfOnlyNerdTreeLeft()
augroup end

" cursor lines
"au WinLeave * set nocursorline nocursorcolumn
"au WinEnter * set cursorline cursorcolumn
augroup CursorLine
    au!
    au VimEnter,WinEnter,BufWinEnter * setlocal cursorline cursorcolumn
    au WinLeave * setlocal nocursorline nocursorcolumn
augroup END
set cursorline cursorcolumn

""highlight trailing whitespace
:hi ExtraWhitespace ctermbg=red guibg=red
call matchadd('ExtraWhitespace', '\s\+$', 11)

" }
" abbreviation use 'abbv'<space> to trigger {
iab ipdb import ipdb; ipdb.set_trace()
" }
" vim: noai:ts=4:sw=4
