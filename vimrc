"set shell=bash
set nocompatible
filetype off

set rtp+=~/.vim/bundle/vundle
call vundle#rc()

Plugin 'gmarik/vundle'


"Plugin 'wincent/Command-T'
Plugin 'kien/ctrlp.vim'
Plugin 'Shougo/vimproc'
Plugin 'Shougo/unite.vim'
Plugin 'sgur/unite-git_grep'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/syntastic'
Plugin 'Lokaltog/vim-easymotion'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-surround'
Plugin 'digitaltoad/vim-jade'
Plugin 'wavded/vim-stylus'
"Plugin 'airblade/vim-gitgutter'
Plugin 'nono/vim-handlebars'
Plugin 'derekwyatt/vim-scala'
Plugin 'lmeijvogel/vim-yaml-helper'
Plugin 'epage/vim-autohighlight'
Plugin 'kchmck/vim-coffee-script'
Plugin 'bling/vim-airline'
Plugin 'sjl/splice.vim'
Plugin 'kmnk/vim-unite-giti'
Plugin 'pangloss/vim-javascript'
Plugin 'mxw/vim-jsx'

filetype plugin indent on

syntax on

colors koehler
set background=dark
set showmatch
set nohlsearch
set noignorecase
set wrap
set nobk
set showtabline=2
set number

"set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [ASCII=\%03.3b]\ [HEX=\%02.2B]\ [POS=%04l,%04v][%p%%]\ [LEN=%L]\ %{fugitive#statusline()}
"set statusline=%t%m%r%h%w\ [%Y]\ [%04l,%04v][%p%%]\ %{fugitive#statusline()}
set laststatus=2
let g:airline#extensions#tabline#enabled = 1

source ~/.vim/dirsnfiles.vim
source ~/.vim/filefind.vim
source ~/.vim/tabs.vim
source ~/.vim/tmux.vim
source ~/.vim/yaml.vim
source ~/.vim/vcs.vim

function ChangeDirToCurrBuffer()
  au BufEnter * execute ":lcd " . expand("%:p:h")
endfunction

au BufEnter *.pl,*.pm,*.t,*.rb,*.haml,*.sass set expandtab tabstop=2 shiftwidth=2 autoindent smartindent nocindent
au BufEnter *.js,*.json set ft=javascript expandtab tabstop=2 shiftwidth=2 autoindent smartindent nocindent
au BufEnter *.html.ep set ft=html expandtab tabstop=2 shiftwidth=2 autoindent smartindent nocindent

let maplocalleader = "-"

map <Leader>\| :vs<CR>
map <Leader>- :sp<CR>
map <Leader>H :set hlsearch<CR>
map <Leader>h :set nohlsearch<CR>

map <Leader>1 ^
map <Leader>2 $

set hls
set nobackup noswapfile
set virtualedit=block
set wildmode=longest,list

nnoremap Q <nop>
"nnoremap n nzz

"set cursorline cursorcolumn
hi CursorLine cterm=reverse
hi CursorColumn cterm=reverse

set mouse=h

nnoremap <Leader>f :Unite -start-insert file_rec<CR>
nnoremap <Leader>b :Unite -start-insert buffer<CR>
nnoremap <Leader>r :UniteResume<CR>

let g:syntastic_javascript_jshint_config=2

nnoremap @s1 :tabn 1<CR>
nnoremap @s2 :tabn 2<CR>
nnoremap @s3 :tabn 3<CR>
nnoremap @s4 :tabn 4<CR>
nnoremap @s5 :tabn 5<CR>
nnoremap @s6 :tabn 6<CR>
nnoremap @s7 :tabn 7<CR>
nnoremap @s8 :tabn 8<CR>
nnoremap @s9 :tabn 9<CR>
nnoremap @s0 :tabn 0<CR>
nnoremap @st :tabe<CR>
nnoremap @sw :tabclose<CR>

nnoremap  :set paste!<CR>
