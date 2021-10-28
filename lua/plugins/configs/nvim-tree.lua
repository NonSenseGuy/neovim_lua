local g = vim.g
local tree = require("nvim-tree")

g.nvim_tree_indent_markers = 1
g.nvim_tree_quit_on_open = 1
g.nvim_tree_git_hl = 1
g.nvim_tree_ignore = { ".cache", ".git", "node_modules"}

tree.setup{
  update_focused_file = {
    enable = true
  },

  open_on_setup = false,
  auto_close = true,
  nvim_tree_follow = true
}
