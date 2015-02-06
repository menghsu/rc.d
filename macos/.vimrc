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

filetype on
filetype plugin on
filetype indent on 

syntax on
colorscheme molokai


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

