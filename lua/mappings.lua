local function map(mode, lhs, rhs, opts)
  local options = { noremap = true, silent = true }
  if opts then
    options = vim.tbl_extend("force", options, opts)
  end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

local opt = {  }

vim.cmd([[
  xnoremap <expr> k (v:count == 0 ? 'gk' : 'k')
  xnoremap <expr> j (v:count == 0 ? 'gj' : 'j')
  nnoremap <expr> k (v:count == 0 ? 'gk' : 'k')
  nnoremap <expr> j (v:count == 0 ? 'gj' : 'j')
  xnoremap <C-h> <C-w>h
  xnoremap <C-j> <C-w>j
  xnoremap <C-k> <C-w>k
  xnoremap <C-l> <C-w>l
  nnoremap <silent> <Tab> @=(foldlevel('.')?'za':"\<Tab>")<CR>
  noremap <Leader>y "+y
]])

-- ESC for turning off highlight search
map("n", "<C-l>", ":nohl<CR>", opt)

-- nvim-tree
map("n", "<Leader>tt", ":NvimTreeToggle<CR>", opt)
map("n", "<Leader>tf", ":NvimTreeFindFile<CR>", opt)
map("n", "<F6>", ":NvimTreeRefresh<CR>", opt)

-- Telescope
map("n", "<Leader>ff", ":Telescope find_files<CR>", opt)
map("n", "<Leader>fg", ":Telescope live_grep<CR>", opt)
map("n", "<Leader>fh", ":Telescope help_tags<CR>", opt)
map("n", "<Leader>fb", ":Telescope buffers<CR>", opt)

-- Ultisnips
-- map("n", "<Leader>u", ":UltiSnipsEdit<CR>", opt)

-- Consistent movement
map("n", "gh", "^", opt)
map("n", "gl", "$", opt)
map("v", "gh", "^", opt)
map("v", "gl", "$", opt)

-- Buffers
map("n", "<Leader>bn", ":bn<CR>", opt)
map("n", "<Leader>bp", ":bp<CR>", opt)
map("n", "<Leader>d", ":bd<CR>", opt)
map("n", "<Leader><Leader>", "<C-^>", opt)
map("n", "<Leader>L", "<C-w>L",opt)

-- Edit tabulation on visual mode more easily
map("v", "<", "<gv", opt)
map("v", ">", ">gv", opt)

-- Jump quickfix list
map("n", "<C-p>", ":cprevious<CR>", opt)
map("n", "<C-n>", ":cnext<CR>", opt)
map("n", "<Left>", ":cpfile<CR>", opt)
map("n", "<Right>", ":cnfile<CR>", opt)
map("n", "<leader>a", ":cclose<CR>", opt)
map("n", "<leader>aa", ":ccopen<CR>", opt)

-- Command 'TrimSpaces' well... it's self-explanatory what this those
vim.cmd([[
  function TrimWhiteSpace()
    %s/\s*$//
    ''
  endfunction
  command! -bar -nargs=0 TrimSpaces call TrimWhiteSpace()
]])

