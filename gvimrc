set guioptions-=T " hide toolbar

colorscheme railscasts2

" set font based on OS
if has("gui_gtk2")
  set guifont=Meslo\ LG\ L\ DZ\ 11
elseif has("gui_macvim")
  set guifont=Meslo\ LG\ L\ DZ:h14
elseif has("gui_win32")
  set guifont=Consolas:h11
end
