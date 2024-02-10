vim.g.mapleader = " "

vim.keymap.set("n", "<leader>ue", vim.cmd.Explore, { desc = "Nvim Explorer" })
vim.keymap.set("i", "jj", "<ESC>", { silent = true })

-- move selected up/down
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- center screen when searching/navigating
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzz")
vim.keymap.set("n", "N", "Nzz")
vim.keymap.set({ "n", "x" }, "x", '"_x')

-- copy/paste
vim.keymap.set({ "n", "v" }, "<C-a>", "ggVG", { desc = "Select [A]ll" })
vim.keymap.set({ "n", "v" }, "<leader>y", '"+y', { desc = "[Y]ank to system clipboard" })
vim.keymap.set({ "n", "v" }, "<leader>p", '"+p', { desc = "[P]aste from system clipboard" })

-- general
vim.keymap.set("n", "<C-q>", "<cmd>qa!<CR>", { desc = "[Q]uit nvim" })
vim.keymap.set("n", "<space>w", "<cmd>write<cr>", { desc = "[W]write changes" })
vim.keymap.set("n", "<C-s>", "<cmd>Format<cr> <cmd>write<cr>", { desc = "[W]write changes" })
vim.keymap.set("n", "]b", "<cmd>:bn<CR>", { desc = "Next buffer" })
vim.keymap.set("n", "[b", "<cmd>:bp<CR>", { desc = "Previous buffer" })
vim.keymap.set("n", "<C-h>", "<C-w>h")
vim.keymap.set("n", "<C-l>", "<C-w>l")
vim.keymap.set("n", "<M-h>", "<C-w>h")
vim.keymap.set("n", "<M-j>", "<C-w>j")
vim.keymap.set("n", "<M-k>", "<C-w>k")
vim.keymap.set("n", "<M-l>", "<C-w>l")
vim.keymap.set("v", "<", "<gv")
vim.keymap.set("v", ">", ">gv")

-- Close buffer
vim.keymap.set("n", "<leader>q", "<cmd>Bdelete<CR>", { desc = "[Q]uit current buffer" })

-- NeoGit
vim.keymap.set("n", "<leader>gn", "<cmd>:Neogit<CR>", { desc = "[N]eo[G]it" })

-- CUSTOM
vim.keymap.set("n", "<C-f>", "<cmd>:silent !tmux neww tmux-sessionizer<CR>", { desc = "Create Tmux Session" })

-- TELESCOPE
vim.keymap.set("n", "<leader>?", require("telescope.builtin").oldfiles, { desc = "[?] Find recently opened files" })
vim.keymap.set("n", "<leader>fb", require("telescope.builtin").buffers, { desc = "[F]ind existing [b]uffers" })
vim.keymap.set("n", "<leader>/", function()
	require("telescope.builtin").current_buffer_fuzzy_find(require("telescope.themes").get_dropdown({
		winblend = 10,
		previewer = true,
	}))
end, { desc = "[/] Fuzzily search in current buffer" })
vim.keymap.set("n", "<leader><space>", require("telescope.builtin").find_files, { desc = "Search Files" })
vim.keymap.set("n", "<C-p>", require("telescope.builtin").git_files, { desc = "Search Git Files" })

vim.keymap.set("n", "<leader>sh", require("telescope.builtin").help_tags, { desc = "[S]earch [h]elp" })
vim.keymap.set("n", "<leader>sw", require("telescope.builtin").grep_string, { desc = "[S]earch current [w]ord" })
vim.keymap.set("n", "<leader>sg", require("telescope.builtin").live_grep, { desc = "[S]earch by [g]rep" })
vim.keymap.set(
	"n",
	"<leader>sb",
	require("telescope.builtin").current_buffer_fuzzy_find,
	{ desc = "[S]earch in [b]uffer" }
)
vim.keymap.set("n", "<leader>sd", require("telescope.builtin").diagnostics, { desc = "[S]earch buffer [D]iagnostics" })
vim.keymap.set("n", "<leader>st", "<cmd>:TodoTelescope<CR>", { desc = "[S]earch [T]odos" })
vim.keymap.set("n", "<leader>ss", "<cmd>:Telescope lsp_document_symbols<CR>", { desc = "[S]earch document [S]ymbol" })
vim.keymap.set(
	"n",
	"<leader>sS",
	require("telescope.builtin").lsp_dynamic_workspace_symbols,
	{ desc = "[S]earch document [S]ymbol" }
)
vim.keymap.set("n", "<leader>gs", "<cmd>:Telescope git_status<CR>", { desc = "[G]it [S]atus" })
vim.keymap.set("n", "<leader>gc", "<cmd>:Telescope git_commits<CR>", { desc = "[G]it [C]ommits" })
vim.keymap.set("n", "<leader>gb", "<cmd>:Telescope git_branches<CR>", { desc = "[G]it [B]ranches" })
vim.keymap.set("n", "<leader>gt", "<cmd>:Telescope git_stash<CR>", { desc = "[G]it s[T]ash" })
vim.keymap.set("n", "<leader>gl", "<cmd>:ToggleBlameLine<cr>", { silent = true, desc = "[G]it b[L]ame line" })
vim.keymap.set("n", "<leader>gL", "<cmd>:Gitsigns blame_line<CR>", { desc = "[G]it b[L]ame popup" })

-- NEOTREE
vim.keymap.set({ "n", "v" }, "<leader>t", ":Neotree toggle<CR>", { silent = true, desc = "Neo[T]ree Toggle" })

-- URL-OPEN
vim.keymap.set(
	"n",
	"<leader>uo",
	"<esc>:URLOpenUnderCursor<cr>",
	{ silent = true, desc = "[u][u]RL under cursor open" }
)
vim.keymap.set("n", "<leader>us", "<esc>:URLOpenHighlightAll<cr>", { silent = true, desc = "[u]RL highlight all" })
vim.keymap.set(
	"n",
	"<leader>uS",
	"<esc>:URLOpenHighlightAllClear<cr>",
	{ silent = true, desc = "[u]RL clear highlight all" }
)

-- TROUBLE
vim.keymap.set("n", "<leader>xx", function()
	require("trouble").toggle()
end, { desc = "toggle diagnosti[X]" })
vim.keymap.set("n", "<leader>xw", function()
	require("trouble").toggle("workspace_diagnostics")
end, { desc = "toggle [W]orkspace diagnostics" })
vim.keymap.set("n", "<leader>xd", function()
	require("trouble").toggle("document_diagnostics")
end, { desc = "toggle [D]ocument diagnostics" })
vim.keymap.set("n", "<leader>xq", function()
	require("trouble").toggle("quickfix")
end, { desc = "toggle [Q]uickfix" })
vim.keymap.set("n", "<leader>xl", function()
	require("trouble").toggle("loclist")
end, { desc = "toggle [L]loclist" })
vim.keymap.set("n", "gR", function()
	require("trouble").toggle("lsp_references")
end)
