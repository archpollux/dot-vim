"set shell=bash

source ~/.vim/plugins.vim

syntax on
colors koehler
set background=dark
set showmatch
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

let maplocalleader = "-"

map <Leader>\| :vs<CR>
map <Leader>- :sp<CR>
map <Leader>h :let @/=""<CR>

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

nnoremap  :set paste!<CR>
nnoremap <F2> :w<CR>

"let g:user_emmet_leader_key='<Tab>'
let g:user_emmet_settings = {
  \  'javascript.jsx' : {
    \      'extends' : 'jsx',
    \  },
  \}

let g:splice_initial_diff_grid = 1
