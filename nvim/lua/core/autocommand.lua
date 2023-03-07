-- VIRTUL TEXT OFF
vim.diagnostic.config({
  float = { source = "always", border = border },
  virtual_text = false,
  signs = true,
})
vim.cmd([[ autocmd! CursorHold,CursorHoldI * lua vim.diagnostic.open_float(nil, {focus=false})]])

-- FORMAT ON Save
-- vim.cmd("autocmd BufWritePost <buffer> lua vim.lsp.buf.format()")
vim.cmd [[autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()]]


