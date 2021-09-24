local g = vim.g
local opt = vim.opt

vim.cmd([[
  filetype plugin on
  au FileType * set fo-=c fo-=r fo-=o fo+=j fo+=n
  au! VimResized * wincmd =
  if exists('$TMUX')
    let &t_SI = "\ePtmux;\e\e[6 q\e\\"
    let &t_SR = "\ePtmux;\e\e[4 q\e\\"
    let &t_EI = "\ePtmux;\e\e[2 q\e\\"
  else
    let &t_SI = "\<Esc>[6 q"
    let &t_SR = "\<Esc>[4 q"
    let &t_EI = "\<Esc>[2 q"
  endif
]])


g.encoding         = "utf8"
opt.belloff        = "all"               -- Turn off sounds on nvim
opt.ignorecase = true
opt.ruler          = false
opt.showmode       = false
opt.termguicolors  = true
opt.mouse          = "a"
opt.number         = true
opt.relativenumber = true
opt.hidden         = true
opt.backspace      = "eol,start,indent"
opt.updatetime     = 300
opt.joinspaces     = false               -- don't autoinsert two spaces after punctuation
opt.scrolloff      = 3                   -- start scrolling 3 lines before edge of viewport
opt.sidescrolloff  = 3                   -- start scrolling 3 lines before edge of column viewport
opt.splitbelow     = true                -- open horizontal splits below current window
opt.splitright     = true                -- open vertical splits to the right current window
opt.wildmode       = 'longest:full,full' -- shell-like autocomplete to unambiguous portion
opt.wildignore     = opt.wildignore + '*.o,*.rej,*.so' -- patterns to ignore in navigation

-- Tab and indentation
opt.shiftwidth     = 2
opt.tabstop        = 2
opt.expandtab      = true
opt.smarttab       = true
opt.autoindent     = true
opt.smartindent    = true

-- Search
opt.hlsearch       = true
opt.incsearch      = true

--
-- Characters
--
opt.joinspaces     = false       -- don't autoinsert two spaces after '.', '?', '!' for join command
opt.laststatus     = 2           -- always show status line
opt.lazyredraw     = true        -- don't bother updating screen during macro playback
opt.linebreak      = true        -- wrap long lines at characters in 'breakat'
opt.breakindent    = true        -- Indent wrap text
opt.showbreak      = '↳ '        -- DOWNWARDS ARROW WITH TIP RIGHTWARDS (U+21B3)
opt.list           = true        -- show whitespace and everything on the listchars
opt.listchars      = {
  nbsp             = '⦸',        -- CIRCLED REVERSE SOLIDUS (U+29B8)
  extends          = '»',        -- RIGHT-POINTING DOUBLE ANGLE QUOTATION MARK (U+00BB)
  precedes         = '«',        -- LEFT-POINTING DOUBLE ANGLE QUOTATION MARK (U+00AB)
  tab              = ' →',       -- SPACE + RIGHTWARDS ARROW (U+2192)
  trail            = '•',        -- MIDDLE BULLET (U+2022)
}

opt.diffopt        = opt.diffopt + 'foldcolumn:0'  -- don't show fold column in diff view.
opt.fillchars      = {
  diff             = '∙',        -- BULLET OPERATOR (U+2219)
  eob              = ' ',        -- NO-BREAK SPACE (U+00A0) to suppress ~ at EndOfBuffer
  fold             = '·',        -- MIDDLE DOT (U+00B7)
  vert             = '┃',        -- BOX DRAWINGS HEAVY VERTICAL (U+2503)
}

opt.shortmess      = opt.shortmess
  + 'I' -- no splash screen
  + 'T' -- truncate non-file messages in middle
  + 'W' -- don't echo "[w]"/"[written]" when writing
  + 'a' -- Abreviations eg. `[RO]` instead of `[readonly]`
  + 't' -- truncate file messages at start
  + 'c' -- completion messages
