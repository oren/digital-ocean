" Vundle setup
" ============================================================================
" to install: vim +PluginInstall +qall

set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" plugins
" ============================================================================
Plugin 'altercation/vim-colors-solarized'
Plugin 'kien/ctrlp.vim'                      " Fuzzy finder
Plugin 'tomtom/tcomment_vim'

Plugin 'fatih/vim-go'                        " Go development plugin
Plugin 'majutsushi/tagbar'                   " class outline viewer

" snippets (all 4 needed)
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'tomtom/tlib_vim'
Plugin 'garbas/vim-snipmate'
Plugin 'honza/vim-snippets'

call vundle#end()            " required
filetype plugin indent on    " required

syntax enable
set background=dark
colorscheme solarized
set t_Co=16
call togglebg#map("<F5>")

filetype indent plugin on " turns on filetype detection, and loads indent scripts and plugins

" i have no idea what the following do:
set showcmd                       " Display incomplete commands.
set showmode                      " Display the mode you're in.
set scrolloff=3
set number
" set title

nnoremap <C-n> :call NumberToggle()<cr>

" Windows
" ============================================================================
set splitbelow splitright
set equalalways
set winminheight=0
set winminwidth=0

set spelllang=en_us
set nowrap
" not working
" set shortmess=at  " donet' show <press enter> message

let mapleader = ","
let maplocalleader = ","

" Show extra space in red
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/

" remove whitespace with ,w
:noremap <leader>w :%s/\s\+$//<CR>

:noremap <leader>v :vsp<CR>:enew<CR>:pwd<CR>
:noremap <leader>s :split<CR>:enew<CR>:pwd<CR>
:noremap <leader>l <C-w>l
:noremap <leader>h <C-w>h
:noremap <leader>j <C-w>j
:noremap <leader>k <C-w>k
:noremap <leader>- <C-W>_
:noremap <leader>N <C-W>n<C-W>_
:noremap <leader>? <C-W>n<C-W>H<C-W>q
:noremap <leader>c :only<CR>:tabonly<CR>
:noremap K <Esc><C-w>k<C-w>_
:noremap <leader>R :! make test/%<CR>
:noremap <leader>r :! jshint %<CR>:! jscs %<CR>
:noremap <leader>/ <C-W>n<C-W>H<C-W>q<C-W>t<C-W>_<C-W>l<C-W>_<C-W>l<C-W>_<C-W>l<C-W>_

:noremap <leader>gst :!tig status<CR>
:noremap <leader>gpr :!git pull --rebase<CR>
:noremap <leader>gup :!git pull<CR>
:noremap <leader>gush :!git push<CR>

:noremap <C-c> <ESC>
:noremap <C-w><C-c> <ESC>
:noremap <C-w>c <ESC>

" Tabs
" ============================================================================
set expandtab            " insert space chars when tab is pressed
set softtabstop=2
set shiftwidth=2         " 2 spaceson indentation
set tabstop=2            " 2 spaces when tab is pressed
set smarttab
set autoindent
set textwidth=0
set showtabline=0
set laststatus=1
set cursorline

" Status line
" ============================================================================
set laststatus=2      " always show status line
set statusline=%f       "full path
set statusline+=%h    " help file flag
set statusline+=%m    " modified flag
set statusline+=%r    " read only flag
set statusline+=%=    " left/right separator
set statusline+=%c,   " cursor column
set statusline+=%l/%L " cursor line/total lines
set statusline+=\ %P  " percent through file

" Persistent undo
" ============================================================================
set undofile                " Save undo's after file closes
set undodir=$HOME/.vim/undo " where to save undo histories
set undolevels=1000         " How many undos
set undoreload=10000        " number of lines to save for undo

" detect indentation based on source
" autocmd BufReadPost * DetectIndent

" ; is easier than :
nnoremap ; :
" hh is easier than esc
inoremap hh <ESC>
"  tab is easier than %
nnoremap <tab> %
"  no need for Ex mode
nnoremap Q <nop>

