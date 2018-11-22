call plug#begin('~/.local/share/nvim/plugged')

" Plugins {
" Lanauage Server
Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh',
    \ }

" Async completion framework
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'jamessan/vim-gnupg' " PGP file

" Fuzzy - file opener
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'

" Nerdtree
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'

" Source Control
Plug 'tpope/vim-fugitive' " Fugitive (git)
Plug 'airblade/vim-gitgutter' " Show git diff in vim

" Search
Plug 'albfan/ag.vim'

" Editing
Plug 'myusuf3/numbers.vim' " numbers.vim is a plugin for intelligently toggling line numbers
Plug 'scrooloose/nerdcommenter' " comment out code
Plug 'vim-scripts/restore_view.vim' " Restore view (cursor location and such)
" Pair parenthesis
Plug 'https://github.com/tpope/vim-unimpaired.git'
Plug 'https://github.com/jiangmiao/auto-pairs.git'
Plug 'https://github.com/tpope/vim-surround.git'
Plug 'https://github.com/godlygeek/tabular.git' " Table Formatting
Plug 'https://github.com/tpope/vim-obsession.git' " save sessions
Plug 'https://github.com/szw/vim-tags.git' "Tags
Plug 'majutsushi/tagbar' " Tagbar
Plug 'christianrondeau/vim-base64' " encode/decode base64 string

""  YouCompleteMe
"Plug 'Valloric/YouCompleteMe'
"" Undo tree
"Plug 'https://github.com/sjl/gundo.vim.git'
"
""Repeat any key mapping commands
"Plug 'https://github.com/tpope/vim-repeat.git'
"
""Search and replace
"Plug 'https://github.com/dkprice/vim-easygrep.git'
"
""Toggle list
"Plug 'https://github.com/milkypostman/vim-togglelist.git'
"
""Syntax check
"Plug 'https://github.com/scrooloose/syntastic.git'
"Plug 'https://github.com/neomake/neomake.git'
"

" Interface
" ---
" Airline statusbar
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Colors
Plug 'lifepillar/vim-solarized8'
Plug 'adlawson/vim-sorcerer'
Plug 'https://github.com/freeo/vim-kalisi.git'
Plug 'https://github.com/scwood/vim-hybrid.git'

"" numbers.vim is a plugin for intelligently toggling line numbers
"Plug 'myusuf3/numbers.vim'
" Choose window like tmux
Plug 't9md/vim-choosewin'
"" Tag
"Plug 'utags'
"" Tagbar
"Plug 'https://github.com/majutsushi/tagbar.git'
"
" File Type
" ---
"" Angular
"Plug 'burnettk/vim-angular'
"" JavaScript
"Plug 'pangloss/vim-javascript'
"Plug 'https://github.com/jelera/vim-javascript-syntax.git'
"Plug 'https://github.com/zheli/JavaScript-Indent.git' " better indentation
"Plug 'https://github.com/ternjs/tern_for_vim.git' " don't forget to run npm install inside plugged folder
"Plug 'https://github.com/othree/javascript-libraries-syntax.vim.git' " syntax for js libs
"" HTML
"Plug 'othree/html5.vim'
"" Python
"Plug 'https://github.com/klen/python-mode.git', {'branch': 'develop'}
""  SaltStack
"Plug 'https://github.com/saltstack/salt-vim.git'
Plug 'derekwyatt/vim-scala'
Plug 'hashivim/vim-terraform'
Plug 'avakhov/vim-yaml' "  YAML
Plug 'https://github.com/ryanoasis/vim-devicons.git' " devicons (must be the last one)
" }
call plug#end()

" Configuration {{

" General {
syntax enable " enable syntax support
set autoindent
set backspace=indent,eol,start      " Allow backspace over everything in insert mode.
set complete-=i
set encoding=utf8
set expandtab " On pressing tab, insert 4 spaces
set hlsearch " highlight all search matches
set ignorecase
set modeline            " Enable modeline.
set nrformats-=octal
set number              " Show the line numbers on the left side.
set shiftwidth=4 " when indenting with '>', use 4 spaces width
set showcmd             " Show (partial) command in status line.
set smartcase           " case insentive search if first letter is not capital
set softtabstop=4 " fill in the indentation gaps with 4 spaces
set tabstop=4 " show existing tab with 4 spaces width
set wildmenu " show autocomplete options
set wildmode=longest,list,full " set <tab> completion behavior
set updatetime=100 " set refresh interval to 100ms
set smarttab "???

"plugins and indentation for different filetype
filetype plugin indent on
autocmd FileType html setlocal tabstop=2 softtabstop=2 shiftwidth=2
autocmd FileType scss setlocal tabstop=2 softtabstop=2 shiftwidth=2
autocmd FileType javascript setlocal tabstop=2 softtabstop=2 shiftwidth=2
autocmd FileType scala setlocal foldmethod=indent foldlevel=1

" Enable Spell Checking
set spell

