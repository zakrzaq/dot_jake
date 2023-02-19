--SOURCE:   https://vonheikemen.github.io/devlog/tools/build-your-first-lua-config-for-neovim/


-- VARIABLES
local color_theme = 'onedark'

-- OPTIONS
vim.opt.mouse = 'a'
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.hlsearch = false
vim.opt.incsearch = true
vim.opt.wrap = true
vim.opt.breakindent = true
vim.opt.shiftwidth = 2
vim.opt.expandtab = false
vim.opt.undofile = true
vim.opt.scrolloff = 8
vim.opt.ignorecase = true
vim.opt.cursorline = true
--vim.opt.hidden  = true
vim.opt.number = true
vim.opt.title = true
vim.opt.ttimeoutlen = 0
vim.opt.wildmenu = true

-- TABLUTATIONS
vim.opt.expandtab = true
vim.opt.shiftwidth = 2

-- LOOK
vim.g.t_co = 256
vim.opt.termguicolors = true
vim.cmd(string.format('colorscheme %s', color_theme))

-- VIRTUL TEXT OFF
vim.diagnostic.config({
  float = { source = "always", border = border },
  virtual_text = false,
  signs = true,
})
vim.cmd([[ autocmd! CursorHold,CursorHoldI * lua vim.diagnostic.open_float(nil, {focus=false})]])

-- FORMAT ON Save
vim.cmd("autocmd BufWritePost <buffer> lua vim.lsp.buf.format()")

-- SYTEM CLIPBOARD
vim.opt.clipboard = 'unnamed'

-- KEYS
vim.keymap.set('n', '<space>w', '<cmd>write<cr>', {desc = 'Save'})
vim.keymap.set('n', '<C-s>', '<cmd>write<cr><cmd>EslintFixAll<cr>')
vim.keymap.set({ 'n', 'v' }, '<C-c>', '"*y')
vim.keymap.set({ 'n', 'v' }, '<C-y>', '"+y')
vim.keymap.set({ 'n', 'v' }, '<C-l>', '"+p')
vim.keymap.set({ 'n', 'x' }, 'x', '"_x')
vim.keymap.set({ 'n' }, '<C-;>', ':noh<cr>')
vim.keymap.set('n', '<C-r>', '<cmd>NvimTreeToggle<cr>')
vim.keymap.set('n', '<space>b', '<cmd>Telescope buffers<cr>')
vim.keymap.set('n', '<space>?', '<cmd>Telescope oldfiles<cr>')
vim.keymap.set('n', '<C-o>', '<cmd>Telescope find_files<cr>')
vim.keymap.set('n', '<C-p>', ':Telescope git_files<cr>')
vim.keymap.set('n', '<space>f', '<cmd>Telescope live_grep<cr>')
vim.keymap.set('n', '<space>d', '<cmd>Telescope diagnostics<cr>')
vim.keymap.set('n', '<space>i', '<cmd>Telescope diagnostics bufnr=0<cr>')
vim.keymap.set('n', '<C-f>', '<cmd>Telescope current_buffer_fuzzy_find<cr>')
vim.keymap.set('n', '<C-q>', '<cmd>Bdelete<CR>')
vim.keymap.set('n', '<space>q', '<cmd>qa!<CR>')
vim.keymap.set('n', '<C-a>', 'ggVG')
vim.keymap.set('n', '<A-.>', ':m .-2<CR>==')
vim.keymap.set('n', '<A-,>', ':m .+1<CR>==')
vim.keymap.set('n', '<A-.>', ":m '<-2<CR>gv=gv")
vim.keymap.set('n', '<A-h>', '<C-w>h')
vim.keymap.set('n', '<A-j>', '<C-w>j')
vim.keymap.set('n', '<A-k>', '<C-w>k')
vim.keymap.set('n', '<A-l>', '<C-w>l')
vim.keymap.set('n', '<C-]>', '<cmd>:bn<CR>')
vim.keymap.set('n', '<C-[>', '<cmd>:bp<CR>')



-- PACKER
local install_path = vim.fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
local install_plugins = false

