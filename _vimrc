" Test vimrc file
set nocompatible
source $VIMRUNTIME/vimrc_example.vim
source $VIMRUNTIME/mswin.vim
behave mswin

set diffexpr=MyDiff()
function MyDiff()
  let opt = '-a --binary '
  if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
  if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
  let arg1 = v:fname_in
  if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
  let arg2 = v:fname_new
  if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
  let arg3 = v:fname_out
  if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
  let eq = ''
  if $VIMRUNTIME =~ ' '
    if &sh =~ '\<cmd'
      let cmd = '""' . $VIMRUNTIME . '\diff"'
      let eq = '"'
    else
      let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
    endif
  else
    let cmd = $VIMRUNTIME . '\diff'
  endif
  silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3 . eq
endfunction

" jms' settings.. to use git & pathogen
filetype off
call pathogen#runtime_append_all_bundles()
call pathogen#helptags()


" Uncomment below to prevent 'tilde backup files' (eg. myfile.txt~) from being created
"set nobackup

" Uncomment below to cause 'tilde backup files' to be created in a different dir so as not to clutter up the current file's directory (probably a better idea than disabling them altogether)
set backupdir=R:\TEMP

" Uncomment below to disable 'swap files' (eg. .myfile.txt.swp) from being created
set noswapfile



" Python Code Folding
set foldmethod=indent
set foldlevel=1

" set foldlevelstart=99

" javascript folding
" let javaScript_fold=1
au FileType javascript call JavaScriptFold()


" Moving Between splited windows
map <c-h> <c-w>h
map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-l> <c-w>l

let mapleader = ","


" Basic settings
colorscheme vividchalk

syntax enable
filetype on                 " try to detect filetypes
filetype plugin on   " enable loading indent file for file type
filetype indent on   " enable loading indent file for file type
let g:html_indent_inctags = "html,head,body,tbody"

set number
set tabstop=4
set shiftwidth=4
set expandtab		" Insert spaces when hitting TAB
set autoindent		" Align the new line indent with the previous line
set cindent
set laststatus=2
set smartcase
set incsearch
set hlsearch
set showmatch
set ruler
set viminfo+=n$VIM/_viminfo
set noerrorbells
set showcmd
set mouse=a
set history=100
set undolevels=1000

" save and run python using short key..
map <leader>r :w<CR>:!python %<CR>

" color..
if has('gui_running')
    set background=light
else
    set background=dark
endif

" let g:solarized_termtrans=1
" let g:solarized_termcolors=256
" let g:solarized_contrast="high"
" let g:solarized_visibility="high"
" colorscheme solarized

" autocmd FileType html,xhtml,xml
" source vimfiles/bundle/closetag/plugin/closetag.vim

