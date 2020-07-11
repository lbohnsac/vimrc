set ruler                                   " short ru
set list
set cmdheight=1
set number                                  " short nu
set autoindent                              " short ai
set expandtab                               " short et
set tabstop=2                               " short ts
set softtabstop=2                           " short sts
set shiftwidth=2                            " short sw
color elflord
" Sets status line
set laststatus=2
set statusline= 
set statusline+=%F
set statusline+= 
set statusline+=%r
set statusline+= 
set statusline+=%m
set statusline+= 
set statusline+=%{&endofline?'':'[noeol]'}
set statusline+= 
set statusline+=%y
set statusline+= 
set statusline+=%{strlen(&fenc)?&fenc:'none'}
set statusline+= 
" Enables cursor line position tracking
set cursorline                              " short cul
" Removes the underline causes by enabling cursorline:
highlight clear CursorLine
" Sets the line numbering colour
highlight LineNr ctermfg=8
" Sets the current line number colour
highlight CursorLineNr cterm=bold ctermbg=NONE ctermfg=46
" Sets the background colour of the curtrent line
highlight CursorLine cterm=NONE ctermbg=234 cterm=NONE
" Sets the list chars
" shift+ctrl+u + 00ac + space ¬
" shift+ctrl+u + 2023 + space ‣
" shift+ctrl+u + 00a0 + space  
" shift+ctrl+u + 00b7 + space ·
set listchars=eol:¬,tab:‣ ,trail:·
" Add the cursorcolumn for YAML files
autocmd FileType yaml setlocal cursorcolumn " short cuc
" Sets the cursorcolumn line colour -> switch on with -> :se cuc
highlight CursorColumn ctermbg=234
" Remove all trailing whitespaces while saving
autocmd BufWritePre * %s/\s\+$//e
