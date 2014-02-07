set shell=bash
set nocompatible
filetype off

set rtp+=~/.vim/bundle/vundle
call vundle#rc()

Bundle 'gmarik/vundle'


Bundle 'wincent/Command-T'
Bundle 'scrooloose/nerdtree'
"Bundle 'scrooloose/syntastic'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'tpope/vim-fugitive'
Bundle 'digitaltoad/vim-jade'
Bundle 'wavded/vim-stylus'
Bundle 'airblade/vim-gitgutter'
"Bundle "dag/vim-fish"
Bundle "nono/vim-handlebars"
Bundle "derekwyatt/vim-scala"
Bundle "lmeijvogel/vim-yaml-helper"

filetype plugin indent on

syntax on

colors evening
set background=dark
set showmatch
set nohlsearch
set noignorecase
set wrap
set nobk
set showtabline=2
set number

"set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [ASCII=\%03.3b]\ [HEX=\%02.2B]\ [POS=%04l,%04v][%p%%]\ [LEN=%L]\ %{fugitive#statusline()}
set statusline=%t%m%r%h%w\ [%Y]\ [%04l,%04v][%p%%]\ %{fugitive#statusline()}
set laststatus=2

"au BufEnter * execute ":lcd " . expand("%:p:h")

let g:CommandTMaxHeight=20
let g:CommandTMaxCachedDirectories=0
let g:CommandTMaxDepth=100
let g:Grep_Find_Use_Xargs=0

au BufEnter *.pl,*.pm,*.t,*.rb,*.haml,*.sass set expandtab tabstop=2 shiftwidth=2 autoindent smartindent nocindent
au BufEnter *.js,*.json set ft=javascript expandtab tabstop=2 shiftwidth=2 autoindent smartindent nocindent
au BufEnter *.html.ep set ft=html expandtab tabstop=2 shiftwidth=2 autoindent smartindent nocindent

function SwitchToTabN()
  let s:tab_nr = input("Switch to tab:")

  if s:tab_nr == '0'
          s:tab_nr = '1'
  endif

  if s:tab_nr == 'n'
    exe "tabnext"
  elseif s:tab_nr == 'p'
    exe "tabprevious"
  elseif s:tab_nr == 't'
          exe "tabfirst"
          exe "tabp"
          exe "tabe"
  else
          exe "tabn " . s:tab_nr
  endif
endfunction

function CopyAndEdit(cmd)
  let s:fname = expand("%:p:h") . '/' . input("New file name:", expand("%:p:t"))
  execute "silent !cp " . expand("%:p") . " " . s:fname
  execute a:cmd . ' ' . s:fname
  execute "redraw!"
endfunction

function OpenShell()
  execute "silent !tmux split-window -h -c " . expand("%:p:h")
  execute "redraw!"
endfunction

function Get_visual_selected_lines()
  let [lnum1, col1] = getpos("'<")[1:2]
  let [lnum2, col2] = getpos("'>")[1:2]
  let lines = getline(lnum1, lnum2)
  let lines[-1] = lines[-1][: col2 - 2]
  let lines[0] = lines[0][col1 - 1:]
  return lines
endfunction

function Get_visual_selection()
  return join(Get_visual_selected_lines(), "\n")
endfunction

function SendToTmuxPane(lines, pane)
  for s:line in a:lines
    execute "silent !tmux send-keys -t " . a:pane . " '" . s:line . "' C-m"
  endfor
  execute "redraw!"
endfunction

function SendSelectionToTmuxPane() range
  let s:lines = Get_visual_selected_lines()
  call SendToTmuxPane(s:lines, g:tmux_pane)
endfunction

map <Leader>` :call SwitchToTabN()<CR>

" open directory of current file
map <Leader>. :execute("sp " . expand("%:p:h"))<CR>
map <Leader>> :execute("e " . expand("%:p:h"))<CR>

" create new file in directory of current file
map <Leader>n :execute("sp " . expand("%:p:h") . "/" . input("New file name:"))<CR>
map <Leader>N :execute("vsp " . expand("%:p:h") . "/" . input("New file name:"))<CR>

" copy current new file to a new file in the same directory and open it
map <Leader>c :call CopyAndEdit("sp")<CR>
map <Leader>C :call CopyAndEdit("vsp")<CR>

" split tmux window and open shell in directory of current file
map <Leader>S :call OpenShell()<CR>

let g:tmux_pane = 1
map <Leader>I :call SendSelectionToTmuxPane()<CR>

map <Leader>\| :vs<CR>
map <Leader>- :sp<CR>
map <Leader>H :set hlsearch<CR>
map <Leader>h :set nohlsearch<CR>

map <Leader>g :Gstatus<CR>

map <Leader>1 ^
map <Leader>2 $

set hls
set nobackup noswapfile
set virtualedit=block
set wildmode=longest,list

nnoremap Q <nop>
nnoremap n nzz

function MyTabLine()
  let s = ''
  for i in range(tabpagenr('$'))
    " select the highlighting
    if i + 1 == tabpagenr()
      let s .= '%#TabLineSel#'
    else
      let s .= '%#TabLine#'
    endif

    " set the tab page number (for mouse clicks)
    let s .= '%' . (i + 1) . 'T'

    " the label is made by MyTabLabel()
    let s .= ' %{MyTabLabel(' . (i + 1) . ')} '
  endfor

  " after the last tab fill with TabLineFill and reset tab page nr
  let s .= '%#TabLineFill#%T'

  " right-align the label to close the current tab page
  if tabpagenr('$') > 1
    let s .= '%=%#TabLine#%999Xclose'
  endif

  return s
endfunction

function MyTabLabel(n)
  let buflist = tabpagebuflist(a:n)
  let winnr = tabpagewinnr(a:n)
  return fnamemodify(bufname(buflist[winnr - 1]), ':t')
endfunction


set tabline=%!MyTabLine()
hi TabLineSel term=reverse cterm=reverse
hi TabLineFill term=bold cterm=bold

"set cursorline cursorcolumn
hi CursorLine cterm=reverse
hi CursorColumn cterm=reverse

set mouse=a
