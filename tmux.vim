
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

" split tmux window and open shell in directory of current file
map <Leader>S :call OpenShell()<CR>

let g:tmux_pane = 1
map <Leader>I :call SendSelectionToTmuxPane()<CR>
