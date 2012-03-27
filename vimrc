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

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" if the terminal is in solarized mode
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if $COLORSCHEME == 'solarized'
  " default to solarized light
  if $SOLARIZED_LIGHT == 'true'
    set bg=light
  else
    set bg=dark
  end
  " add a toggle function
  call togglebg#map("<F5>")
  " set the special diffmode
  let g:solarized_diffmode="high"
  " set the colorscheme
  colorscheme solarized
end

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
" md, markdown, and mk are markdown and define buffer-local preview
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
au BufRead,BufNewFile *.{md,markdown,mdown,mkd,mkdn} call s:setupMarkup()

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
" enable the mouse in terminal mode
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if has("mouse")
  set mouse=a
  set ttymouse=xterm2
endif

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
" Command-T configuration
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if version > 730
  let g:CommandTCancelMap=['<Esc>', '<C-c>']
end
let g:CommandTMaxHeight=10
let g:CommandTMinHeight=10
map <Leader><Leader> :CommandT<CR>
map <Leader>. :CommandTBuffer<CR>
map <Leader>/ :CommandTFlush<CR>:CommandT<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ruby specific CommandT settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map <leader>gr :topleft :split config/routes.rb<cr>
function! ShowRoutes()
  " Requires 'scratch' plugin
  :topleft 100 :split __Routes__
  " Make sure Vim doesn't write __Routes__ as a file
  :set buftype=nofile
  " Delete everything
  :normal 1GdG
  " Put routes output in buffer
  :0r! rake -s routes
  " Size window to number of lines (1 plus rake output length)
  :exec ":normal " . line("$") . _ "
  " Move cursor to bottom
  :normal 1GG
  " Delete empty trailing line
  :normal dd
endfunction

map <leader>rr :call ShowRoutes()<cr>
map <leader>rv :CommandT app/views<cr>
map <leader>rc :CommandT app/controllers<cr>
map <leader>rm :CommandT app/models<cr>
map <leader>rh :CommandT app/helpers<cr>
map <leader>rj :CommandT app/assets/javascripts<cr>
map <leader>rs :CommandT app/assets/stylesheets<cr>
map <leader>rl :CommandT lib<cr>
map <leader>rp :CommandT public<cr>
map <leader>rf :CommandT features<cr>
map <leader>rt :CommandT spec<cr>
map <leader>rg :topleft 100 :split Gemfile<cr>
map <leader>rt :CommandTTag<cr>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" MacVIM shift+arrow-keys behavior (required in .vimrc)
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let macvim_hig_shift_movement = 1

" Automatically resize splits when resizing MacVim window
if has("gui_running")
  autocmd VimResized * wincmd =
endif

