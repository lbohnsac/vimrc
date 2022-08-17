"            _
"     _   __(_)___ ___  __________
"    | | / / / __ `__ \/ ___/ ___/
"   _| |/ / / / / / / / /  / /_
"  (_)___/_/_/ /_/ /_/_/   \___/
"
" Lars Bohnsack
" 2022-03-14

set nocompatible                                                        " short nocp
set modeline
set showmode                                                            " short smd
set showcmd                                                             " short sc
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
set encoding=utf-8                                                      " The encoding displayed
set fileencoding=utf-8                                                  " The encoding written to file
set spelllang=en,de_de
color elflord                                                           " Use color scheme




" Puts new split windows to the bottom of the current.
set splitbelow                                                          " short sb

" STATUSLINE
set laststatus=2                                                        " Sets status line
set statusline=\ %F\ %r\ %m\ %{&endofline?'':'[noeol]'}\ %y\ %{strlen(&fenc)?&fenc:'none'}%=%-26.(\[row\:\ %l\ of\ %L\]\ \[col\:\ %c%V%)\]\ \ %P 
highlight StatusLine term=bold ctermbg=black ctermfg=46
highlight StatusLineTerm term=bold ctermbg=241 ctermfg=46
highlight StatusLineTermNC term=bold ctermbg=46 ctermfg=0
autocmd InsertEnter * hi StatusLine term=bold ctermbg=11 ctermfg=1
autocmd InsertLeave * hi StatusLine term=bold ctermbg=black ctermfg=46

" Enables cursor line position tracking
set cursorline                                                          " short cul
highlight clear CursorLine                                              " Removes the underline causes by enabling cursorline:
highlight LineNr ctermfg=8                                              " Sets the line numbering colour
highlight CursorLineNr cterm=bold ctermbg=NONE ctermfg=46               " Sets the current line number colour
highlight CursorLine cterm=NONE ctermbg=234 cterm=NONE                  " Sets the background colour of the curtrent line

" Define the background color for Visual mode highlighting
hi Visual ctermbg=241

" Pmenu config
highlight Pmenu term=bold ctermfg=46 ctermbg=234
highlight PmenuSel term=bold ctermfg=11 ctermbg=33

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

" CONFIG DIRECTORY SETUP
if isdirectory($HOME . '/.vim') == 0                                    " take care that dir ~/.vim is existing
  call mkdir($HOME . '/.vim', 'p')
endif

" SWAP
if isdirectory($HOME . '/.vim/swap') == 0                               " keep swap files out of the way (dir has to exist!)
  call mkdir($HOME . '/.vim/swap', 'p')
endif
set directory=~/.vim/swap//                                             " Where to store swapfiles

" BACKUP
if isdirectory($HOME . '/.vim/backup') == 0                             " keep backup files out of the way (dir has to exist!)
  call mkdir($HOME . '/.vim/backup', 'p')
endif
set backupdir=~/.vim/backup//                                           " Where to store backups
set backup                                                              " Turn on backup option
set writebackup                                                         " Make backup efore overwriting the current buffer
set backupcopy=yes                                                      " Overwrite the original backup file

" Usefull backup file name e.g filename@2021-05-06.12:03
au BufWritePre * let &bex = '@' . strftime("%F.%H:%M")

" UNDO
if isdirectory($HOME . '/.vim/undo') == 0                               " use undos even after exits and restarts
  call mkdir($HOME . '/.vim/undo', 'p')
endif
set undodir=~/.vim/undo//                                               " Where to store undos
set undofile                                                            " Turn on undo option

set viminfo=%,<100,'10,/50,:100,h,f0,n~/.vim/viminfo                    " viminfo stores the state of the previous editing session
"           - ---- --- --- ---- - -- ---------------
"           | |    |   |   |    | |  + viminfo file path
"           | |    |   |   |    | + file marks 0-9,A-Z 0=NOT stored
"           | |    |   |   |    + disable 'hlsearch' loading viminfo
"           | |    |   |   + comand line history saved
"           | |    |   + search history saved
"           | |    + files marks saved
"           | + lines saved each register
"           + save/restore buffer list

" TABS
" Tab settings
set showtabline=1                                                       " short stal
set tabpagemax=20                                                       " short tpm; default is 10

" TabLine settings
highlight TabLine cterm=bold ctermfg=46 ctermbg=242
highlight TabLineSel cterm=bold ctermfg=46
highlight TabLineFill cterm=bold ctermbg=46

" KEY MAPPINGS
" Allow saving of files as sudo when we forgot to start vim using sudo.
" If the 'paste' option is set, then command-line mode maps are disabled.
" run ':set paste!' before using ':w!!'
cnoremap w!! execute 'write !sudo tee % >/dev/null' <bar> edit!

" Delete current line without yanking the line breaks
nnoremap dil ^d$

" Clear highlights on hitting ESC twice
nnoremap <esc><esc> :noh<return>


" Tab key mappings
nnoremap <C-Left> :tabprevious<CR>
nnoremap <C-Right> :tabnext<CR>
nnoremap <C-up> :tabnew<CR>
nnoremap <C-down> :tabclose<CR>

" Window key mappings
nnoremap wt <C-W>T
nnoremap <A-Left> :wincmd h<CR>                                         "<C-W>h
nnoremap <A-Down> :wincmd j<CR>                                         "<C-W>j
nnoremap <A-Up> :wincmd k<CR>                                           "<C-W>k
nnoremap <A-Right> :wincmd l<CR>                                        "<C-W>l

" Edit existing file under cursor in vertically split window
nnoremap <C-W><C-F> <C-W>vgf

" jq key mappings
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
  nnoremap jc <ESC>:%!jq -c '.'<CR>
endif

" yq key mappings
" https://github.com/mikefarah/yq/releases
if executable('yq')
  nnoremap yq <ESC>:%!yq e -j<CR>
  nnoremap yc <ESC>:%!yq e -P<CR>
endif

" Toggle mappings
nnoremap cp <ESC>:set nu! <BAR> set list!<CR>                           " Toggle set number and set list
nnoremap nr <ESC>:set relativenumber!<CR>                               " Toggle set relativenumber

" AUTOCOMMANDS
autocmd BufWritePre * %s/\s\+$//e                                       " Remove all trailing whitespaces while saving

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
" NETRW SETTINGS
" open netrw always with directory layout 3
let g:netrw_liststyle = 3
" remove the banner
let g:netrw_banner = 0
