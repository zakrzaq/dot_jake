local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

return require('packer').startup(function(use)
  -- Package manager
  use 'wbthomason/packer.nvim'
  -- Themes
  use 'EdenEast/nightfox.nvim'
  -- UI
  use 'nvim-lualine/lualine.nvim'
  use 'akinsho/bufferline.nvim'
  use 'lukas-reineke/indent-blankline.nvim'
  use 'karb94/neoscroll.nvim'
  use 'moll/vim-bbye'
  use 'numToStr/Navigator.nvim'
  -- CODE
  use 'nvim-treesitter/nvim-treesitter'
  use 'numToStr/Comment.nvim'
  use 'tpope/vim-surround'
  use 'windwp/nvim-autopairs'
  use 'ap/vim-css-color'
  -- NvimTree
  use 'kyazdani42/nvim-tree.lua'
  -- Telescope
  use 'nvim-telescope/telescope.nvim'
  use 'nvim-telescope/telescope-fzf-native.nvim'
  use 'nvim-lua/plenary.nvim'
  -- Toggle Term
  use 'akinsho/toggleterm.nvim'
  -- GIT
  use 'tpope/vim-fugitive'
  use 'lewis6991/gitsigns.nvim'
  use 'braxtons12/blame_line.nvim'
  -- LSP
  use 'williamboman/mason.nvim'
  use 'williamboman/mason-lspconfig.nvim'
  use 'neovim/nvim-lspconfig'
  use 'jose-elias-alvarez/null-ls.nvim'
  -- COMPLETE
  use 'hrsh7th/nvim-cmp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'saadparwaiz1/cmp_luasnip'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'rafamadriz/friendly-snippets'



  if packer_bootstrap then
    require('packer').sync()
  end
end)

