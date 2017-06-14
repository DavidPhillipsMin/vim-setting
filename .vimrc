" Syntax Highlighting
if has("syntax")
    syntax on
endif

set tabstop=4
set shiftwidth=4
set expandtab
set wrap
set number
set smartindent
set hlsearch
set ignorecase


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" for Vundle
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
    " alternatively, pass a path where Vundle should install plugins
    "call vundle#begin('~/some/path/here')

    " let Vundle manage Vundle, required
    Plugin 'gmarik/Vundle.vim'

    " The following are examples of different formats supported.
    " Keep Plugin commands between vundle#begin/end.
    " plugin on GitHub repo
    "Plugin 'tpope/vim-fugitive'
    " plugin from http://vim-scripts.org/vim/scripts.html
    "Plugin 'L9'
    " Git plugin not hosted on GitHub
    "Plugin 'git://git.wincent.com/command-t.git'
    " git repos on your local machine (i.e. when working on your own plugin)
    "Plugin 'file:///home/gmarik/path/to/plugin'
    " The sparkup vim script is in a subdirectory of this repo called vim.
    " Pass the path to set the runtimepath properly.
    "Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
    " Avoid a name conflict with L9
    "Plugin 'user/L9', {'name': 'newL9'}

    " All of your Plugins must be added before the following line

    Plugin 'molokai'
    Plugin 'The-NERD-tree'
    Plugin 'taglist.vim'
    Plugin 'Source-Explorer-srcexpl.vim'
    Plugin 'Valloric/YouCompleteMe'

call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set t_Co=256
colorscheme molokai

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" for Tlist
let Tlist_Ctags_Cmd="/usr/bin/ctags"
" 태그 범위(함수, 매크로, 구조체)를 표시한다.
let Tlist_Display_Tag_Scope=1
" 함수 원형을 표시한다.
let Tlist_Display_Prototype=1
" 태그 리스트를 솟 코드 위치 순서가 아닌 이름 순서로 표시한다.
let Tlist_Sort_Type="name"
" 태그 리스트 창을 오른쪽에 표시한다.
let Tlist_Use_Right_Window=1
" 태그 리스트 창의 폭을 65문자로 지정한다.
let Tlist_WinWidth=65

if filereadable("./tags")
    set tags+=./tags
endif

" :Tilst
map <F8> :Tlist<cr>
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" for NERDTree
map <F7> :NERDTreeToggle<cr>
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" for compile with gcc
set makeprg=g++\ -o\ %<\ %
map <c-b> :w<cr> :make<cr>
map <c-r> :!./%<<cr>
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" for cscope
set csprg=/usr/bin/cscope
set csto=0
set cst
set nocsverb

if filereadable("./cscope.out")
    cs add cscope.out
endif
set csverb
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" dpmin: save and retagging
map <F2> :w<cr> :!ctags -R --c++-kinds=+pl --fields=+iaS --extra=+q .<cr><cr>

" dpmin: Jump tab
map <F10> <c-w><c-w>
map <F5> <c-w><c-f>
nnoremap <F11> <c-t>
nnoremap <F12> <c-]>

" dpmin: search word
map <F3> *
map [25~ #
map <F4> /<c-r><c-a><cr>
" clear highlighting on return in normal mode
nnoremap <cr> :noh<cr><cr>
