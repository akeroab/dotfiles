set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" Keep Plugin commands between vundle#begin/end.

" Color Scheme
Plugin 'altercation/vim-colors-solarized'
" Git
Plugin 'tpope/vim-fugitive'
" Editing
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-unimpaired'
Plugin 'godlygeek/tabular'
Plugin 'editorconfig/editorconfig-vim'
" File Manager
Plugin 'kien/ctrlp.vim'
Plugin 'tacahiroy/ctrlp-funky'
Plugin 'scrooloose/nerdtree'
Plugin 'jistr/vim-nerdtree-tabs'
" Comment
Plugin 'tomtom/tcomment_vim'
" Search
Plugin 'Lokaltog/vim-easymotion'
Plugin 'majutsushi/tagbar'
" Visual
Plugin 'bling/vim-airline'
Plugin 'matchit.zip'
" Completion
Plugin 'Valloric/YouCompleteMe'
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
" Syntax Highlight
Plugin 'scrooloose/syntastic'
Plugin 'tpope/vim-markdown'
Plugin 'tpope/vim-haml'
Plugin 'tpope/vim-rails'
Plugin 'Blackrush/vim-gocode'
Plugin 'digitaltoad/vim-jade'
Plugin 'wavded/vim-stylus'
Plugin 'pangloss/vim-javascript'
Plugin 'kchmck/vim-coffee-script'
Plugin 'elzr/vim-json'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set history=100                 " Store a ton of history (default is 20)
set autoread                    " Automatically read a file that has changed on disk

" Remap non-US keyboard to have [and] which each have their own key
map ö [
map ä ]
map Ö {
map Ä }

" With a map leader it's possible to do extra key combinations
let mapleader = ","
let g:mapleader = ","

" Fast exit insert mode
:inoremap jk <esc>

" Fast saving
nmap <leader>w :w!<cr>

""""""""""""""""""""""""""""""
" => Visual mode related
""""""""""""""""""""""""""""""

" Visual shifting (does not exit Visual mode)
vnoremap < <gv
vnoremap > >gv

" Allow using the repeat operator with a visual selection (!)
" http://stackoverflow.com/a/8064607/127816
vnoremap . :normal .<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => VIM user interface
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set mouse=a                     " Automatically enable mouse usage
set mousehide                   " Hide the mouse cursor while typing
set shortmess+=filmnrxoOtT      " Abbrev. of messages (avoids 'hit enter')
set viewoptions=folds,options,cursor,unix,slash " Better Unix / Windows compatibility
set virtualedit=onemore         " Allow for cursor beyond last character
set spell                       " Spell checking on
set hidden                      " Allow buffer switching without saving

set backspace=indent,eol,start  " Backspace for dummies
set linespace=0                 " No extra spaces between rows
set number                      " Line numbers on
set showmatch                   " Show matching brackets/parenthesis
set incsearch                   " Find as you type search
set hlsearch                    " Highlight search terms
set ignorecase                  " Case insensitive search
set lazyredraw                  " Don't redraw while executing macros (good performance config)
set smartcase                   " Case sensitive when uc present
set wildmenu                    " Show list instead of just completing
set wildmode=list:longest,full  " Command <Tab> completion, list matches, then longest common part, then all.
set whichwrap=b,s,h,l,<,>,[,]   " Backspace and cursor keys wrap too
set scrolljump=5                " Lines to scroll when cursor leaves screen
set scrolloff=3                 " Minimum lines to keep above and below cursor
set foldenable                  " Auto fold code
set list
set listchars=tab:›\ ,trail:•,extends:#,nbsp:. " Highlight problematic whitespace

set cursorline                  " Highlight current line

highlight clear SignColumn      " SignColumn should match background
highlight clear LineNr          " Current line number row will have same background color in relative mode

set ruler                       " Show the ruler
set rulerformat=%30(%=\:b%n%y%m%r%w\ %l,%c%V\ %P%) " A ruler on steroids
set showcmd                     " Show partial commands in status line and selected characters/lines in visual mode

" No annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Colors and Fonts
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
syntax on                         " Syntax highlighting
set background=dark               " Assume a dark background
colorscheme solarized             " Use color scheme

if has("gui_running")
  set guifont=Ubuntu\ Mono:h14
  set guioptions-=T               " Disable toolbar
  set guioptions-=L               " Disable left scrollbar
  set guioptions-=r               " Disable right scrollbar
else
  set t_Co=256
  let g:solarized_termcolors=256
  let g:solarized_termtrans=1
  let g:solarized_visibility = "normal"
  let g:solarized_contrast = "normal"
endif

