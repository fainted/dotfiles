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

" 快速保存
noremap <C-Z> :update<CR>
vnoremap <C-Z> <C-C>:update<CR>
inoremap <C-Z> <C-O>:update<CR>

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

" 复制到系统剪切板
" vnoremap <C-c> "*y<CR>

let mapleader=','
