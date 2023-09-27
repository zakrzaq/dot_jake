local util = require("lspconfig/util")

local on_attach = function(_, bufnr)
	local nmap = function(keys, func, desc)
		if desc then
			desc = "LSP: " .. desc
		end

		vim.keymap.set("n", keys, func, { buffer = bufnr, desc = desc })
	end

	nmap("<leader>cr", vim.lsp.buf.rename, "[C]ode [R]ename")
	nmap("<leader>ca", vim.lsp.buf.code_action, "[C]ode [A]ction")
	nmap("gd", vim.lsp.buf.definition, "[G]oto [D]efinition")
	nmap("gr", require("telescope.builtin").lsp_references, "[G]oto [R]eferences")
	nmap("gI", vim.lsp.buf.implementation, "[G]oto [I]mplementation")
	nmap("<leader>D", vim.lsp.buf.type_definition, "Type [D]efinition")
	nmap("K", vim.lsp.buf.hover, "Hover Documentation")
	nmap("<C-k>", vim.lsp.buf.signature_help, "Signature Documentation")
	nmap("gD", vim.lsp.buf.declaration, "[G]oto [D]eclaration")
	nmap("<leader>wa", vim.lsp.buf.add_workspace_folder, "[W]orkspace [A]dd Folder")
	nmap("<leader>wr", vim.lsp.buf.remove_workspace_folder, "[W]orkspace [R]emove Folder")
	nmap("<leader>wl", function()
		print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
	end, "[W]orkspace [L]ist Folders")
	nmap("n", "gl", "<cmd>lua vim.diagnostic.open_float()<cr>")
	nmap("n", "[d", "<cmd>lua vim.diagnostic.goto_prev()<cr>")
	nmap("n", "]d", "<cmd>lua vim.diagnostic.goto_next()<cr>")

	vim.api.nvim_buf_create_user_command(bufnr, "Format", function(_)
		local eslint_list = { "typescript", "javascript", "javascriptreact", "typescriptreact", "vue" }

		local function contains(list, x)
			for _, v in pairs(list) do
				if v == x then
					return true
				end
			end
			return false
		end

		if contains(eslint_list, vim.bo.filetype) then
			vim.cmd("EslintFixAll")
		else
			vim.lsp.buf.format()
		end
	end, { desc = "Format current buffer with LSP" })
end

local servers = {
	volar = {
		filetypes = { "vue", "json" },
	},
	tsserver = {
		filetypes = {
			"javascript",
			"javascriptreact",
			"javascript.jsx",
			"typescript",
			"typescriptreact",
			"typescript.tsx",
		},
	},
	pyright = {},
	eslint = {
		enable = true,
		format = { enable = true }, -- this will enable formatting
		packageManager = "npm",
		autoFixOnSave = true,
		codeActionsOnSave = {
			mode = "all",
			rules = { "!debugger", "!no-only-tests/*" },
		},
		lintTask = {
			enable = true,
		},
	},
	html = {},
	cssls = {},
	tailwindcss = {},
	emmet_ls = {},
	sqlls = {},
	-- marksman = {},
	dotls = {},
	bashls = {},
	jsonls = {},
	lua_ls = {
		Lua = {
			workspace = { checkThirdParty = false },
			telemetry = { enable = false },
			diagnostics = { globals = { "vim" } },
		},
	},
}

require("neodev").setup()

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

require("mason").setup()

local mason_lspconfig = require("mason-lspconfig")

mason_lspconfig.setup({
	ensure_installed = vim.tbl_keys(servers),
})

mason_lspconfig.setup_handlers({
	function(server_name)
		require("lspconfig")[server_name].setup({
			root_dir = util.root_pattern(".git"),
			capabilities = capabilities,
			on_attach = on_attach,
			settings = servers[server_name],
		})
	end,
})
