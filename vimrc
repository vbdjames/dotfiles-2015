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
Plugin 'Valloric/YouCompleteMe'
Plugin 'editorconfig/editorconfig-vim'

call vundle#end()

let mapleader=","
" syntax enable
filetype plugin indent on
set expandtab
set shiftwidth=4
set softtabstop=4
set relativenumber
set number
set guifont=Source\ Code\ Pro:h15

" autocmd Filetype html setlocal ts=2 sts=2 sw=2

colorscheme solarized
set background=dark
call togglebg#map("<F5>")

set wildignore+=.DS_Store
hi MatchParen guibg=NONE guifg=NONE gui=underline ctermbg=NONE ctermfg=NONE cterm=underline
set ignorecase
set smartcase

let g:UltiSnipsExpandTrigger="<c-tab>"
" let g:UltiSnipsJumpForwardTrigger="<tab>"
" let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
" let g:UltiSnipsEditSplit="vertical"

" Syntastic settings
let g:syntastic_javascript_checkers = ['jscs', 'jshint']
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_aggregate_errors = 1

let g:netrw_bufsettings = 'noma nomod nu nobl nowrap ro'

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

" Yank text to the OS X clipboard
noremap <leader>y "*y
noremap <leader>yy "*Y
" Preserve indentation while pasting text from the OS X clipboard
noremap <leader>p :set paste<CR>:put  *<CR>:set nopaste<CR>

if &term=~'screen-256color' " tmux
    let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
    let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
elseif &term=~'xterm-256color' " terminal
    let &t_SI = "\<Esc>]50;CursorShape=1\x7"
    let &t_EI = "\<Esc>]50;CursorShape=0\x7"
endif

nmap <silent> ,/ :nohlsearch<CR>

