if version > 730
  let g:CommandTCancelMap=['<Esc>', '<C-c>']
end
let g:CommandTMaxHeight=10
let g:CommandTMinHeight=10
map <Leader><Leader> :CommandT<CR>
map <Leader>. :CommandTBuffer<CR>
map <Leader>/ :CommandTFlush<CR>:CommandT<CR>
