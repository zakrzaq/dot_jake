-- NULL_LS
local null_ls = require("null-ls")
local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

null_ls.setup({
    sources = {
      -- JAVASCRIPT
        null_ls.builtins.code_actions.eslint,
        null_ls.builtins.diagnostics.eslint,
        -- null_ls.builtins.formatting.eslint,
        -- null_ls.builtins.formatting.prettierd,
        null_ls.builtins.formatting.prettier_eslint,
      -- LUA
        null_ls.builtins.formatting.stylua,
        null_ls.builtins.completion.luasnip,
        -- null_ls.builtins.diagnostics.luacheck,
      -- PYTHON
        null_ls.builtins.diagnostics.mypy,
        null_ls.builtins.formatting.isort,
        null_ls.builtins.formatting.black,
      -- CSPELL
        null_ls.builtins.code_actions.cspell,
    },
   on_attach = function(client, bufnr)
        if client.supports_method("textDocument/formatting") then
            vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
            vim.api.nvim_create_autocmd("BufWritePre", {
                group = augroup,
                buffer = bufnr,
                callback = function()
                    -- on 0.8, you should use 
                    -- vim.lsp.buf.format({ bufnr = bufnr }) 
                    -- vim.lsp.buf.formatting_sync()
                end,
            })
        end
    end, 
})


