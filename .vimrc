set ruler                                   " short ru
set list
set paste
set cmdheight=1
set number                                  " short nu
set autoindent                              " short ai
set expandtab                               " short et
set tabstop=2                               " short ts
set softtabstop=2                           " short sts
set shiftwidth=2                            " short sw
set scrolloff=999                           " short so
" The encoding displayed
set encoding=utf-8
" The encoding written to file
set fileencoding=utf-8
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
" keep swap files out of the way (dir has to exist!)
if isdirectory($HOME . '/.vim/swap') == 0
  call mkdir($HOME . '/.vim/swap', 'p')
endif
set directory=~/.vim/swap//
" keep backup files out of the way (dir has to exist!)
if isdirectory($HOME . '/.vim/backup') == 0
  call mkdir($HOME . '/.vim/backup', 'p')
endif
set backupdir=~/.vim/backup
set backup
" use undos even after exits and restarts
if isdirectory($HOME . '/.vim/undo') == 0
  call mkdir($HOME . '/.vim/undo', 'p')
endif
set undodir+=~/.vim/undo//
set undofile
" viminfo stores the state of the previous editing session
set viminfo=%,<100,'10,/50,:100,h,f0,n~/.vim/viminfo
"           | |    |   |   |    | |  + viminfo file path
"           | |    |   |   |    | + file marks 0-9,A-Z 0=NOT stored
"           | |    |   |   |    + disable 'hlsearch' loading viminfo
"           | |    |   |   + comand line history saved
"           | |    |   + search history saved
"           | |    + files marks saved
"           | + lines saved each register
"           + save/restore buffer list
" Tabs
" Tab key mappings
nnoremap <C-Left> :tabprevious<CR>
nnoremap <C-Right> :tabnext<CR>
" Tab settings
set showtabline=1                         " short stal
" TabLine settings
hi TabLine cterm=bold ctermfg=46 ctermbg=242
hi TabLineSel cterm=bold ctermfg=46
hi TabLineFill cterm=bold ctermbg=46
