function GotoYamlKey()
  let s:yaml_key = input("YAML key:")
  execute ":YamlGoToKey " . s:yaml_key
endfunction

:map <Leader>y :call GotoYamlKey()<CR>
:map <Leader>Y :YamlGetFullPath<CR>
