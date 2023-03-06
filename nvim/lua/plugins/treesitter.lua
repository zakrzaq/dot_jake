require('nvim-treesitter.configs').setup({
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = true,
  },
  ensure_installed = {
    'javascript',
    'typescript',
    'vue',
    'css',
    'json',
    'lua',
    'python',
    'bash'
  },
})


