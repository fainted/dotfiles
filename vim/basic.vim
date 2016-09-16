filetype on

syntax on
syntax enable

set number
set nocompatible
set clipboard+=unnamed
set pastetoggle=<F2>
set background=dark
set encoding=utf-8
set fileencodings=ucs-bom,utf-8,cp936,gb18030,big5,euc-jp,euc-kr,latin1,gbk,gb2312
set nobackup
set noswapfile
set mousehide
set backspace=indent,eol,start
set showmatch
set nobackup
set nowritebackup
set noswapfile
set history=10000
set ruler
set cmdheight=1
set showcmd
set showmode
set incsearch
set hlsearch
set ignorecase
set smartcase
set laststatus=2
set colorcolumn=80
set virtualedit=onemore
set fileformat=unix
set hidden
set nowrap
set autoindent
set shiftwidth=4
set expandtab
set tabstop=4
set softtabstop=4
set splitright
set splitbelow
set listchars=tab:▸\ ,trail:.,
set list
set foldenable
set foldmethod=syntax
set foldlevel=99
set mouse=

if has('neovim')
    set termguicolors
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
    let $NVIM_TUI_ENABLE_CURSOR_SHAPE=1
else
    set t_Co=256
endif

