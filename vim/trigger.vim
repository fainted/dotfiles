" 配置文件修改后自动重新载入
autocmd! BufWritePost *.vim source ~/.config/nvim/init.vim

" 跳转至上次修改位置
autocmd BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$")    |
    \     exe "normal! g`\""                            |

autocmd! BufWritePost,InsertLeave,WinEnter * set relativenumber
autocmd! InsertEnter,WinLeave * set norelativenumber

autocmd VimEnter,InsertLeave,WinEnter * :set cursorline
autocmd InsertEnter,WinLeave * :set nocursorline
