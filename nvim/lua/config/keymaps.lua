vim.g.mapleader = " "

vim.keymap.set("n", "<leader>pv", vim.cmd.Explore)

-- move selected up/donw
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- center screen when searching/navigating
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")
vim.keymap.set({ 'n', 'x' }, 'x', '"_x')

-- copy/paste
vim.keymap.set({ "n", "v" }, "<C-a>", "ggVG", { desc = "Select [A]ll" })
vim.keymap.set({ "n", "v" }, "<leader>y", "\"+y", { desc = "[Y]ank to system clipboard" })
vim.keymap.set({ 'n', 'v' }, '<leader>p', "\"+p", { desc = "[P]aste from system clipboard" })

-- general
vim.keymap.set("n", "<C-q>", "<cmd>qa!<CR>", { desc = "[Q]uit nvim" })
vim.keymap.set("n", "<space>w", "<cmd>write<cr>", { desc = "[W]write changes" })
vim.keymap.set("n", "<C-s>", "<cmd>Format<cr> <cmd>write<cr>", { desc = "[W]write changes" })
vim.keymap.set("n", "gn", "<cmd>:bn<CR>", { desc = "Next buffer" })
vim.keymap.set("n", "gp", "<cmd>:bp<CR>", { desc = "Previous buffer" })
vim.keymap.set("n", "<C-h>", "<C-w>h")
vim.keymap.set("n", "<C-j>", "<C-w>j")
vim.keymap.set("n", "<C-k>", "<C-w>k")
vim.keymap.set("n", "<C-l>", "<C-w>l")
vim.keymap.set("v", "<", "<gv")
vim.keymap.set("v", ">", ">gv")

--Bbye
vim.keymap.set('n', '<leader>q', '<cmd>Bdelete<CR>', { desc = "[Q]uit current buffer" })

-- NeoGit
vim.keymap.set('n', '<leader>ng', '<cmd>:Neogit<CR>', { desc = "[N]eo[G]it" })


-- TELESCOPE
vim.keymap.set('n', '<leader>?', require('telescope.builtin').oldfiles, { desc = '[?] Find recently opened files' })
vim.keymap.set('n', '<leader>fb', require('telescope.builtin').buffers, { desc = '[F]ind existing [B]uffers' })
vim.keymap.set('n', '<leader>/', function()
  require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
    winblend = 10,
    previewer = true,
  })
end, { desc = '[/] Fuzzily search in current buffer' })

vim.keymap.set('n', '<leader><space>', require('telescope.builtin').find_files, { desc = 'Search Files' })
vim.keymap.set('n', '<C-p>', require('telescope.builtin').git_files, { desc = 'Search Git Files' })

vim.keymap.set('n', '<leader>sh', require('telescope.builtin').help_tags, { desc = '[S]earch [H]elp' })
vim.keymap.set('n', '<leader>sw', require('telescope.builtin').grep_string, { desc = '[S]earch current [W]ord' })
vim.keymap.set('n', '<leader>sg', require('telescope.builtin').live_grep, { desc = '[S]earch by [G]rep' })
vim.keymap.set('n', '<leader>sb', require('telescope.builtin').current_buffer_fuzzy_find, { desc = '[S]earch [B]uffer' })
vim.keymap.set('n', '<leader>sd', require('telescope.builtin').diagnostics, { desc = '[S]earch [D]iagnostics' })
-- vim.keymap.set('n', '<leader>se', require('telescope.builtin').diagnostics({ bufnr = 0 }), { desc = '[S]earch [E]rrors current buffer' })

-- NEOTREE
vim.keymap.set({ 'n', 'v' }, '<leader>t', ':Neotree toggle<CR>', { silent = true, desc = "Neo[T]ree Toggle" })