"wrap line that is longer than 100
set wrap
set textwidth=100
set formatoptions+=t
set wrapmargin=0
set linebreak
set colorcolumn=+1 "color text when length is over textwidth

" note trailing space at end of next line
set showbreak=>\ \ \

"set ttimeout
"set ttimeoutlen=100
"set mouse=r " keep copy/paste in iterm2
""  set mouse=a

"" Stupid shift key fixes
"if has("user_commands")
"    command! -bang -nargs=* -complete=file W w<bang> <args>
"    command! -bang -nargs=* -complete=file Wq wq<bang> <args>
"    command! -bang -nargs=* -complete=file WQ wq<bang> <args>
"    command! -bang -nargs=* -complete=file Edit edit<bang> <args>
"    command! -bang Wa wa<bang>
"    command! -bang WA wa<bang>
"    command! -bang Q q<bang>
"    command! -bang QA qa<bang>
"    command! -bang Qa qa<bang>
"endif

" cursor
let $NVIM_TUI_ENABLE_CURSOR_SHAPE=1
" cursor lines
au WinEnter * set cursorline cursorcolumn
au WinLeave * set nocursorline nocursorcolumn
augroup CursorLine
    au!
    au VimEnter,WinEnter,BufWinEnter * setlocal cursorline cursorcolumn
    au WinLeave * setlocal nocursorline nocursorcolumn
augroup END
set cursorline cursorcolumn



" Colorscheme
let $NVIM_TUI_ENABLE_TRUE_COLOR=1
set background=dark
colorscheme solarized8

" ignore list
set wildignore=*.o,*~,*.pyc

" key bindings
" Switch between absolute and relative line number
" nnoremap <F3> :NumbersToggle<CR>
" fzf
nnoremap <silent> <C-p> :Files<CR>
" choosewin
nmap - <Plug>(choosewin)
" switch window
nmap <C-w><C-j> <C-w><C-w>
"nmap <F8> :TagbarToggle<CR> " tagbar
" search current word
nnoremap <Leader>s :%s/\<<C-r><-C-w>\>/
" search current word in current folder with ag
nnoremap <Leader>ags :AgGroup <C-r><-C-w> .
" Open NerdTree
silent! nmap <C-e> :NERDTreeToggle<CR>
" LangaugeClient
nnoremap <silent> K :call LanguageClient#textDocument_hover()<CR>
nnoremap <silent> gd :call LanguageClient#textDocument_definition()<CR>
nnoremap <silent> grn :call LanguageClient#textDocument_rename()<CR>
nnoremap <F5> :call LanguageClient_contextMenu()<CR>
"" remap terminal keys
"tnoremap <Esc> <C-\><C-n>
"" numbers
"nnoremap <F3> :NumbersToggle<CR>
"" undo tree
"nnoremap <F5> :GundoToggle<CR>
" Gstatus toggle
nmap <F6> :ToggleGStatus<CR>
" Save file
nmap <F2> :update<CR>
vmap <F2> <Esc><F2>gv
imap <F2> <c-o><F2>
"" delete word in insert mode
"imap <C-w> <C-o>diw
" escape using jj
imap jj <Esc>
"" jump to tag with ctrl-]
"nnoremap <c-]> g<c-]>
"vnoremap <c-]> g<c-]>
"nnoremap g<c-]> <c-]>
"vnoremap g<c-]> <c-]>
"
"nnoremap <leader>gr :Ggr <cword><CR>
"nnoremap <leader>g :YcmCompleter GoToDefinitionElseDeclaration<CR>

"" Moving lines up and down with Alt-j and Alt-k
"" http://vim.wikia.com/wiki/Moving_lines_up_or_down
"" for Macs
"nnoremap ∆ :m .+1<CR>==
"nnoremap ˚ :m .-2<CR>==
"inoremap ∆ <Esc>:m .-2<CR>==gi
"inoremap ˚ <Esc>:m .+1<CR>==gi
"vnoremap ∆ :m '<-2<CR>gv=gv
"vnoremap ˚ :m '>+1<CR>gv=gv
"" for Win/Linux
"nnoremap <A-j> :m .+1<CR>==
"nnoremap <A-k> :m .-2<CR>==
"inoremap <A-j> <Esc>:m .+1<CR>==gi
"inoremap <A-k> <Esc>:m .-2<CR>==gi
"vnoremap <A-j> :m '>+1<CR>gv=gv
"vnoremap <A-k> :m '<-2<CR>gv=gv

" }} Configuration

" PluginSettings {{

let g:deoplete#enable_at_startup = 1 " deoplete autostart
let g:numbers_exclude = ['unite', 'tagbar', 'startify', 'gundo', 'vimshell', 'w3m', 'nerdtree'] " numbers
let g:choosewin_overlay_enable = 1 " choosewin
let g:fzf_nvim_statusline = 0 " disable fzf statusline overwriting
let g:terraform_align=1 "Allow vim-terraform to override your .vimrc indentation syntax
" restore_view.vim
set viewoptions=cursor,folds,slash,unix
let g:skipview_files = ['*\.vim']

