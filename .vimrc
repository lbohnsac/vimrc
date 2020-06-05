set ruler
set list
set cmdheight=2
set number
set autoindent
set expandtab
set tabstop=2
set softtabstop=2
set shiftwidth=2
color elflord
" shift+ctrl+u + 00ac + space ¬
" shift+ctrl+u + 2023 + space ‣
" shift+ctrl+u + 00a0 + space  
" shift+ctrl+u + 00b7 + space ·
set listchars=eol:¬,tab:‣ ,trail:·
" Add the cursorcolumn for YAML files
autocmd FileType yaml setlocal cursorcolumn
" Remove all trailing whitespaces while saving
autocmd BufWritePre * %s/\s\+$//e
