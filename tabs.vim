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

nnoremap <Leader>` :call SwitchToTabN()<CR>

"set tabline=%!MyTabLine()
"hi TabLineSel term=reverse cterm=reverse
"hi TabLineFill term=bold cterm=bold

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
