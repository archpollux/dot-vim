function CopyAndEdit(cmd)
  let s:fname = expand("%:p:h") . '/' . input("New file name:", expand("%:p:t"))
  execute "silent !cp " . expand("%:p") . " " . s:fname
  execute a:cmd . ' ' . s:fname
  execute "redraw!"
endfunction

" open directory of current file
nnoremap <Leader>> :execute("sp " . expand("%:p:h"))<CR>
nnoremap <Leader>. :execute("e " . expand("%:p:h"))<CR>

" create new file in directory of current file
nnoremap <Leader>n :execute("sp " . expand("%:p:h") . "/" . input("New file name:"))<CR>
nnoremap <Leader>N :execute("vsp " . expand("%:p:h") . "/" . input("New file name:"))<CR>

" copy current file to a new file in the same directory and open it
nnoremap <Leader>c :call CopyAndEdit("sp")<CR>
nnoremap <Leader>C :call CopyAndEdit("vsp")<CR>
