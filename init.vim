"Neovim init file

let s:vimdir = fnamemodify(resolve(expand('<sfile>:p')), ':h')
exec 'source ' . s:vimdir . '/vimrc'
"exec 'source ' . s:vimdir . '/vimrc'

map <F2> :w<CR>
