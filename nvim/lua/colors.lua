local color_theme = 'nightfox'
-- local color_theme = 'slate'

vim.g.t_co = 256
vim.opt.termguicolors = true
vim.cmd(string.format('colorscheme %s', color_theme))

