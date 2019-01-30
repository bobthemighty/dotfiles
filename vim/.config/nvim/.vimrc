" {{{ General
set autoread " auto read when a file is changed
set nocompatible

" No annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500

set encoding=utf8
set ffs=unix,dos,mac
let g:user_zen_mode='a'
set tags=.git/tags,./tags,tags;
" }}}
"
" Colours {{{
syntax enable
filetype indent on      " load filetype-specific indent files
filetype plugin on      " load filetype-specific plugins
match Todo /\s\+$/      " set trailing spaces to have the 'todo' stylng
" }}}
"

"{{{ Tabs + Spaces
set tabstop=4
set softtabstop=4
set expandtab
" }}}

" {{{ Display opts
set number              " show line numbers
set relativenumber
set showcmd             " show command in bottom bar
set cursorline          " highlight current line
set cursorcolumn        " highlight current column
set wildmenu            " visual autocomplete for command menu
set ruler
set hid                 " hide abandoned buffers
set wildignore=*.o,*~,*.pyc " ignore build outputs
set lazyredraw          " redraw only when we need to.
set showmatch           " highlight matching [{()}]
:set so=999             " Set scrolloff to 999, centering the cursor

match ErrorMsg '\%>120v.\='
match ErrorMsg '\s\+$'
" }}}

" {{{ Search options
set incsearch           " search as characters are entered
set hlsearch            " highlight matches
set smartcase
" turn off search highlight
nnoremap <leader><space> :nohlsearch<CR>
" }}}

" {{{ Folding
set foldenable          " enable folding
set foldlevelstart=10   " open most folds by default
set foldnestmax=10      " 10 nested fold max
" space open/closes folds
nnoremap <space> za
set foldmethod=indent   " fold based on indent level
set modelines=1
" }}}

