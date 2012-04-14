" Run the current file with ruby
map <Leader>rr :call RunVimTmuxCommand("clear; ruby " . bufname("%"))<CR>

" Run the current file with python
map <Leader>rp :call RunVimTmuxCommand("clear; python" . bufname("%"))<CR>

" Run the current file with rspec
map <Leader>rb :call RunVimTmuxCommand("clear; rspec " . bufname("%"))<CR>

" Prompt for a command to run
map <Leader>rp :PromptVimTmuxCommand<CR>

" Run last command executed by RunVimTmuxCommand
map <Leader>rl :RunLastVimTmuxCommand<CR>

" Inspect runner pane
map <Leader>ri :InspectVimTmuxRunner<CR>

" Close all other tmux panes in current window
map <Leader>rx :CloseVimTmuxPanes<CR>

" Interrupt any command running in the runner pane
map <Leader>rs :InterruptVimTmuxRunner<CR>

let VimuxUseNearestPane = 1
