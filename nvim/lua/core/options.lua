local g = vim.g       -- Global variables
local opt = vim.opt   -- Set options (global/buffer/windows-scoped)

-- OPTIONS
opt.mouse = 'a'
opt.ignorecase = true
opt.smartcase = true
opt.hlsearch = false
opt.incsearch = true
opt.wrap = true
opt.breakindent = true
opt.shiftwidth = 2
opt.expandtab = false
opt.undofile = true
opt.scrolloff = 8
opt.ignorecase = true
opt.cursorline = true
-- opt.hidden  = true
opt.number = true
opt.title = true
opt.ttimeoutlen = 0
opt.wildmenu = true

-- TABLUTATIONS
opt.expandtab = true
opt.shiftwidth = 2

-- SYTEM CLIPBOARD
vim.opt.clipboard = 'unnamed'

