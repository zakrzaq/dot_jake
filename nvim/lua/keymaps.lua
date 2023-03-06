-- KEYS
vim.keymap.set('n', '<space>w', '<cmd>write<cr>', {desc = 'Save'})
vim.keymap.set('n', '<C-s>', '<cmd>EslintFixAll<cr><cmd>write<cr>')
vim.keymap.set({ 'n', 'v' }, '<C-c>', '"*y')
vim.keymap.set({ 'n', 'v' }, '<C-y>', '"+y')
vim.keymap.set({ 'n', 'v' }, '<C-l>', '"+p')
vim.keymap.set({ 'n', 'x' }, 'x', '"_x')
vim.keymap.set({ 'n' }, '<C-k>', ':noh<cr>')
vim.keymap.set('n', '<C-r>', '<cmd>NvimTreeToggle<cr>')
vim.keymap.set('n', '<space>b', '<cmd>Telescope buffers<cr>')
vim.keymap.set('n', '<space>?', '<cmd>Telescope oldfiles<cr>')
vim.keymap.set('n', '<C-o>', '<cmd>Telescope find_files<cr>')
vim.keymap.set('n', '<C-p>', ':Telescope git_files<cr>')
vim.keymap.set('n', '<C-f>', '<cmd>Telescope current_buffer_fuzzy_find<cr>')
vim.keymap.set('n', '<space>f', '<cmd>Telescope live_grep<cr>')
vim.keymap.set('n', '<C-d>', '<cmd>Telescope diagnostics<cr>')
vim.keymap.set('n', '<space>d', '<cmd>Telescope diagnostics bufnr=0<cr>')
vim.keymap.set('n', '<C-q>', '<cmd>Bdelete<CR>')
vim.keymap.set('n', '<space>q', '<cmd>qa!<CR>')
vim.keymap.set('n', '<C-a>', 'ggVG')
vim.keymap.set('n', '<A-.>', ':m .-2<CR>==')
vim.keymap.set('n', '<A-,>', ':m .+1<CR>==')
vim.keymap.set('n', '<A-.>', ":m '<-2<CR>gv=gv")
vim.keymap.set({'n', 't'}, '<A-h>', '<CMD>NavigatorLeft<CR>')
vim.keymap.set({'n', 't'}, '<A-l>', '<CMD>NavigatorRight<CR>')
vim.keymap.set({'n', 't'}, '<A-j>', '<CMD>NavigatorUp<CR>')
vim.keymap.set({'n', 't'}, '<A-k>', '<CMD>NavigatorDown<CR>')
vim.keymap.set({'n', 't'}, '<A-p>', '<CMD>NavigatorPrevious<CR>')
-- vim.keymap.set('n', '<A-h>', '<C-w>h')
-- vim.keymap.set('n', '<A-j>', '<C-w>j')
-- vim.keymap.set('n', '<A-k>', '<C-w>k')
-- vim.keymap.set('n', '<A-l>', '<C-w>l')
vim.keymap.set('n', '<C-]>', '<cmd>:bn<CR>')
vim.keymap.set('n', '<C-[>', '<cmd>:bp<CR>')


