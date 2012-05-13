"Enable Pathogen
call pathogen#infect()

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nowrap                      " don't wrap lines

"Typing 'a will jump to the line in the current file marked with ma. However,
"`a will jump to the line and column marked with ma. Swap them
nnoremap ' `
nnoremap ` '


" <C-e> and <C-y> scroll the viewport a single line. I like to ratchet this up:
nnoremap <C-e> 3<C-e>
nnoremap <C-y> 3<C-y>

" With a map leader it's possible to do extra key combinations
" like <leader>w saves the current file
let mapleader = ","
let g:mapleader = ","

"{{{Auto Commands


" reload vimrc on update  {{{2
"autocmd BufWritePost .vimrc source %

" Automatically cd into the directory that the file is in
autocmd BufEnter * execute "chdir ".escape(expand("%:p:h"), ' ')

" Remove any trailing whitespace that is in the file
autocmd BufRead,BufWrite * if ! &bin | silent! %s/\s\+$//ge | endif

" Tell vim to remember certain things when we exit
"  '10  :  marks will be remembered for up to 10 previously edited files
"  "100 :  will save up to 100 lines for each register
"  :20  :  up to 20 lines of command-line history will be remembered
"  %    :  saves and restores the buffer list
"  n... :  where to save the viminfo files
set viminfo='10,\"100,:20,%,n~/.viminfo

function! ResCur()
  if line("'\"") <= line("$")
    normal! g`"
    return 1
  endif
endfunction

augroup resCur
  autocmd!
  autocmd BufWinEnter * call ResCur()
augroup END



"}}}

"{{{Misc Settings

" Necesary  for lots of cool vim things
set nocompatible

" This shows what you are typing as a command.  I love this!
set showcmd

" Folding Stuffs
" set foldmethod=marker

" Needed for Syntax Highlighting and stuff
filetype on
filetype plugin on
syntax enable
set grepprg=grep\ -nH\ $*

" Who doesn't like autoindent?
set autoindent
set si "Smart indet
"set ruler

" Spaces are better than a tab character
set expandtab
set smarttab
set scrolloff=5               " keep at least 5 lines above/below
set sidescrolloff=5           " keep at least 5 lines left/right
set ttyfast                   " we have a fast terminal
set noerrorbells              " No error bells please
set visualbell
set t_vb=
filetype on                   " Enable filetype detection
filetype indent on            " Enable filetype-specific indenting
filetype plugin on            " Enable filetype-specific plugins
set showcmd                     " Show (partial) command in status line.

" Who wants an 8 character tab?  Not me!
set shiftwidth=3
set softtabstop=3

set encoding=utf8
try
    lang en_US
catch
endtry


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Spell checking
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Pressing ,ss will toggle and untoggle spell checking
map <leader>ss :setlocal spell!<cr>

