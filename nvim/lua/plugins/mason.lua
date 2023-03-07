require("mason").setup()

mason_lspconfig = require("mason-lspconfig")
mason_lspconfig.setup {
  enusure_installed = { "lua_ls", "bashls", "cssls", "dockerls", "docker_compose_language_service", "eslint", "html", "jsonls", "marksman", "pyright", "sqlls", "tailwindcss", "tssererver", "volar", "yamlls"},
  automatic_installation = true,
}

-- mason_lspconfig.setup_handlers({
--   function (server_name)
--     require("lspconfig")[server_name].setup {
--       on_attach = require("shared").on_attach,
--     }
--   end  
-- })