if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  print('Installing packer...')
  local packer_url = 'https://github.com/wbthomason/packer.nvim'
  vim.fn.system({ 'git', 'clone', '--depth', '1', packer_url, install_path })
  print('Done.')

  vim.cmd('packadd packer.nvim')
  install_plugins = true
end

-- PLUGINS
require('packer').startup(function(use)
  -- Package manager
  use 'wbthomason/packer.nvim'
  -- Themes
  use 'joshdick/onedark.vim'
  use 'arcticicestudio/nord-vim'
  use 'drewtempelmeyer/palenight.vim'
  use 'overcache/NeoSolarized' 
  use 'EdenEast/nightfox.nvim'
  -- UI
  use 'nvim-lualine/lualine.nvim'
  use 'akinsho/bufferline.nvim'
  use 'lukas-reineke/indent-blankline.nvim'
  use 'moll/vim-bbye'
  use 'karb94/neoscroll.nvim'
  -- CODE
  use 'nvim-treesitter/nvim-treesitter'
  use 'numToStr/Comment.nvim'
  use 'tpope/vim-surround'
  use 'windwp/nvim-autopairs'
  use 'ap/vim-css-color'
  use 'jose-elias-alvarez/null-ls.nvim'
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
  use 'neovim/nvim-lspconfig'
  use 'hrsh7th/nvim-cmp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'saadparwaiz1/cmp_luasnip'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'L3MON4D3/LuaSnip'
  use 'rafamadriz/friendly-snippets'
  use 'kabouzeid/nvim-lspinstall'


  if install_plugins then
    require('packer').sync()
  end
end)

-- INIT PACKAGES
-- require('packer').sync()

require('lualine').setup({
  options = {
    theme = string.format('%s', color_theme),
    icons_enabled = true,
    section_separators = '',
    component_separators = ''
  }
})

require('bufferline').setup({
  options = {
    mode = 'buffers',
    offsets = {
      { filetype = 'NvimTree' },
    },
  },
  highlights = {
    buffer_selected = {
      italic = false,
    },
    indicator_selected = {
      fg = {attribute = 'fg', highlight = 'Function'},
      italic = false,
    }
  }
})

require('indent_blankline').setup({
  char = '▏',
  show_trailing_blankline_indent = false,
  show_first_indent_level = false,
  use_treesitter = true,
  show_current_context = false
})

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
    'python'
  },
})

require('Comment').setup({})

require('nvim-tree').setup({
  hijack_cursor = false,
  on_attach = function(bufnr)
    local bufmap = function(lhs, rhs, desc)
      vim.keymap.set('n', lhs, rhs, { buffer = bufnr, desc = desc })
    end

    -- See :help nvim-tree.api
    local api = require('nvim-tree.api')

    bufmap('L', api.node.open.edit, 'Expand folder or go to file')
    bufmap('H', api.node.navigate.parent_close, 'Close parent folder')
    bufmap('gh', api.tree.toggle_hidden_filter, 'Toggle hidden files')
  end
})

require('telescope')
-- require('telescope').load_extension('fzf')

require('toggleterm').setup({
  open_mapping = '<C-b>',
  direction = 'horizontal',
  shade_terminals = true
})

require('gitsigns').setup({})
require('blame_line').setup({})
require('nvim-autopairs').setup({})


-- LSP CONFIG
local lsp_defaults = {
  flags = {
    debounce_text_changes = 150,
  },
  capabilities = require('cmp_nvim_lsp').default_capabilities(
    vim.lsp.protocol.make_client_capabilities()
  ),
  on_attach = function(client, bufnr)
    vim.api.nvim_exec_autocmds('User', { pattern = 'LspAttached' })
  end
}

local lspconfig = require('lspconfig')

lspconfig.util.default_config = vim.tbl_deep_extend(
  'force',
  lspconfig.util.default_config,
  lsp_defaults
)

lspconfig.sumneko_lua.setup{}
lspconfig.pyright.setup{}
lspconfig.volar.setup{
  filetypes = { 'typescript', 'javascript', 'javascriptreact', 'typescriptreact', 'vue', 'json' }
}
lspconfig.bashls.setup{}
lspconfig.tailwindcss.setup{}
lspconfig.eslint.setup {}

