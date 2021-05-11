set nocompatible                                                        " short nocp
set showmode                                                            " short smd
set list
set paste
set cmdheight=1
set number                                                              " short nu
set autoindent                                                          " short ai
set expandtab                                                           " short et
set tabstop=2                                                           " short ts
set softtabstop=2                                                       " short sts
set shiftwidth=2                                                        " short sw
set scrolloff=999                                                       " short so
" The encoding displayed
set encoding=utf-8
" The encoding written to file
set fileencoding=utf-8
color elflord
" Sets status line
set laststatus=2
set statusline=\ %F\ %r\ %m\ %{&endofline?'':'[noeol]'}\ %y\ %{strlen(&fenc)?&fenc:'none'}%=%-14.(\[row\:\ %l\ of\ %L\]\ \[col\:\ %c%V%)\]\ \ %P 
highlight StatusLine ctermbg=black ctermfg=46
autocmd InsertEnter * hi StatusLine term=reverse ctermbg=Yellow  ctermfg=DarkBlue
autocmd InsertLeave * hi StatusLine ctermbg=black ctermfg=46
" Enables cursor line position tracking
set cursorline                              " short cul
" Removes the underline causes by enabling cursorline:
highlight clear CursorLine
" Sets the line numbering colour
highlight LineNr ctermfg=8
" Sets the current line number colour
highlight CursorLineNr cterm=bold ctermbg=NONE ctermfg=46
" Sets the background colour of the current line
highlight CursorLine cterm=NONE ctermbg=234 cterm=NONE
" Sets the list chars
" shift+ctrl+u + 00ac + space ¬
" shift+ctrl+u + 2023 + space ‣
" shift+ctrl+u + 00a0 + space  
" shift+ctrl+u + 00b7 + space ·
set listchars=eol:¬,tab:‣ ,trail:·
" Add the cursorcolumn for YAML files
autocmd FileType yaml setlocal cursorcolumn                             " short cuc
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
" Where to store backups
set backupdir=~/.vim/backup//
" Turn on backup option
set backup
" Make backup before overwriting the current buffer
set writebackup
" Overwrite the original backup file
set backupcopy=yes
" Usefull backup file name e.g filename@2021-05-06.12:03
au BufWritePre * let &bex = '@' . strftime("%F.%H:%M")
" use undos even after exits and restarts
if isdirectory($HOME . '/.vim/undo') == 0
  call mkdir($HOME . '/.vim/undo', 'p')
endif
set undodir+=~/.vim/undo//
set undofile
" viminfo stores the state of the previous editing session
set viminfo=%,<100,'10,/50,:100,h,f0,n~/.vim/viminfo
"           - ---- --- --- ---- - -- ---------------
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
set showtabline=1                                                       " short stal
" TabLine settings
highlight TabLine cterm=bold ctermfg=46 ctermbg=242                     " short hi
highlight TabLineSel cterm=bold ctermfg=46
highlight TabLineFill cterm=bold ctermbg=46
" jq mappings
if executable('python')
  nnoremap jq <ESC>:%!python -m json.tool<CR>
endif
if executable('python2')
  nnoremap jq <ESC>:%!python2 -m json.tool<CR>
endif
if executable('python3')
  nnoremap jq <ESC>:%!python3 -m json.tool<CR>
endif
if executable('jq')
  nnoremap jq <ESC>:%!jq '.'<CR>
  nnoremap jc <ESC>:%!jq -c<CR>
endif
" Toggle set number and set list
nnoremap cp <ESC>:set nu! <BAR> set list!<CR>
" Toggle set relativenumber
nnoremap nr <ESC>:set relativenumber!<CR>                               " short rnu; nornu
" Window key mappings
nnoremap wt <C-W>T
nnoremap <A-Left> <C-W>h
nnoremap <A-Down> <C-W>j
nnoremap <A-Up> <C-W>k
nnoremap <A-Right> <C-W>l

" AUTOCOMMANDGROUPS
augroup vimrc-auto-mkdir
  autocmd!
  autocmd BufWritePre * call s:auto_mkdir(expand('<afile>:p:h'), v:cmdbang)
  function! s:auto_mkdir(dir, force)
    if !isdirectory(a:dir)
          \   && (a:force
          \       || input("'" . a:dir . "' does not exist. Create? [y/N]") =~? '^y\%[es]$')
      call mkdir(iconv(a:dir, &encoding, &termencoding), 'p')
    endif
  endfunction
augroup END
