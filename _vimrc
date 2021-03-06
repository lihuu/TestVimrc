set nocompatible
set laststatus=2
syntax on
set nu
syntax enable
set ts=4
set shiftwidth=4
set expandtab
set background=dark
"colorscheme torte
colorscheme molokai
"set fdm=indent
"set sourcecode folding
set fdm=marker
set guifont=Consolas:h14
let $LANG='en'
set langmenu='en'
source $VIMRUNTIME/vimrc_example.vim
source $VIMRUNTIME/mswin.vim
source $VIMRUNTIME/delmenu.vim
source $VIMRUNTIME/menu.vim
behave mswin
set fileencodings=utf-8,chinese,latin-1,latin1
set encoding=utf-8
set nobackup
set noundofile


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
  if $VIMRUNTIME =~ ' '
    if &sh =~ '\<cmd'
      if empty(&shellxquote)
        let l:shxq_sav = ''
        set shellxquote&
      endif
      let cmd = '"' . $VIMRUNTIME . '\diff"'
    else
      let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
    endif
  else
    let cmd = $VIMRUNTIME . '\diff'
  endif
  silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3
  if exists('l:shxq_sav')
    let &shellxquote=l:shxq_sav
  endif
endfunction

filetype off
set rtp+=$VIM/vimfiles/bundle/Vundle.vim

call vundle#begin('$VIM/vimfiles/bundle/')
Plugin 'gmarik/Vundle.vim'
call vundle#end()
filetype plugin indent on

"vim-script的仓库
if has('gui_running')
    Bundle 'vim-multiple-cursors'
endif
if v:version < 704
    Bundle 'Pydiction'
    Bundle 'Python-mode-klen'
endif
Bundle 'EasyMotion'
Bundle 'FuzzyFinder'
Bundle 'Gundo'
Bundle 'JSON.vim'
Bundle 'JavaScript-Indent'
Bundle 'L9'
Bundle 'Mark'
Bundle 'PasteBin.vim'
Bundle 'VisIncr'
Bundle "scrooloose/nerdtree"
Bundle 'ack.vim'
Bundle 'gtags.vim'
Bundle 'gtk-vim-syntax'
Bundle 'jQuery'
Bundle 'matchit.zip'
Bundle 'xml.vim'
Bundle "mattn/emmet-vim"
Bundle "tpope/vim-surround"
Bundle "Lokaltog/vim-powerline"
Plugin 'pangloss/vim-javascript'
Plugin 'mxw/vim-jsx'

"Plugin
Plugin 'iamcco/markdown-preview.vim'

"nerdtree 按键映射
nmap <F5> :NERDTreeToggle<cr>

"Extral Configuration
let g:jsx_ext_required=0
"AA