vim.api.nvim_create_autocmd('User', {
  pattern = 'LspAttached',
  desc = 'LSP actions',
  callback = function()
    local bufmap = function(mode, lhs, rhs)
      local opts = { buffer = true }
      vim.keymap.set(mode, lhs, rhs, opts)
    end
    -- Displays hover information about the symbol under the cursor
    bufmap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>')
    -- Jump to the definition
    bufmap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>')
    -- Jump to declaration
    bufmap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<cr>')
    -- Lists all the implementations for the symbol under the cursor
    bufmap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<cr>')
    -- Jumps to the definition of the type symbol
    bufmap('n', 'go', '<cmd>lua vim.lsp.buf.type_definition()<cr>')
    -- Lists all the references
    bufmap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<cr>')
    -- Displays a function's signature information
    bufmap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<cr>')
    -- Renames all references to the symbol under the cursor
    bufmap('n', '<F2>', '<cmd>lua vim.lsp.buf.rename()<cr>')
    -- Selects a code action available at the current cursor position
    bufmap('n', '<F4>', '<cmd>lua vim.lsp.buf.code_action()<cr>')
    bufmap('x', '<F4>', '<cmd>lua vim.lsp.buf.range_code_action()<cr>')
    -- Show diagnostics in a floating window
    bufmap('n', 'gl', '<cmd>lua vim.diagnostic.open_float()<cr>')
    -- Move to the previous diagnostic
    bufmap('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<cr>')
    -- Move to the next diagnostic
    bufmap('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<cr>')
  end
})


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
        -- null_ls.builtins.formatting.stylua,
        null_ls.builtins.completion.luasnip,
        null_ls.builtins.diagnostics.luacheck,
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


-- AUTOCOMPLETE
vim.opt.completeopt = { 'menu', 'menuone', 'noselect' }

require('luasnip.loaders.from_vscode').lazy_load()

local cmp = require('cmp')
local luasnip = require('luasnip')

local select_opts = { behavior = cmp.SelectBehavior.Select }

cmp.setup({
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end
  },
  sources = {
    { name = 'path' },
    { name = 'nvim_lsp', keyword_length = 3 },
    { name = 'buffer', keyword_length = 3 },
    { name = 'luasnip', keyword_length = 2 },
  },
  window = {
    documentation = cmp.config.window.bordered()
  },
  formatting = {
    fields = { 'menu', 'abbr', 'kind' },
    format = function(entry, item)
      local menu_icon = {
        nvim_lsp = 'λ',
        luasnip = '⋗',
        buffer = 'Ω',
        path = '🖫',
      }

      item.menu = menu_icon[entry.source.name]
      return item
    end,
  },
  mapping = {
    ['<Up>'] = cmp.mapping.select_prev_item(select_opts),
    ['<Down>'] = cmp.mapping.select_next_item(select_opts),

    ['<C-p>'] = cmp.mapping.select_prev_item(select_opts),
    ['<C-n>'] = cmp.mapping.select_next_item(select_opts),

    ['<C-u>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),

    ['<C-e>'] = cmp.mapping.abort(),
    ['<CR>'] = cmp.mapping.confirm({ select = true }),

    ['<C-d>'] = cmp.mapping(function(fallback)
      if luasnip.jumpable(1) then
        luasnip.jump(1)
      else
        fallback()
      end
    end, { 'i', 's' }),

    ['<C-b>'] = cmp.mapping(function(fallback)
      if luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end, { 'i', 's' }),

    ['<Tab>'] = cmp.mapping(function(fallback)
      local col = vim.fn.col('.') - 1

      if cmp.visible() then
        cmp.select_next_item(select_opts)
      elseif col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') then
        fallback()
      else
        cmp.complete()
      end
    end, { 'i', 's' }),

    ['<S-Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item(select_opts)
      else
        fallback()
      end
    end, { 'i', 's' }),
  },
})
