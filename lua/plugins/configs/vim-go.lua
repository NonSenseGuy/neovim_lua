vim.g.go_def_mapping_enabled = 0
vim.g.go.gopls_options = ['--remote=auto']

vim.cmd([
  Filetype go command! -bang A call go#alternate#Switch(<bang>0, 'edit')
  Filetype go command! -bang AV call go#alternate#Switch(<bang>0, 'vsplit')
  Filetype go command! -bang AS call go#alternate#Switch(<bang>0, 'split')
  Filetype go command! -bang AT call go#alternate#Switch(<bang>0, 'tabe')
])
