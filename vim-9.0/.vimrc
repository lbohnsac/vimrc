"            _
"     _   __(_)___ ___  __________
"    | | / / / __ `__ \/ ___/ ___/
"   _| |/ / / / / / / / /  / /_
"  (_)___/_/_/ /_/ /_/_/   \___/
"
" Lars Bohnsack
" 2023-04-19

" Color scheme (elflord from 2003) if you do not like it comment out or delete the lines from her to line 54 and define a colorscheme in line 77
set background=dark
hi clear
if exists("syntax_on")
  syntax reset
endif
hi Normal   guifg=cyan      guibg=black
hi Comment  term=bold   ctermfg=DarkCyan    guifg=#80a0ff
hi Constant term=underline  ctermfg=Magenta   guifg=Magenta
hi Special  term=bold   ctermfg=DarkMagenta guifg=Red
hi Identifier term=underline  cterm=bold      ctermfg=Cyan guifg=#40ffff
hi Statement term=bold    ctermfg=Yellow gui=bold guifg=#aa4444
hi PreProc  term=underline  ctermfg=LightBlue guifg=#ff80ff
hi Type term=underline    ctermfg=LightGreen  guifg=#60ff60 gui=bold
hi Function term=bold   ctermfg=White guifg=White
hi Repeat term=underline  ctermfg=White   guifg=white
hi Operator       ctermfg=Red     guifg=Red
hi Ignore       ctermfg=black   guifg=bg
hi Error  term=reverse ctermbg=Red ctermfg=White guibg=Red guifg=White
hi Todo term=standout ctermbg=Yellow ctermfg=Black guifg=Blue guibg=Yellow

" Common groups that link to default highlighting.                                                                                                                                                                                            
" You can specify other highlighting easily.
hi link String  Constant
hi link Character Constant
hi link Number  Constant
hi link Boolean Constant
hi link Float   Number
hi link Conditional Repeat
hi link Label   Statement
hi link Keyword Statement
hi link Exception Statement
hi link Include PreProc
hi link Define  PreProc
hi link Macro   PreProc
hi link PreCondit PreProc
hi link StorageClass  Type
hi link Structure Type
hi link Typedef Type
hi link Tag   Special
hi link SpecialChar Special
hi link Delimiter Special
hi link SpecialComment Special
hi link Debug   Special

set nocompatible                                                                " short nocp
set nomodeline                                                                  " short noml
set title
set showmode                                                                    " short smd
set showcmd                                                                     " short sc
set list
set cmdheight=1
set cryptmethod=blowfish2                                                       " short cm
set number                                                                      " short nu
set autoindent                                                                  " short ai
set expandtab                                                                   " short et
set tabstop=2                                                                   " short ts
set softtabstop=2                                                               " short sts
set shiftwidth=2                                                                " short sw
set scrolloff=999                                                               " short so
set encoding=utf-8                                                              " The encoding displayed
set fileencoding=utf-8                                                          " The encoding written to file
set wildmenu                                                                    " short wmnu
set equalalways                                                                 " short ea
set eadirection=both                                                            " short ead
set nospell
set spelllang=en,de_de
"color elflord                                                                   " Use color scheme
" Puts new split windows to the bottom of the current.
set splitbelow                                                                  " short sb
" type 'a <BS> :' for ä instead of 'Ctrl-k a:' in insert mode
" get a list of all digraphs with ':digraphs'
"set digraph                                                                     " short dg

" STATUSLINE
set laststatus=2                                                                " Sets status line
set statusline=\ %F\ %r\ %m\ %{&endofline?'':'[noeol]'}\ %y\ %{strlen(&fenc)?&fenc:'none'}\ %{&spell?'spellcheck':''}%=%-26.(\[row\:\ %l\ of\ %L\]\ \[col\:\ %c%V%)\]\ \ %P 
highlight StatusLine term=bold ctermbg=black ctermfg=46
highlight StatusLineTerm term=bold ctermbg=241 ctermfg=46
highlight StatusLineTermNC term=bold ctermbg=46 ctermfg=0
autocmd InsertEnter * hi StatusLine term=bold ctermbg=11 ctermfg=1 | set paste
autocmd InsertLeave * hi StatusLine term=bold ctermbg=black ctermfg=46 | set nopaste | set et | retab!

" Define the background color for Visual mode highlighting
highlight Visual ctermbg=241

