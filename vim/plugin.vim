call plug#begin('~/.config/nvim/bundle')

Plug 'Chiel92/vim-autoformat'
Plug 'Yggdroot/indentLine'
Plug 'chriskempson/base16-vim'
Plug 'fatih/vim-go'
Plug 'godlygeek/tabular'
Plug 'junegunn/rainbow_parentheses.vim'
Plug 'kien/ctrlp.vim'
Plug 'kien/tabman.vim'
Plug 'majutsushi/tagbar', { 'on': 'TagbarToggle' }
Plug 'mattn/emmet-vim'
Plug 'mhinz/vim-signify'
Plug 'mileszs/ack.vim'
Plug 'morhetz/gruvbox'
Plug 'roxma/vim-tmux-clipboard'
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'terryma/vim-multiple-cursors'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'w0rp/ale'

if has('neovim')    " 兼容vim
    Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
    Plug 'zchee/deoplete-jedi'
endif

call plug#end()

" colorscheme
silent! colorscheme gruvbox
let g:gruvbox_contrast_dark = 'soft'

" airline theme
let g:airline_theme = 'wombat'

" NERDTree
noremap <F5> :NERDTreeToggle<CR>
let g:nerdtree_tabs_focus_on_files=1
let g:NERDTreeShowBookmarks=1

" tagbar
map <F4> :TagbarToggle<CR>
let g:tagbar_autofocus = 1

" ack.vim
let g:ackprg = 'ag --nogroup --nocolor --column'

" deoplete
if has('neovim')
    let g:deoplete#enable_at_startup = 1
endif

" rainbow parentheses
" autocmd! BufReadPre * RainbowParenthesesToggle

" vim-autoformat
noremap <F3> :Autoformat<CR>
let g:autoformat_autoindent = 0
let g:autoformat_retab = 0
let g:autoformat_remove_trailing_spaces = 1

" vim-multiple-cursors
let g:multi_cursor_use_default_mapping=0
noremap <leader>mc :MultipleCursorsFind<SPACE>

" vim-go
let g:go_version_warning = 0

" TODO nerdcommenter
