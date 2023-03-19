local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system {
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable', -- latest stable release
    lazypath,
  }
end
vim.opt.rtp:prepend(lazypath)


require('lazy').setup({
  -- GIT
  'tpope/vim-fugitive',
  'tpope/vim-rhubarb',

  -- TAB SHIFT WIDTH
  'tpope/vim-sleuth',

  -- THEME
  {
    'EdenEast/nightfox.nvim',
    priority = 1000,
    config = function()
      vim.cmd.colorscheme 'nightfox'
    end,
  },


  -- UI
  { 'akinsho/bufferline.nvim', opts = {} },
  { 'moll/vim-bbye' },
  'tpope/vim-surround',
  'windwp/nvim-autopairs',
  'ap/vim-css-color',
  {
    'akinsho/toggleterm.nvim',
    opts = {
      open_mapping = '<C-b>',
      direction = 'horizontal',
      shade_terminals = true
    }
  },
  { 'folke/which-key.nvim',  opts = {} },
  {
    'nvim-lualine/lualine.nvim',
    opts = {
      options = {
        icons_enabled = false,
        theme = 'nightfox',
        component_separators = '|',
        section_separators = '',
      },
    },
  },
  {
    'lukas-reineke/indent-blankline.nvim',
    opts = {
      char = '┊',
      show_trailing_blankline_indent = false,
    },
  },
  { 'numToStr/Comment.nvim', opts = {} },

  -- LSP
  {
    'neovim/nvim-lspconfig',
    dependencies = {
      'williamboman/mason.nvim',
      'williamboman/mason-lspconfig.nvim',
      { 'j-hui/fidget.nvim',               opts = {} },
      'folke/neodev.nvim',
      { 'jose-elias-alvarez/null-ls.nvim', opts = {} },
    },
  },

  -- AUTOCOMPLETE
  {
    'hrsh7th/nvim-cmp',
    dependencies = { 'hrsh7th/cmp-nvim-lsp', 'L3MON4D3/LuaSnip', 'saadparwaiz1/cmp_luasnip' },
  },

  -- GIT SIGNS
  {
    'lewis6991/gitsigns.nvim',
    opts = {
      signs = {
        add = { text = '+' },
        change = { text = '~' },
        delete = { text = '_' },
        topdelete = { text = '‾' },
        changedelete = { text = '~' },
      },
    },
  },
  { 'nvim-telescope/telescope.nvim', version = '*', dependencies = { 'nvim-lua/plenary.nvim' } },
  {
    'nvim-telescope/telescope-fzf-native.nvim',
    build = 'make',
    cond = function()
      return vim.fn.executable 'make' == 1
    end,
  },

  -- TREESITTER
  {
    'nvim-treesitter/nvim-treesitter',
    dependencies = {
      'nvim-treesitter/nvim-treesitter-textobjects',
    },
    config = function()
      pcall(require('nvim-treesitter.install').update { with_sync = true })
    end,
  },

  -- NEOTREE
  {
    "nvim-neo-tree/neo-tree.nvim",
    version = "*",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
      "MunifTanjim/nui.nvim",
    },
    config = function()
      vim.cmd([[ let g:neo_tree_remove_legacy_commands = 1 ]])
    end,
  }
}, {})