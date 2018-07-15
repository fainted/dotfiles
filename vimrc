" --------------------------------- 基础设置 ----------------------------------
filetype on

syntax on
syntax enable

" 文件/编码
set encoding=utf-8
set fileencodings=ucs-bom,utf-8,cp936,gb18030,big5,euc-jp,euc-kr,latin1,gbk,gb2312
set nobackup
set noswapfile
set nowritebackup
set nocompatible
set fileformat=unix
set hidden

" 布局
set number
set mouse=
set backspace=2
set cmdheight=1
set showcmd
set showmode
set ruler
set history=10000
set backspace=indent,eol,start
set mousehide
set background=dark
set laststatus=2
set nowrap
set colorcolumn=80,120

" 匹配
set ignorecase
set incsearch
set smartcase
set hlsearch

" 代码编辑
set expandtab
set shiftwidth=4
set tabstop=4
set autoindent
set cindent
set foldenable
set foldmethod=syntax
set foldlevel=99
set listchars=tab:▸\ ,trail:.,
set list

" 多窗口
set splitright
set splitbelow

" 特殊
set clipboard+=unnamed
set pastetoggle=<F2>
" -----------------------------------------------------------------------------

" 跳转至上次修改位置
autocmd BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$")    |
    \     exe "normal! g`\""                            |

" ----------------------------------按键映射 ----------------------------------
let mapleader=','

" 快速折叠
nnoremap <space> za
vnoremap <space> zf

" 可见块移动
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '>-2<CR>gv=gv

nnoremap <CR>   i<CR><ESC>  " 折行
noremap <UP>    <C-W>+      " 垂直方向 拉大窗口
noremap <DOWN>  <C-W>-      " 垂直方向 缩小窗口
noremap <LEFT>  <C-W><      " 向左拉伸窗口
noremap <RIGHT> <C-W>>      " 向右拉伸窗口

" 快速退出
noremap <Leader>q :quit<CR>
noremap <Leader>a :qa<CR>

" Ctrl + h/j/k/l 选择窗口
noremap <C-j> <C-W>j
noremap <C-k> <C-W>k
noremap <C-l> <C-W>l
noremap <C-h> <C-W>h

" 快速移动
noremap H ^
noremap L g_

" 方便输入命令
nnoremap ; :
" -----------------------------------------------------------------------------

" --------------------------------- 区域高亮 ----------------------------------
highlight TrailingBlank ctermbg=red guibg=red   " 高亮行尾空白字符
match TrailingBlank /\s\+$/

highlight CursorLine    NONE
highlight CursorLine    cterm=underline ctermbg=NONE ctermfg=NONE
highlight ColorColumn   cterm=standout ctermbg=236 ctermfg=yellow

highlight ErrorMsg      cterm=NONE ctermbg=black   ctermfg=red
highlight Search        cterm=NONE ctermbg=green   ctermfg=black
highlight Fold          cterm=NONE ctermbg=green   ctermfg=black
" -----------------------------------------------------------------------------

" --------------------------------- 自动加载 ----------------------------------
" 跳转至上次修改位置
autocmd BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$")    |
    \     exe "normal! g`\""                            |

" 保存文件时自动删除行尾空白
autocmd BufWritePre * :%s/\s\+$//e

autocmd! BufWritePost,InsertLeave,WinEnter * set relativenumber
autocmd! InsertEnter,WinLeave * set norelativenumber

autocmd VimEnter,InsertLeave,WinEnter * :set cursorline
autocmd InsertEnter,WinLeave * :set nocursorline

autocmd Filetype *sh,*html*,javascript,css,sql
    \ setlocal tabstop=2 shiftwidth=2 softtabstop=2 |

autocmd Filetype c,cpp,py
    \ setlocal tabstop=4 shiftwidth=4 softtabstop=4 |

autocmd Filetype go
    \ setlocal tabstop=4 shiftwidth=4 softtabstop=4 noexpandtab |
" -----------------------------------------------------------------------------