" {{{ Motion
" move vertically by visual line
nnoremap j gj
nnoremap k gk
" move to beginning/end of line
nnoremap B ^
nnoremap E $
" $/^ doesn't do anything
nnoremap $ <nop>
nnoremap ^ <nop>
" highlight last inserted text
nnoremap gV `[v`]
" Smart way to move between windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" Bind backspace and enter to paragraph motions
nnoremap <BS> {
vnoremap <BS> {
onoremap <BS> {

nnoremap <expr> <CR> empty(&buftype) ? '}' : '<CR>'
onoremap <expr> <CR> empty(&buftype) ? '}' : '<CR>'

vnoremap <CR> }

" }}}

" {{{ Leader
let mapleader=","       " leader is comma
" jk is escape
nnoremap jk <esc>
" toggle gundo
" edit vimrc/zshrc and load vimrc bindings
nnoremap <leader>ev :vsp $MYVIMRC<CR>
nnoremap <leader>ez :vsp ~/.zshrc<CR>
nnoremap <leader>sv :source $MYVIMRC<CR>

" save session
nnoremap <leader>s :mksession<CR>
" }}}


" {{{ Plugs
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.local/share/nvim/plugged')
"
"{{{
Plug 'tpope/vim-fugitive'
"}}}

" {{{ Nord Colour Scheme
Plug 'arcticicestudio/nord-vim'
let g:nord_italic = 1
let g:nord_underline = 1
let g:nord_italic_comments = 1
let g:nord_uniform_status_lines = 1
let g:nord_comment_brightness = 18
let g:nord_cursor_line_number_background = 1

colorscheme nord
"}}}
"
" {{{ Nerdtree
Plug 'scrooloose/NerdTree'
map <leader>nn :NERDTreeToggle<cr>
map <leader>nb :NERDTreeFromBookmark<Space>
map <leader>nf :NERDTreeFind<cr>
nmap <leader>nc :NERDTreeCWD<CR>
" }}}
"
" {{{ CtrlP
Plug 'ctrlpvim/ctrlp.vim'
let g:ctrlp_match_window = 'bottom,order:ttb'
let g:ctrlp_switch_buffer = 0
let g:ctrlp_working_path_mode = 0
let g:ctrlp_user_command = 'ag %s -l --nocolor --hidden -g ""'
let g:ctrlp_custom_ignore = 'node_modules\|^\.DS_Store\|^\.git\|^\.coffee'
nnoremap ? :GFiles<CR>
" }}}

" {{{ Ack/ag
command! -bang -nargs=* Rg
      \ call fzf#vim#grep(
      \   'rg --column --line-number --no-heading --color=always --ignore-case '.shellescape(<q-args>), 1,
      \   <bang>0 ? fzf#vim#with_preview('up:60%')
      \           : fzf#vim#with_preview('right:50%:hidden', '?'),
      \   <bang>0)

nnoremap <leader>a :Rg<Space>

" }}}

" {{{ Easymotion
Plug 'easymotion/vim-easymotion'
nmap  <Leader>gw <Plug>(easymotion-bd-w)
nmap  <Leader>L <Plug>(easymotion-bd-jk)

let g:EasyMotion_smartcase = 1
" }}}

" {{{ lightline
 Plug 'itchyny/lightline.vim'
"}}}

" {{{ Vimwiki
Plug 'vimwiki/vimwiki'
Plug 'powerman/vim-plugin-AnsiEsc'
Plug 'farseer90718/vim-taskwarrior'
Plug 'tbabej/taskwiki'
"}}}

" {{{ Goyo
Plug 'junegunn/goyo.vim'
nmap <leader>z :Goyo<CR>
"}}}
"
"" {{{ Draw It
Plug 'vim-scripts/DrawIt'
"}}}
"

" {{{ fzf
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
set rtp+=/usr/local/opt/fzf

let g:fzf_tags_command = 'ctags --extra=+f -R'
let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }

nmap <Leader>t :Files<CR>
nmap <Leader>b :Buffers<CR>
nmap <Leader>r :Tags<CR>
nnoremap <leader>d :call fzf#vim#tags(expand('<cword>'), {'options': '--exact --select-1 --exit-0'})<CR>

" }}}

" {{{
" GTD
" }}}
Plug 'phb1/gtd.vim'
:filetype plugin on
:let g:gtd#dir = '~/notes'
let g:gtd#default_action = 'inbox'
let g:gtd#folder_command = 'ranger'
let g:gtd#folding = 1
let g:gtd#review = [
\ '!todo @laptop',
\ '!todo @work',
\ '!inbox @work',
\ '!waiting @work',
\ '!inbox @laptop',
\ '@music',
\ '@to-read',
\ ]

" {{{ Tagbar
Plug 'majutsushi/tagbar'
nmap <leader>st :TagbarToggle<CR>
" }}}
"
"{{{ vim-go
Plug 'fatih/vim-go'
"}}}

" {{{ Calendar
Plug 'itchyny/calendar.vim'
let g:calendar_google_calendar = 1
let g:calendar_google_task = 1
"}}}

" {{{ Gundo
Plug 'simnalamburt/vim-mundo'
nnoremap <leader>u :MundoToggle<CR>
set undofile
set undodir=~/.vim/undo
" }}}

" {{{ Language Server
Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh',
    \ }
let g:LanguageClient_autoStart = 1
let g:LanguageClient_serverCommands = {
    \ 'rust': ['~/.cargo/bin/rustup', 'run', 'stable', 'rls'],
    \ 'javascript': ['/usr/local/bin/javascript-typescript-stdio'],
    \ 'javascript.jsx': ['tcp://127.0.0.1:2089'],
    \ 'python': ['/usr/bin/pyls'],
    \ }
nnoremap <F5> :call LanguageClient_contextMenu()<CR>

let g:LanguageClient_loggingFile =  expand('~/.local/share/nvim/LanguageClient.log')
let g:LanguageClient_serverStderr = expand('~/.local/share/nvim/LanguageServer.log')
let g:LanguageClient_loggingLevel = 'DEBUG'

" }}}

" {{{ ncm2
Plug 'ncm2/ncm2'
Plug 'roxma/nvim-yarp'
Plug 'ncm2/ncm2-ultisnips'
Plug 'SirVer/ultisnips'

augroup ncm2
  au!
  autocmd BufEnter * call ncm2#enable_for_buffer()
  au User Ncm2PopupOpen set completeopt=noinsert,menuone,noselect
  au User Ncm2PopupClose set completeopt=menuone
augroup END

" parameter expansion for selected entry via Enter
inoremap <silent> <expr> <CR> (pumvisible() ? ncm2_ultisnips#expand_or("\<CR>", 'n') : "\<CR>")

" cycle through completion entries with tab/shift+tab
inoremap <expr> <TAB> pumvisible() ? "\<c-n>" : "\<TAB>"
inoremap <expr> <s-tab> pumvisible() ? "\<c-p>" : "\<TAB>"
" }}}

" }}}


" {{{ Backup
set backup
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set backupskip=/tmp/*,/private/tmp/*
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set writebackup
"  }}}

" {{{ Ale
Plug 'w0rp/ale'
let g:ale_linters = {
\   'javascript': ['eslint'],
\}
let g:ale_fixers = {
\        'python': [
\           'black',
\           'add_blank_lines_for_python_control_statements',
\           'isort',
\           'yapf'
\           ],
\        'javascript': ['prettier', 'remove_trailing_lines'],
\        'rust': ['rustfmt']
\}
nmap <Leader>f :ALEFix<CR>
" }}}

" {{{ Filetypes

" {{{ Scala
Plug 'derekwyatt/vim-scala'
" }}}

" {{{ Golang
autocmd FileType go nmap <buffer> <leader>ga <plug>(go-alternate-edit)
autocmd FileType go nmap <buffer> <leader>gv <plug>(go-alternate-vertical)
autocmd FileType go nmap <buffer> <leader>gt <plug>(go-test)
autocmd FileType go nmap <buffer> <leader>f <plug>(go-fmt)
autocmd FileType go nmap <buffer> <leader>gf <plug>(go-build)
let g:go_metalinter_autosave = 1
"
" }}}
call plug#end()

au BufNewFile,BufRead *.mjs set filetype=javascript

" {{{ Python
Plug 'jmcantrell/vim-virtualenv'

let python_highlight_all = 1
au FileType python syn keyword pythonDecorator True None False self

au BufNewFile,BufRead *.jinja set syntax=htmljinja
au BufNewFile,BufRead *.mako set ft=mako

au FileType python map <buffer> F :set foldmethod=indent<cr>

au FileType python inoremap <buffer> $r return
au FileType python inoremap <buffer> $i import
au FileType python inoremap <buffer> $p print
au FileType python inoremap <buffer> $f #--- <esc>a
au FileType python map <buffer> <leader>1 /class
au FileType python map <buffer> <leader>2 /def
au FileType python map <buffer> <leader>C ?class
au FileType python map <buffer> <leader>D ?def
au FileType python set cindent
au FileType python set cinkeys-=0#
au FileType python set indentkeys-=0#
" }}}

" {{{ yml section
au FileType yaml setl tabstop=2
au FileType yaml setl shiftwidth=2
" }}}"

" {{{ JavaScript section
au FileType javascript call JavaScriptFold()
au FileType javascript setl tabstop=2
au FileType javascript setl shiftwidth=2
au FileType javascript setl fen
au FileType javascript setl nocindent

au FileType javascript imap <c-t> $log();<esc>hi
au FileType javascript imap <c-a> alert();<esc>hi

au FileType javascript inoremap <buffer> $r return
au FileType javascript inoremap <buffer> $f //--- PH<esc>FP2xi

au BufWritePre *.js %s/\s\+$//e
function! JavaScriptFold()
    setl foldmethod=syntax
    setl foldlevelstart=1
    syn region foldBraces start=/{/ end=/}/ transparent fold keepend extend

    function! FoldText()
        return substitute(getline(v:foldstart), '{.*', '{...}', '')
    endfunction
    setl foldtext=FoldText()
endfunction
" }}}

" {{{  CoffeeScript section
"""""""""""""""""""""""""""""""
function! CoffeeScriptFold()
    setl foldmethod=indent
    setl foldlevelstart=1
endfunction
au FileType coffee call CoffeeScriptFold()

au FileType gitcommit call setpos('.', [0, 1, 1, 0])
 "}}}
" }}}
" vim:foldmethod=marker:foldlevel=0
"
imap jk <esc>
