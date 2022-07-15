let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/bundle')

Plug 'junegunn/vim-plug'
Plug 'VundleVim/Vundle.vim'
Plug 'kien/ctrlp.vim'
Plug 'Shougo/vimproc'
Plug 'Shougo/unite.vim'
Plug 'sgur/unite-git_grep'
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/syntastic'
Plug 'Lokaltog/vim-easymotion'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-dispatch'
Plug 'digitaltoad/vim-jade'
Plug 'wavded/vim-stylus'
Plug 'nono/vim-handlebars'
Plug 'derekwyatt/vim-scala'
Plug 'lmeijvogel/vim-yaml-helper'
"Plug 'epage/vim-autohighlight'
"Plug 'kchmck/vim-coffee-script'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'sjl/splice.vim'
Plug 'kmnk/vim-unite-giti'
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx-improve'
Plug 'Quramy/tsuquyomi'
Plug 'HerringtonDarkholme/yats.vim'
Plug 'mattn/emmet-vim'
Plug 'cakebaker/scss-syntax.vim'
Plug 'sheerun/vim-polyglot'
Plug 'neoclide/coc.nvim', {'branch': 'release'}

call plug#end()
