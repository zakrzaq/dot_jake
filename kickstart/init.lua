vim.g.mapleader = ' '
vim.g.maplocalleader = ' '


require 'plugins.lazy'
require 'plugins.telescope'
require 'plugins.lsp'
require 'plugins.treesitter'
require 'plugins.completion'
require 'plugins.null_ls'
require 'plugins.neotree'


require 'config.options'
require 'config.keymaps'
require 'config.autocmds'


-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et