"buffers
map <C-h> <Esc>:bp<CR>
map <C-t> <Esc>:bn<CR>
map <C-d> <Esc>:bd<CR>

" F keys
" ============================================================================
map <F1> :e.<CR>
nnoremap <F2> :set nonumber!<CR>
set pastetoggle=<F3> " hit this before pasting to fix indentation
nnoremap <F3> :set invpaste paste?<CR>
set pastetoggle=<F3>
nmap <F8> :TagbarToggle<CR>

" Searching
" ============================================================================
set hlsearch   " highlight search
set incsearch  " incremental search - highlight matches as you type
set ignorecase " Ignore case when searching
set smartcase  " But case-sensitive if expression contains a capital letter
"<c-l> clear the highlight as well as redraw
nnoremap <C-L> :nohls<CR><C-L>
inoremap <C-L> <C-O>:nohls<CR>

" Directories
" ============================================================================
" Setup backup location and enable
set backupdir=~/.backup/vim
set backup
" Set Swap directory
set directory=~/.backup/vim/swap

" https://gist.github.com/substack/7745bb6ff9ad58d4805d
set noswapfile
set nobackup  " Don't make a backup before overwriting a file.
set nowritebackup

" Change file completion to mimic shell behavior
set wildmenu
set wildmode=list:longest
set wildignore+=*/.gs/*,*.DS_Store,*.rdb,*.aof,*.sqlite3,*.pid

" Inser New Line
" ============================================================================
:noremap <S-Enter> O<ESC>
:noremap <Enter> o<ESC>

" Set encodings to UTF8
" ============================================================================
set encoding=utf-8
set fileencoding=utf-8

" set list listchars=tab:>-,trail:.,extends:>

" Allow backspace to work on auto indents, EOL, or start of lines.
set backspace=indent,eol,start

" CtrlP
" ============================================================================
" Change mapping
let g:ctrlp_map = '<leader>t'
" Setup ctrlp (& vim) to use ag search.
if executable('ag')
" Use ag over grep
set grepprg=ag\ --nogroup\ --nocolor
" Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
" ag is fast enough that CtrlP doesn't need to cache
let g:ctrlp_use_caching = 0
endif
" Don't update the ctrlp window until I'm done typing.
let g:ctrlp_lazy_update = 1
" Tell ctrlp plugin to ignore the specified patterns.
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git\|dist/*'
" path matching mode.
let g:ctrlp_by_filename = 0
" Increase the max_files limit for ctrlp so I can search the adobe directory.
let g:ctrlp_max_files = 0 " Zero means unlimited.
" Increase the maximum depth that ctrlp will search through the directory tree.
let g:ctrlp_max_depth = 100

"jump to last cursor position when opening a file
"dont do it when writing a commit log entry
autocmd BufReadPost * call SetCursorPosition()
function! SetCursorPosition()
    if &filetype !~ 'commit\c'
        if line("'\"") > 0 && line("'\"") <= line("$")
            exe "normal g`\""
        endif
    end
endfunction

" needed for gotags - https://github.com/jstemmer/gotags
let g:tagbar_type_go = {
    \ 'ctagstype' : 'go',
    \ 'kinds'     : [
        \ 'p:package',
        \ 'i:imports:1',
        \ 'c:constants',
        \ 'v:variables',
        \ 't:types',
        \ 'n:interfaces',
        \ 'w:fields',
        \ 'e:embedded',
        \ 'm:methods',
        \ 'r:constructor',
        \ 'f:functions'
    \ ],
    \ 'sro' : '.',
    \ 'kind2scope' : {
        \ 't' : 'ctype',
        \ 'n' : 'ntype'
    \ },
    \ 'scope2kind' : {
        \ 'ctype' : 't',
        \ 'ntype' : 'n'
    \ },
    \ 'ctagsbin'  : 'gotags',
    \ 'ctagsargs' : '-sort -silent'
    \ }

" Supertab. not sure why it's needed
let g:SuperTabDefaultCompletionType = "context"

" open a file named 'auto' as javascript file (for syntax highlight and snippets
autocmd BufNewFile,BufRead auto set filetype=javascript
