set t_Co=256
set nu
set expandtab
set tabstop=4
set shiftwidth=4
set hlsearch
set incsearch
set showcmd
set ruler
set cursorline
"set cursorcolumn
set ic
set smartindent
set laststatus=2

":filetype on
":filetype plugin on
":filetype indent on 

syntax on
colorscheme molokai


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" Vundle
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
" Plugin 'gmarik/Vundle.vim'

" examples ==>
" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
" Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'
" Git plugin not hosted on GitHub
" Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
" Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
" Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Avoid a name conflict with L9
" Plugin 'user/L9', {'name': 'newL9'}
" <== examples

Plugin 'Yggdroot/indentLine'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
"
"autocmd BufRead,BufNewFile *.ftl set filetype=html
autocmd BufRead,BufNewFile *.ftl set filetype=ftl

"statusline                                                                                                                                  
set statusline= 
set statusline+=%7*\(%n)                                  "buffernr  
set statusline+=%1*\ %<%F\                                "文件路径  
set statusline+=%2*\ %=%y\                                  "文件类型  
set statusline+=%3*\ %=%{''.(&fenc!=''?&fenc:&enc).''}      "编码1  
set statusline+=%3*\ %=%{(&bomb?\",BOM\":\"\")}\            "编码2  
set statusline+=%4*\ %=%{&ff}\                              "文件系统(dos/unix..)   
set statusline+=%5*\ %=%{&spelllang}\%{HighlightSearch()}\  "语言 & 是否高亮，H表示高亮?  
set statusline+=%8*\ %=\ row:%l/%L\ (%03p%%)\             "光标所在行号/总行数 (百分比)  
set statusline+=%9*\ col:%03c\                            "光标所在列  
set statusline+=%0*\ \ %m%r%w\ %P\ \                      "Modified? Read only? Top/bottom  
function! HighlightSearch()  
  if &hls  
      return 'H'  
  else  
      return ''  
  endif  
endfunction  
hi User1 ctermfg=77        ctermbg=235
hi User2 ctermfg=77        ctermbg=235
hi User3 ctermfg=white     ctermbg=100  
hi User4 ctermfg=11        ctermbg=95  
hi User5 ctermfg=darkred   ctermbg=77  
hi User7 ctermfg=white     ctermbg=darkred     cterm=bold  
hi User8 ctermfg=231       ctermbg=blue  
"hi User9 ctermfg=#ffffff  ctermbg=#810085  
hi User0 ctermfg=yellow  ctermbg=138  