" CURSOR
" Use a blinking block cursor within insert mode and a steady block cursor everywhere else.
" Reference chart of values:
 "   Ps = 0  -> blinking block.
 "   Ps = 1  -> blinking block.
 "   Ps = 2  -> steady block.
 "   Ps = 3  -> blinking underline.
 "   Ps = 4  -> steady underline.
 "   Ps = 5  -> blinking bar.
 "   Ps = 6  -> steady bar.
let &t_SI = "\e[1 q"
let &t_EI = "\e[2 q"

" Enables cursor line position tracking
set cursorline                                                                  " short cul
highlight clear CursorLine                                                      " Removes the underline causes by enabling cursorline:
highlight LineNr ctermfg=8                                                      " Sets the line numbering colour
highlight CursorLineNr cterm=bold ctermbg=NONE ctermfg=46                       " Sets the current line number colour
highlight CursorLine cterm=NONE ctermbg=234 cterm=NONE                          " Sets the background colour of the curtrent line

" Keep cursor at the bottom of the visual selection after you yank it.
vmap y ygv<Esc>

" Define the text colour for Spell highlights
highlight clear SpellBad
highlight SpellBad cterm=bold ctermfg=9
highlight clear SpellCap
highlight SpellCap cterm=bold ctermfg=12
highlight clear SpellRare
highlight SpellRare cterm=bold ctermfg=13
highlight clear SpellLocal
highlight SpellLocal cterm=bold ctermfg=14

" Pmenu config
highlight Pmenu term=bold ctermfg=46 ctermbg=234
highlight PmenuSel term=bold ctermfg=11 ctermbg=33

" Sets the list chars in GTK+ environments
" shift+ctrl+u + 00ac + space ¬
" shift+ctrl+u + 2023 + space ‣ if the triangular bullet is not shown correctly use 003e > instead
" shift+ctrl+u + 00a0 + space
" shift+ctrl+u + 00b7 + space ·

" Sets the list chars in non GTK+ environments
" ctrl+v + u + 00ac ¬
" ctrl+v + u + 2023 ‣ if the triangular bullet is not shown correctly use 003e > instead
" ctrl+v + u + 00a0  
" ctrl+v + u + 00b7 ·
set listchars=eol:¬,tab:‣ ,trail:·

" Add the cursorcolumn for YAML files
autocmd FileType yaml setlocal cursorcolumn                                     " short cuc

" Sets the cursorcolumn line colour -> switch on with -> :se cuc
highlight CursorColumn ctermbg=234

" Italicized comments
" When used in tmux set
" set -g default-terminal "tmux-256color"
" in .tmux.conf
highlight Comment cterm=italic

" CONFIG DIRECTORY SETUP
if isdirectory($HOME . '/.vim') == 0                                            " take care that dir ~/.vim is existing
  call mkdir($HOME . '/.vim', 'p')
endif

" SWAP
if isdirectory($HOME . '/.vim/swap') == 0                                       " keep swap files out of the way (dir has to exist!)
  call mkdir($HOME . '/.vim/swap', 'p')
endif
set directory=~/.vim/swap//                                                     " Where to store swapfiles

" BACKUP
if isdirectory($HOME . '/.vim/backup') == 0                                     " keep backup files out of the way (dir has to exist!)
  call mkdir($HOME . '/.vim/backup', 'p')
endif
set backupdir=~/.vim/backup//                                                   " Where to store backups
set backup                                                                      " Turn on backup option
set writebackup                                                                 " Make backup efore overwriting the current buffer
set backupcopy=yes                                                              " Overwrite the original backup file

" Usefull backup file name e.g filename@2021-05-06.12:03
au BufWritePre * let &bex = '@' . strftime("%F.%H:%M")

" UNDO
if isdirectory($HOME . '/.vim/undo') == 0                                       " use undos even after exits and restarts
  call mkdir($HOME . '/.vim/undo', 'p')
endif
set undodir=~/.vim/undo//                                                       " Where to store undos
set undofile                                                                    " Turn on undo option

if isdirectory($HOME . '/.vim/view') == 0                                       " create the view dir
  call mkdir($HOME . '/.vim/view', 'p')
endif

"autocmd BufWritePost,BufLeave,WinLeave ?* mkview                               " create a view while saving the file
autocmd BufReadPre ?* silent loadview                                           " load a view while reading the file

