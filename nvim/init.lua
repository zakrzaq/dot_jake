require("core.packer")

require("plugins")

require('plugins.mason')
require('plugins.autocomplete')
require('plugins.bufferline')
require('plugins.indent-blank')
require('plugins.lualine')
require('plugins.null-ls')
require('plugins.nvim-tree')
require('plugins.toggleterm')
require('plugins.treesitter')

require('lsp.lsp')

require('core.autocommand')
require('core.options')
require('core.keymaps')
require('core.colors')