" Airline {
set laststatus=2 " always show statusline
let g:airline_powerline_fonts = 1 " use powerline font
" Automatically displays all buffers when there's only one tab open
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme='papercolor'
" }

"{
" Language client-neovim
" Required for operations modifying multiple buffers like rename.
set hidden

let g:LanguageClient_serverCommands = {
    \ 'html': ['/Users/zhe/.nvm/versions/node/v8.10.0/bin/html-languageserver', '--stdio'],
    \ 'javascript': ['/Users/zhe/.nvm/versions/node/v8.10.0/bin/javascript-typescript-stdio'],
    \ 'scala': ['/Users/zhe/code/minatjanster/into/scalameta_lsp'],
    \ 'scss': ['/Users/zhe/.nvm/versions/node/v8.10.0/bin/css-languageserver', '--stdio']
    \ }

let g:LanguageClient_loggingFile = '/tmp/LanguageClient.log'
let g:LanguageClient_loggingLevel = 'INFO'
let g:LanguageClient_serverStderr = '/tmp/LanguageServer.log'
"}

"  search {
let g:ag_prg=" --vimgrep --exclude=\*.min.js" "ag search exclude files
" }

"}} PluginSettings

"" javscript-libraries-syntax {
"let g:used_javascript_libs = 'jquery,underscore,angularjs,angularui,angularuirouter,requirejs'
"" }
""
""
"" neomake {
"autocmd! BufWritePost, BufReadPre,FileReadPre * Neomake "run Neomake when open/write file
"" }
""
"" syntastic {
"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*
"
"let g:syntastic_always_populate_loc_list = 1
"let g:syntastic_auto_loc_list = 0
"let g:syntastic_check_on_open = 1
"let g:syntastic_check_on_wq = 0
"let g:syntastic_ignore_files = ['\.py$']
""for AngularJS
"let g:syntastic_html_tidy_ignore_errors=[
"  \"proprietary attribute",
"  \"trimming empty <",
"  \"unescaped &",
"  \"lacks \"action",
"  \"is not recognized!",
"  \"discarding unexpected"]
"" Disable inherited syntastic https://robots.thoughtbot.com/my-life-with-neovim
"let g:syntastic_mode_map = {
"  \ "mode": "passive",
"  \ "active_filetypes": [],
"  \ "passive_filetypes": [] }
"" }
"" neomake {
"let g:neomake_serialize = 1
"let g:neomake_serialize_aboetrt_on_error = 1
"" }
""
"" Undo tree {
"let g:gundo_right = 1
"" }
""
"" UltiSnips {
"let g:UltiSnipsExpandTrigger="<C-l>"
"let g:UltiSnipsJumpForwardTrigger="<C-j>"
"let g:UltiSnipsJumpBackwardTrigger="<C-k>"
"let g:UltiSnipsSnippetDirectories=['UltiSnips']
"
"" }
" Nerdtree {
let g:NERDTreeWinSize = 40 "nerdtree window width
let NERDTreeIgnore = ['\.pyc$']
let NERDTreeShowHidden=1
let g:NERDTreeUpdateOnWrite = 0 " issue: https://github.com/Xuyuanp/nerdtree-git-plugin/issues/4
let NERDTreeQuitOnOpen=1 "auto close nerdtree
" }

"" tagbar {
"let g:tagbar_width=40
"let g:tagbar_autoclose=0
"" }
"" YouCompleteMe {
"let g:ycm_key_list_select_completion = ['<C-j>']
"let g:ycm_key_list_previous_completion = ['<C-k>']
"let g:ycm_autoclose_preview_window_after_completion=1
"
"" Repeat mapped key commands
"silent! call repeat#set("\<Plug>MyWonderfulMap", v:count)
"" }

"" }

" Helper Commands/Functions {

"command -nargs=+ Ggr execute 'silent Ggrep!' <q-args> | cw | redraw!
"" remove trailing whitespace
"command! ClearQuickfixList cexpr []
"
function! ToggleGStatus()
    if buflisted(bufname('.git/index'))
        bd .git/index
    else
        Gstatus
    endif
endfunction
command! ToggleGStatus :call ToggleGStatus()

"fun! <SID>StripTrailingWhitespaces()
"    let l = line(".")
"    let c = col(".")
"    %s/\s\+$//e
"    call cursor(l, c)
"endfun

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
"  " auto remove trailling whitespace on save
"  autocmd filetype html,c,cpp,java,php,ruby,python,php,vimrc,javascript autocmd bufwritepre <buffer> :call <sid>StripTrailingWhitespaces()
  " auto close when only nerdtree is left
  autocmd WinEnter * call s:CloseIfOnlyNerdTreeLeft()
augroup end

" } Helper Commands/Functions

"vim: noai:ts=4:sw=4