set viminfo=%,<1000,'10,/50,:100,h,f0,n~/.vim/viminfo                           " viminfo stores the state of the previous editing session
"           - ---- --- --- ---- - -- ---------------
"           | |     |   |   |    | |  + viminfo file path
"           | |     |   |   |    | + file marks 0-9,A-Z 0=NOT stored
"           | |     |   |   |    + disable 'hlsearch' loading viminfo
"           | |     |   |   + comand line history saved
"           | |     |   + search history saved
"           | |     + files marks saved
"           | + lines saved each register
"           + save/restore buffer list

" TABS
" Tab settings
set showtabline=1                                                               " short stal
set tabpagemax=20                                                               " short tpm; default is 10

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
nnoremap <esc><esc> :noh<CR>

" Tab key mappings
nnoremap th :tabprevious<CR>                                                    " Move one tab right
nnoremap tl :tabnext<CR>                                                        " Move one tb left
nnoremap tn :tabnew<CR>                                                         " Open new tab
nnoremap tc :tabclose<CR>                                                       " Close current tab
nnoremap t0 :tabmove 0<CR>                                                      " Make current the first one
nnoremap t$ :tabmove $<CR>                                                      " Make current tab the last one
nnoremap t- :-tabmove<CR>                                                       " Push current tab one to the left
nnoremap t+ :+tabmove<CR>                                                       " Push current tab one to the right

" Not putty or MobaXterm save tab key mappings
nnoremap <C-Left> :tabprevious<CR>                                              " Move one tab left
nnoremap <C-Right> :tabnext<CR>                                                 " Move one tb right
nnoremap <C-up> :tabnew<CR>                                                     " Open new tab
nnoremap <C-down> :tabclose<CR>                                                 " Close current tab

" Window key mappings
nnoremap wt <C-W>T                                                              " Create a tab from current window
nnoremap wh :wincmd h<CR>                                                       " Move one window left
nnoremap wj :wincmd j<CR>                                                       " Move one window down
nnoremap wk :wincmd k<CR>                                                       " Move one window up
nnoremap wl :wincmd l<CR>                                                       " Move one window right

" Not putty or MobaXterm save window key mappings
nnoremap <A-Left> :wincmd h<CR>                                                 " Move one window left
nnoremap <A-Down> :wincmd j<CR>                                                 " Move one window down
nnoremap <A-Up> :wincmd k<CR>                                                   " Move one window up
nnoremap <A-Right> :wincmd l<CR>                                                " Move one window right

" Split key mappings
nnoremap sv :vs<CR>                                                             " Split vertically
nnoremap sh :sp<CR>                                                             " Split horizontally

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
" Check jq --version!
if executable('jq')
" For jq version 1.6+
"  nnoremap jq <ESC>:%!jq<CR> <BAR> :set filetype=json<CR>                      " compact json to pretty print json
"  nnoremap jc <ESC>:%!jq -c<CR> <BAR> :set filetype=json<CR>                   " pretty print json to compact json

" For jq version prior 1.6
  nnoremap jq <ESC>:%!jq '.'<CR> <BAR> :set filetype=json<CR>                   " compact json to pretty print json
  nnoremap jc <ESC>:%!jq -c '.'<CR> <BAR> :set filetype=json<CR>                " pretty print json to compact json
endif

" yq key mappings
" Get it here: https://github.com/mikefarah/yq/releases
" Read documentation here: https://mikefarah.gitbook.io/yq/
" Check yq --version!
if executable('yq')
" For yq version prior 4.18
"  nnoremap yq <ESC>:%!yq e -o=json '.'<CR> <BAR> :set filetype=json<CR>        " yaml and compact json to pretty print json
"  nnoremap yqc <ESC>:%!yq e -o=json -I=0 '.'<CR> <BAR> :set filetype=json<CR>  " yaml and pretty print json to compact json
"  nnoremap yc <ESC>:%!yq e -P '.'<CR> <BAR> :set filetype=json<CR>             " json to yaml

" For yq version 4.18+
  nnoremap yq <ESC>:%!yq -o=json '.'<CR> <BAR> :set filetype=json<CR>           " yaml and compact json to pretty print json
  nnoremap yqc <ESC>:%!yq -o=json -I=0 '.'<CR> <BAR> :set filetype=json<CR>     " yaml and pretty print json to compact json
  nnoremap yqx <ESC>:%!yq -o=xml '.'<CR> <BAR> :set filetype=xml<CR>            " yaml to xml
  nnoremap yc <ESC>:%!yq -P '.'<CR> <BAR> :set filetype=yaml<CR>                " json to yaml
  nnoremap ycx <ESC>:%!yq -o=xml '.'<CR> <BAR> :set filetype=xml<CR>            " json to xml
  nnoremap yxc <ESC>:%!yq -p=xml -o=json '.'<CR> <BAR> :set filetype=json<CR>   " xml to json
  nnoremap yxq <ESC>:%!yq -p=xml -o=yaml '.'<CR> <BAR> :set filetype=yaml<CR>   " xml to yaml