"Shortcuts using <leader>
map <leader>sn ]s
map <leader>sp [s
map <leader>sa zg
map <leader>s? z=

" Use english for spellchecking, but don't spellcheck by default
if version >= 700
   set spl=en spell
   set nospell
endif

" Real men use gcc
"compiler gcc

" Cool tab completion stuff
set wildmenu
set wildmode=list:longest,full

" Enable mouse support in console
set mouse=a

" Got backspace?
"set backspace=2

" Set backspace config
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

" Line Numbers PWN!
" set number

" Set fixed path for tmp and backup files
set backup
set backupdir=~/.vim/backup,~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set directory=~/.vim/tmp,~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp

" suffix a timestamp to backup files so we have multiple versions of it.
"au BufWritePre * let &bex = '-' . strftime("%Y%m%d-%H%M%S") . '.vimbackup'

" highlight the current line
set cul

" Adjust current lines color
hi CursorLine term=none cterm=none ctermbg=5

" Ignoring case is a fun trick
set ignorecase

set showmatch                 " show matching bracket
set diffopt=filler,iwhite     " ignore all whitespace and sync

" Tell vim to remember certain things when we exit
"  '10  :  marks will be remembered for up to 10 previously edited files
"  "100 :  will save up to 100 lines for each register
"  :20  :  up to 20 lines of command-line history will be remembered
"  %    :  saves and restores the buffer list
"  n... :  where to save the viminfo files
set viminfo=%100,'100,/100,h,\"500,:100,n~/.viminfo

" And so is Artificial Intellegence!
set smartcase

" This is totally awesome - remap jj to escape in insert mode.  You'll never type jj anyway, so it's great!
inoremap jj <Esc>

nnoremap JJJJ <Nop>

" Incremental searching is sexy
set incsearch

" Highlight things that we find with the search
set hlsearch

" Since I use linux, I want this
let g:clipbrdDefaultReg = '+'

" When I close a tab, remove the buffer
set nohidden

" Set off the other paren
highlight MatchParen ctermbg=4
" }}}

"{{{Look and Feel

" Favorite Color Scheme
"if has("gui_running")
   "colorscheme inkpot
   "" Remove Toolbar
   "set guioptions-=T
   ""Terminus is AWESOME
   "set guifont=Terminus\ 9
"else
   "colorscheme metacosm
"endif


"g:solarized_termcolors= 16 | 256
let g:solarized_termcolors= 16
"g:solarized_termtrans = 0 | 1
"g:solarized_degrade = 0 | 1
"g:solarized_bold = 1 | 0
let g:solarized_bold = 1
"g:solarized_underline = 1 | 0
let g:solarized_underline = 1
"g:solarized_italic = 1 | 0
"g:solarized_contrast = "normal"| "high" or "low"
"g:solarized_visibility= "normal"| "high" or "low"
let g:solarized_visibility= "high"
"let g:solarized_termcolors=256
let g:solarized_contrast="high"
"set term=xterm-256color
"set background=dark
"colorscheme solarized
"highlight LineNr ctermfg=darkgrey
"set cursorline                  " highlight current line

"Status line gnarliness
set laststatus=2
"set statusline=\ %{HasPaste()}%F%m%r%h%w\ CWD:\ %r%{CurDir()}%h\ \ (%{&ff}){%Y}\ [%l,%v][%p%%]:%c
"set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{CurDir()}%h\ \ %=\ Line:\ %l/%L\ [%p%%]\ column:%c
"set statusline=%<%f\ (%{&ft})\ %-4(%m%)%=%-19(%3l,%02c%03V%)
"set showtabline=2               " always show tab bar

"set statusline=
"set statusline+=%-3.3n\                      " buffer number
"set statusline+=%f\                          " filename
"set statusline+=%h%m%r%w                     " status flags
"set statusline+=\[%{strlen(&ft)?&ft:'none'}] " file type
"set statusline+=%=                           " right align remainder
"set statusline+=%-14(%l,%c%V%)               " line, character
"set statusline+=%<%P                         " file position
"set statusline=
set statusline=\ %{HasPaste()}                " Mode
set statusline+=%F%m%r%h\ %w                  " File name
set statusline+=\ \ CWD:\ %r%{CurDir()}%h     " current directory
set statusline+=\ \ %=                        " Right align everything after this
set statusline+=\ Line:\ %l/%L                " Current line number/total lines
set statusline+=\ [%p%%]                      " percentage
set statusline+=\ column:%c                   " cursor column

function! CurDir()
    let curdir = substitute(getcwd(), '/Users/deepak/', "~/", "g")
    return curdir
endfunction

function! HasPaste()
    if &paste
        return 'PASTE MODE  '
    else
        return ''
    endif
endfunction


" }}}

"{{{ Functions

"{{{ Open URL in browser

function! Browser ()
   let line = getline (".")
   let line = matchstr (line, "http[^   ]*")
   exec "!konqueror ".line
endfunction

"}}}

"{{{Theme Rotating
let themeindex=0
function! RotateColorTheme()
   let y = -1
   while y == -1
      let colorstring = "inkpot#ron#blue#elflord#evening#koehler#murphy#pablo#desert#torte#"
      let x = match( colorstring, "#", g:themeindex )
      let y = match( colorstring, "#", x + 1 )
      let g:themeindex = x + 1
      if y == -1
         let g:themeindex = 0
      else
         let themestring = strpart(colorstring, x + 1, y - x - 1)
         return ":colorscheme ".themestring
      endif
   endwhile
endfunction
" }}}

"{{{ Paste Toggle
let paste_mode = 0 " 0 = normal, 1 = paste

func! Paste_on_off()
   if g:paste_mode == 0
      set paste
      let g:paste_mode = 1
   else
      set nopaste
      let g:paste_mode = 0
   endif
   return
endfunc
"}}}

"{{{ Todo List Mode

function! TodoListMode()
   e ~/.todo.otl
   Calendar
   wincmd l
   set foldlevel=1
   tabnew ~/.notes.txt
   tabfirst
   " or 'norm! zMzr'
endfunction

"}}}

"}}}

"{{{ Mappings

" Open Url on this line with the browser \w
map <Leader>w :call Browser ()<CR>

" Open the Project Plugin <F2>
nnoremap <silent> <F2> :Project<CR>

" Open the Project Plugin
nnoremap <silent> <Leader>pal  :Project .vimproject<CR>

" TODO Mode
nnoremap <silent> <Leader>todo :execute TodoListMode()<CR>

" Open the TagList Plugin <F3>
nnoremap <silent> <F3> :Tlist<CR>

" Next Tab
nnoremap <silent> <C-A-Right> :tabnext<CR>

" Previous Tab
nnoremap <silent> <C-A-Left> :tabprevious<CR>

" New Tab
nnoremap <silent> <M-j> :tabnew<CR>

" tab navigation
:nmap <C-t> :tabnew<CR>
:imap <C-t> <Esc>:tabnew<CR>
:nmap <C-j> :tabprevious<CR>
:imap <C-j> <Esc>:tabprevious<CR>
:nmap <C-k> :tabnext<CR>
:imap <C-k> <Esc>:tabnext<CR>


" Rotate Color Scheme <F8>
nnoremap <silent> <F8> :execute RotateColorTheme()<CR>

" DOS is for fools.
nnoremap <silent> <F9> :%s/$//g<CR>:%s// /g<CR>

" Paste Mode!  Dang! <F10>
nnoremap <silent> <F10> :call Paste_on_off()<CR>
set pastetoggle=<F10>

" Edit vimrc \ev
nnoremap <silent> <Leader>ev :tabnew<CR>:e ~/.vimrc<CR>

" Edit gvimrc \gv
nnoremap <silent> <Leader>gv :tabnew<CR>:e ~/.gvimrc<CR>

" Up and down are more logical with g..
nnoremap <silent> k gk
nnoremap <silent> j gj
inoremap <silent> <Up> <Esc>gka
inoremap <silent> <Down> <Esc>gja

" Good call Benjie (r for i)
nnoremap <silent> <Home> i <Esc>r
nnoremap <silent> <End> a <Esc>r

" Create Blank Newlines and stay in Normal mode
nnoremap <silent> zj o<Esc>
nnoremap <silent> zk O<Esc>

" Space will toggle folds!
nnoremap <space> za

" Search mappings: These will make it so that going to the next one in a
" search will center on the line it's found in.
map N Nzz
map n nzz

" Testing
set completeopt=longest,menuone,preview

inoremap <expr> <cr> pumvisible() ? "\<c-y>" : "\<c-g>u\<cr>"
inoremap <expr> <c-n> pumvisible() ? "\<lt>c-n>" : "\<lt>c-n>\<lt>c-r>=pumvisible() ? \"\\<lt>down>\" : \"\"\<lt>cr>"
inoremap <expr> <m-;> pumvisible() ? "\<lt>c-n>" : "\<lt>c-x>\<lt>c-o>\<lt>c-n>\<lt>c-p>\<lt>c-r>=pumvisible() ? \"\\<lt>down>\" : \"\"\<lt>cr>"

" Swap ; and :  Convenient.
"nnoremap ; :
"nnoremap : ;

" Fix email paragraphs
nnoremap <leader>par :%s/^>$//<CR>

"ly$O#{{{ "lpjjj_%A#}}}jjzajj

"}}}

"{{{Taglist configuration
let Tlist_Use_Right_Window = 1
let Tlist_Enable_Fold_Column = 0
let Tlist_Exit_OnlyWindow = 1
let Tlist_Use_SingleClick = 1
let Tlist_Inc_Winwidth = 0
"}}}

let g:rct_completion_use_fri = 1
"let g:Tex_DefaultTargetFormat = "pdf"
let g:Tex_ViewRule_pdf = "kpdf"

filetype plugin indent on
syntax on

" Bash like keys for the command line
cnoremap <C-A>      <Home>
cnoremap <C-E>      <End>
cnoremap <C-K>      <C-U>

cnoremap <C-P> <Up>
cnoremap <C-N> <Down>

"split panes
map :vs :vsplit<cr><c-w>l

" Resize windows quickly
" reset with <c-w>=
nmap <c-w>l :vertical res +20<cr>
nmap <c-w>h :vertical res -20<cr>
nmap <c-w>j :res +20<cr>
nmap <c-w>k :res -20<cr>

"nnoremap <c-j> <c-w>j
"nnoremap <c-k> <c-w>k
"nnoremap <c-h> <c-w>h
"nnoremap <c-l> <c-w>l

" Resize windows quickly
" reset with <c-w>=
nmap <leader>H :vertical res +20<cr>
nmap <leader>L :vertical res -20<cr>
" Scroll other window
function! ScrollOtherWindowDown(count)
  Normal
  normal!
  normal
endfunction
function! ScrollOtherWindowUp(count)
  normal
  normal!
normal
endfunction
nnoremap <c-w>y :call ScrollOtherWindowUp(v:count)<cr>
nnoremap <c-w>e :call ScrollOtherWindowDown(v:count)<cr>

map <A-Left> :tabprev<CR>
map <A-Right> :tabnext<CR>

"-----------------------------------------------------------------------------
" FuzzyFinder Settings
"-----------------------------------------------------------------------------
let g:fuf_file_exclude = '\v\~$|\.(o|exe|dll|bak|class|meta|lock|orig|jar|swp)$|/test/data\.|(^|[/\\])\.(hg|git|bzr)($|[/\\])'
let g:fuf_splitPathMatching = 0
let g:fuf_maxMenuWidth = 110
let g:fuf_timeFormat = ''
nmap <silent> ,fv :FufFile ~/.vim/<cr>
nmap <silent> ,fb :FufBuffer<cr>
nmap <silent> ,ff :FufFile<cr>
nmap <silent> ,fc :FufMruCmd<cr>
nmap <silent> ,fm :FufMruFile<cr>
nmap <silent> ,fp :FufFile ~/git/*<cr>