" Set utf8 as standard encoding and en_US as the standard language
set encoding=utf8
" Use Unix as the standard file type
set ffs=unix,dos,mac

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Files, backups and undo
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Turn backup off, since most stuff is in SVN, git etc anyway...
set nobackup
set nowb
set noswapfile

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Text, tab and indent related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nowrap                      " Do not wrap long lines
set autoindent                  " Indent at the same level of the previous line
set shiftwidth=4                " Use indents of 4 spaces
set expandtab                   " Tabs are spaces, not tabs
set tabstop=4                   " An indentation every four columns
set softtabstop=4               " Let backspace delete indent
set nojoinspaces                " Prevents inserting two spaces after punctuation on a join (J)
set splitright                  " Puts new vsplit windows to the right of the current
set splitbelow                  " Puts new split windows to the bottom of the current

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Moving around, tabs, windows and buffers
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Treat long lines as break lines (useful when moving around in them)
map j gj
map k gk

" Map <Space> to / (search) and Ctrl-<Space> to ? (backwards search)
map <space> /
map <c-space> ?

" Disable highlight when <leader><cr> is pressed
map <silent> <leader><cr> :noh<cr>

" Strip away trailing whitespaces on write
autocmd BufWritePre <buffer> call StripTrailingWhitespace()

" Set known filetypes
autocmd BufNewFile,BufReadPost *.styl set filetype=stylus

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Plugins settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""
" => Airline
""""""""""""""""""""""""""""""
if isdirectory(expand("~/.vim/bundle/vim-airline/"))
  " Always show the status line
  set laststatus=2
  " airline options
  let g:airline_theme = 'solarized'
  let g:airline_left_sep='›'  " Slightly fancier than '>'
  let g:airline_right_sep='‹' " Slightly fancier than '<'
endif

""""""""""""""""""""""""""""""
" => Fugitive
""""""""""""""""""""""""""""""
if isdirectory(expand("~/.vim/bundle/vim-fugitive/"))
  nnoremap <silent> <leader>gs :Gstatus<CR>
  nnoremap <silent> <leader>gd :Gdiff<CR>
  nnoremap <silent> <leader>gc :Gcommit<CR>
  nnoremap <silent> <leader>gb :Gblame<CR>
  nnoremap <silent> <leader>gl :Glog<CR>
  nnoremap <silent> <leader>gp :Git push<CR>
  nnoremap <silent> <leader>gr :Gread<CR>
  nnoremap <silent> <leader>gw :Gwrite<CR>
  nnoremap <silent> <leader>ge :Gedit<CR>
  " Mnemonic _interactive
  nnoremap <silent> <leader>gi :Git add -p %<CR>
  nnoremap <silent> <leader>gg :SignifyToggle<CR>
endif

""""""""""""""""""""""""""""""
" => editorconfig-vim
""""""""""""""""""""""""""""""
if isdirectory(expand("~/.vim/bundle/editorconfig-vim/"))
  let g:EditorConfig_exclude_patterns=['fugitive://.*']
endif

""""""""""""""""""""""""""""""
" => ctrlp
""""""""""""""""""""""""""""""
if isdirectory(expand("~/.vim/bundle/ctrlp.vim/"))
  let g:ctrlp_working_path_mode = 'ra'
  nnoremap <silent> <D-t> :CtrlP<CR>
  nnoremap <silent> <D-r> :CtrlPMRU<CR>
  let g:ctrlp_custom_ignore = {
        \ 'dir':  '\.git$\|\.hg$\|\.svn$',
        \ 'file': '\.exe$\|\.so$\|\.dll$\|\.pyc$' }

  if executable('ag')
    let s:ctrlp_fallback = 'ag %s --nocolor -l -g ""'
  elseif executable('ack-grep')
    let s:ctrlp_fallback = 'ack-grep %s --nocolor -f'
  elseif executable('ack')
    let s:ctrlp_fallback = 'ack %s --nocolor -f'
  else
    let s:ctrlp_fallback = 'find %s -type f'
  endif
  let g:ctrlp_user_command = {
        \ 'types': {
        \ 1: ['.git', 'cd %s && git ls-files . --cached --exclude-standard --others'],
        \ 2: ['.hg', 'hg --cwd %s locate -I .'],
        \ },
        \ 'fallback': s:ctrlp_fallback
        \ }

  if isdirectory(expand("~/.vim/bundle/ctrlp-funky/"))
    " CtrlP extensions
    let g:ctrlp_extensions = ['funky']

    "funky
    nnoremap <Leader>fu :CtrlPFunky<Cr>
  endif
endif