endif

" base64-encode/decode selection if cmd base64 is available
if executable('base64')
  vnoremap 64e c<c-r>=system("base64 -w 0", @")<cr><esc>
  vnoremap 64d c<c-r>=system("base64 -d", @")<cr><esc>
endif

" base64-encode/decode selection if python3 is available
if executable('python3')
  vnoremap 64e c<c-r>=system("python3 -c 'import base64; import sys; print(base64.b64encode(sys.stdin.read().strip().encode(\"utf-8\")).decode(\"utf-8\"), end=\"\")'", @")<cr><esc>
  vnoremap 64d c<c-r>=system("python3 -c 'import base64; import sys; print(base64.b64decode(sys.stdin.read().strip().encode(\"utf-8\")).decode(\"utf-8\"), end=\"\")'", @")<cr><esc>
endif

" URL encode/decode selection if python3 is available
if executable('python3')
  vnoremap !ue c<c-r>=system("python3 -c 'import sys; from urllib import parse; print(parse.quote_plus(sys.stdin.read().strip()), end=\"\")'", @")<cr><esc>
  vnoremap !ud c<c-r>=system("python3 -c 'import sys; from urllib import parse; print(parse.unquote_plus(sys.stdin.read().strip()), end=\"\")'", @")<cr><esc>
endif
" Toggle mappings
nnoremap cp <ESC>:set nu! <BAR> set list!<CR>                                   " Toggle set number and set list
nnoremap nr <ESC>:set relativenumber!<CR>                                       " Toggle set relativenumber
nnoremap sp <ESC>:set spell!<CR>                                                " Toggle set spell

" Disable the useless U key mapping but show a message
:nnoremap U :echo " < < ===== C H E C K   C A P S   L O C K ===== > > "<CR>

" AUTOCOMMANDS
autocmd BufWritePre * %s/\s\+$//e                                               " Remove all trailing whitespaces while saving
" Per default, netrw leaves unmodified buffers open. This autocommand
" deletes netrw's buffer once it's hidden (using ':q', for example)
autocmd FileType netrw setl bufhidden=delete
" Colourise jinja2 out of the box
autocmd BufNewFile,BufRead *.jinja2,*.j2,*.jinja set filetype=yaml

" AUTOCOMMANDGROUPS
" https://travisjeffery.com/b/2011/11/saving-files-in-nonexistent-directories-with-vim/
" automatically mkdir when writing file in non-existant directory
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
" Netrw is a plugin that defines its own filetype, so we are going to use that to our advantage.
" What we are going to do is place our keymaps inside a function and create an autocommand that
" calls it everytime vim opens a filetype netrw.
function! NetrwMapping()
endfunction

augroup netrw_mapping
  autocmd!
  autocmd filetype netrw call NetrwMapping()
augroup END

function! NetrwMapping()
  nmap <buffer> P <C-w>z                                                        " Will close the preview window with P:x!
  nmap <buffer> fm mf                                                           " Mark a file or directory
  nmap <buffer> fu mu                                                           " Unmark all marke files
  nmap <buffer> fr R                                                            " Will rename a file
  nmap <buffer> fc mc                                                           " Will copy the marked files
  " We will use this to "skip" a step
  " After you mark your files you can put the cursor in a directory
  " and this will assign the target directory and copy in one step.
  nmap <buffer> fC mtmc
  nmap <buffer> fx mm                                                           " Will move marked files
  nmap <buffer> fX mtmm                                                         " Same thing as fC but for moving files
  nmap <buffer> fl :echo join(netrw#Expose("netrwmarkfilelist"), "\n")<CR>      " Show a list of marked files
  nmap <buffer> fq :echo 'Target:' . netrw#Expose("netrwmftgt")<CR>             " Show the current target directory
  nmap <buffer> ft mtfq                                                         " mt relacement
endfunction

" vertical splitting for previewing files
let g:netrw_preview   = 1
let g:netrw_alto = 0
" open netrw always with directory layout 3
let g:netrw_liststyle = 3
" directory listing will use 30% of the columns available while previewing files
let g:netrw_winsize   = 25
" remove the banner
let g:netrw_banner = 0
