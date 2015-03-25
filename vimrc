set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'

Plugin 'kien/ctrlp.vim'
Plugin 'Shutnik/jshint2.vim'
Plugin 'altercation/vim-colors-solarized'
Plugin 'twerth/ir_black'
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-jdaddy'
Plugin 'elzr/vim-json'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-sensible'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-vinegar'
Plugin 'scrooloose/syntastic'
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'

call vundle#end()

let mapleader=","
" syntax enable
filetype plugin indent on
set expandtab
set shiftwidth=4
set softtabstop=4
set relativenumber
set number

colorscheme solarized
set background=dark
call togglebg#map("<F5>")

hi MatchParen guibg=NONE guifg=NONE gui=underline ctermbg=NONE ctermfg=NONE cterm=underline

let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
let g:UltiSnipsEditSplit="vertical"

" ctrlp configuration
" let g:ctrlp_max_files=0

" NERDTree configuration
" map <silent> <C-n> :NERDTreeToggle<CR> 
" let NERDTreeHijackNetrw=1

set nobackup
set noswapfile

map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l
nmap <leader>ss<left>  :topleft vnew<CR>
nmap <leader>ss<right> :botright vnew<CR>
nmap <leader>ss<up>    :topleft new<CR>
nmap <leader>ss<down>  :botright new<CR>
nmap <leader>s<left>   :leftabove vnew<CR>
nmap <leader>s<right>  :rightbelow vnew<CR>
nmap <leader>s<up>     :leftabove new<CR>
nmap <leader>s<down>   :rightbelow new<CR>

nmap <silent> ,/ :nohlsearch<CR>

