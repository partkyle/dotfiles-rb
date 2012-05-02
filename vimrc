""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" pathogen config
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
call pathogen#infect()
call pathogen#helptags()

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" basic settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let mapleader=","
" bye, bye, vi
set nocompatible
" line numbers
set number
set ruler
syntax on
set encoding=utf-8
" Whitespace stuff
set nowrap
" tab settings
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
" show trailing spaces
set list listchars=tab:\ \ ,trail:·
" allow backspacing over everything in insert mode
set backspace=indent,eol,start
" Status bar
set laststatus=2
" Searching
set hlsearch
" Clear the search buffer when hitting return
nnoremap <CR> :nohlsearch<cr>
set incsearch
set ignorecase
set smartcase
" Tab completion
set wildmode=list:longest,list:full
set wildignore+=*.o,*.obj,.git,*.rbc,*.class,.svn,vendor/gems/*
" Automatically read changed files
set autoread
" unix filetypes
set ff=unix

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" if the terminal is in solarized mode
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" default to solarized light
set bg=light
" set the special diffmode
let g:solarized_diffmode="high"
" set the colorscheme
colorscheme solarized

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Remember last location in file
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if has("autocmd")
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
        \| exe "normal g'\"" | endif
endif

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" function to automatically wrap long lines
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function s:setupWrapping()
  set wrap
  set wrapmargin=2
  set textwidth=72
endfunction

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Thorfile, Rakefile, Vagrantfile and Gemfile are Ruby
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
au BufRead,BufNewFile {Gemfile,Rakefile,Vagrantfile,Thorfile,config.ru}    set ft=ruby

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" add json syntax highlighting
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
au BufNewFile,BufRead *.json set ft=javascript

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" text files have automatic wrapping
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
au BufRead,BufNewFile *.txt call s:setupWrapping()

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" load the plugin and indent settings for the detected filetype
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
filetype plugin indent on

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Opens an edit command with the path of the currently edited file filled in
" Normal mode: <Leader>e
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map <Leader>e :e <C-R>=expand("%:p:h") . "/" <CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Opens a tab edit command with the path of the currently edited file filled in
" Normal mode: <Leader>t
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map <Leader>te :tabe <C-R>=expand("%:p:h") . "/" <CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Inserts the path of the currently edited file into a command
" Command mode: Ctrl+P
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
cmap <C-P> <C-R>=expand("%:p:h") . "/" <CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Unimpaired configuration
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Bubble single lines
nmap <C-Up> [e
nmap <C-Down> ]e
nmap <C-k> [e
nmap <C-j> ]e
" Bubble multiple lines
vmap <C-Up> [egv
vmap <C-Down> ]egv
vmap <C-k> [egv
vmap <C-j> ]egv

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" gist-vim defaults
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if has("mac")
  let g:gist_clip_command = 'pbcopy'
elseif has("unix")
  let g:gist_clip_command = 'xclip -selection clipboard'
endif
let g:gist_detect_filetype = 1
let g:gist_open_browser_after_post = 1


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Directories for swp files
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set backupdir=~/.vim/backup
set directory=~/.vim/backup

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Directory for undo tracking
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
try
  set undodir=~/.vim/undo
  set undofile
  set undolevels=1000  "maximum number of changes that can be undone
  set undoreload=10000 "maximum number lines to save for undo on a buffer reload
catch
endtry

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" % to bounce from do to end etc.
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
runtime! macros/matchit.vim

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Show (partial) command in the status line
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set showcmd

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" custom key mappings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" I can't believe that :W does nothing
cnoreabbrev W w
cnoreabbrev Q q
cnoreabbrev Wq wq
cnoreabbrev WQ wq
" jj to escape in insert mode.
inoremap jj <Esc>
" remap the quit command
nmap QQ ZQ
" ,f to search project
nmap <leader>f :Ack ""<Left>
" git (fugitive) commands
nmap <leader>gs :Gstatus<CR><C-w>J
nmap <leader>gd :Gdiff<CR>
" better moving in insert mode
imap <C-j> <C-o>j
imap <C-k> <C-o>k
" Better split movement
nmap <Space> <C-w>w
nmap <S-Space> <C-w>W

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" MacVIM shift+arrow-keys behavior (required in .vimrc)
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let macvim_hig_shift_movement = 1

" Automatically resize splits when resizing MacVim window
if has("gui_running")
  autocmd VimResized * wincmd =
endif

" python only setup
if !exists("autocommands_loaded")
  let autocommands_loaded = 1
  autocmd BufRead,BufNewFile,FileReadPost *.py source ~/.vim/lang/python
endif
