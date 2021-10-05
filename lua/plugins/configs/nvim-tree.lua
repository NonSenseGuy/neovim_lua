local g = vim.g

g.nvim_tree_indent_markers = 1
g.nvim_tree_quit_on_open = 0
g.nvim_tree_auto_open = 1
g.nvim_tree_git_hl = 1
g.nvim_tree_ignore = { ".cache", ".git", "node_modules"}
g.nvim_tree_follow = 1

require('nvim_tree').setup{
  update_focused_file = {
    enable = true
  }

  open_on_setup = false
  lsp_diagnostics = true
  auto_close = true
}