""""""""""""""""""""""""""""""
" => TagBar
""""""""""""""""""""""""""""""
if isdirectory(expand("~/.vim/bundle/tagbar/"))
  nnoremap <silent> <leader>tt :TagbarToggle<CR>

  " If using go please install the gotags program using the following
  " go install github.com/jstemmer/gotags
  " And make sure gotags is in your path
  let g:tagbar_type_go = {
        \ 'ctagstype' : 'go',
        \ 'kinds'     : [  'p:package', 'i:imports:1', 'c:constants', 'v:variables',
        \ 't:types',  'n:interfaces', 'w:fields', 'e:embedded', 'm:methods',
        \ 'r:constructor', 'f:functions' ],
        \ 'sro' : '.',
        \ 'kind2scope' : { 't' : 'ctype', 'n' : 'ntype' },
        \ 'scope2kind' : { 'ctype' : 't', 'ntype' : 'n' },
        \ 'ctagsbin'  : 'gotags',
        \ 'ctagsargs' : '-sort -silent'
        \ }
endif

""""""""""""""""""""""""""""""
" => indent_guides
""""""""""""""""""""""""""""""
if isdirectory(expand("~/.vim/bundle/vim-indent-guides/"))
  let g:indent_guides_start_level = 2
  let g:indent_guides_guide_size = 1
  let g:indent_guides_enable_on_vim_startup = 1
endif

""""""""""""""""""""""""""""""
" => syntastic
""""""""""""""""""""""""""""""
if isdirectory(expand("~/.vim/bundle/syntastic/"))
  let g:syntastic_always_populate_loc_list = 1
  let g:syntastic_auto_loc_list = 1
  let g:syntastic_check_on_open = 1
  let g:syntastic_check_on_wq = 0
  " Ignore angular directive lint error
  let g:syntastic_html_tidy_ignore_errors=[" proprietary attribute \"ng-"]
endif

""""""""""""""""""""""""""""""
" => matchit
""""""""""""""""""""""""""""""
if isdirectory(expand("~/.vim/bundle/matchit.zip/"))
  let b:match_ignorecase = 1
endif

""""""""""""""""""""""""""""""
" => nerdtree
""""""""""""""""""""""""""""""
if isdirectory(expand("~/.vim/bundle/nerdtree/"))
  map <C-e> <plug>NERDTreeTabsToggle<CR>
  map <leader>e :NERDTreeFind<CR>
  nmap <leader>nt :NERDTreeFind<CR>

  let NERDTreeShowBookmarks=1
  let NERDTreeIgnore=['\.py[cd]$', '\~$', '\.swo$', '\.swp$', '^\.git$', '^\.hg$', '^\.svn$', '\.bzr$']
  let NERDTreeChDirMode=0
  let NERDTreeQuitOnOpen=1
  let NERDTreeMouseMode=2
  let NERDTreeShowHidden=1
  let NERDTreeKeepTreeInNewTab=1
  let g:nerdtree_tabs_open_on_gui_startup=0
  let g:NERDShutUp=1
endif

""""""""""""""""""""""""""""""
" => ultisnips
""""""""""""""""""""""""""""""
if isdirectory(expand("~/.vim/bundle/YouCompleteMe/"))

  let g:ycm_global_ycm_extra_conf = '~/.vim/.ycm_extra_conf.py'
  let g:ycm_key_list_select_completion=[]
  let g:ycm_key_list_previous_completion=[]

  " remap Ultisnips for compatibility for YCM
  let g:UltiSnipsExpandTrigger='<tab>'
  let g:UltiSnipsJumpForwardTrigger='<tab>'
  let g:UltiSnipsJumpBackwardTrigger='<s-tab>'

  " Enable omni completion.
  autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
  autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
  autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
  autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
  autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
  autocmd FileType ruby setlocal omnifunc=rubycomplete#Complete
  autocmd FileType haskell setlocal omnifunc=necoghc#omnifunc

endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => unimpaired
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if isdirectory(expand("~/.vim/bundle/vim-unimpaired/"))
  " Bubble single lines
  nmap <PageUp>   [e
  nmap <PageDown> ]e

  " Bubble multiple lines
  vmap <PageUp>   [egv
  vmap <PageDown> ]egv
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Helper functions
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if has('clipboard')
  if has('unnamedplus')  " When possible use + register for copy-paste
    set clipboard=unnamed,unnamedplus
  else                   " On mac and Windows, use * register for copy-paste
    set clipboard=unnamed
  endif
endif

" Initialize NERDTree as needed
function! NERDTreeInitAsNeeded()
  redir => bufoutput
  buffers!
  redir END
  let idx = stridx(bufoutput, "NERD_tree")
  if idx > -1
    NERDTreeMirror
    NERDTreeFind
    wincmd l
  endif
endfunction

" Strip whitespace
function! StripTrailingWhitespace()
  " Preparation: save last search, and cursor position.
  let _s=@/
  let l = line(".")
  let c = col(".")
  " do the business:
  %s/\s\+$//e
  " clean up: restore previous search history, and cursor position
  let @/=_s
  call cursor(l, c)
endfunction
