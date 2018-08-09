" Use Vim settings, rather than Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

" Make backspace behave in a sane manner.
set backspace=indent,eol,start

" Switch syntax highlighting on
syntax on

" Enable file type detection and do language-dependent indenting.
filetype plugin indent on

" display line numbers
set number

" indentation
set history=500
set expandtab " always use spaces instead of tab characters
set tabstop=2 
set shiftwidth=2
set softtabstop=2
set autoindent 

" white spaces, tab stops and line breaks
set list
set listchars=tab:→\ 
set listchars+=trail:·
set listchars+=space:·
highlight NonText guifg=#cccccc
highlight SpecialKey guifg=#cccccc

" spelling
set ignorecase smartcase
set spelllang=en_gb
syntax spell toplevel

" statusbar
set statusline=%F%m%r%h%w\ "fullpath and status modified sign
set statusline+=\ %y "filetype
set statusline+=\ %{fugitive#statusline()} "push everything below it to the right hand side
set statusline+=%=
set statusline+=\%l

" highlight parenthesis
highlight MatchParen cterm=none ctermbg=none ctermfg=blue

" clean up trailing whitespaces
function! <SID>StripTrailingWhitespaces()
  " Preparation: save last search, and cursor position.
  let _s=@/
  let l = line(".")
  let c = col(".")
  " Do the business:
  %s/\s\+$//e
  " Clean up: restore previous search history, and cursor position
  let @/=_s
  call cursor(l, c)
endfunction

" on save automatically remove trailing whitespaces from these file types
autocmd BufWritePre *.js,*.jsx,*.php,*.py :call <SID>StripTrailingWhitespaces()

