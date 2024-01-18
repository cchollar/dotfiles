-- PLUGINS (LazyVim)
--=============================================================================


-- Lazy Vim Bootstrap
-------------------------------------------------------------------------------
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- Lazy Vim Plugins
-------------------------------------------------------------------------------
require("lazy").setup({
    -- Telescope
    {
        'nvim-telescope/telescope.nvim', tag = '0.1.1',
      dependencies = { 'nvim-lua/plenary.nvim' }
    },

    --nvim-treesitter
    "nvim-tree/nvim-tree.lua",

    -- Colorscheme
    'Mofiqul/dracula.nvim',

    -- Lualine
    {
      'nvim-lualine/lualine.nvim',
      dependencies = { 'nvim-tree/nvim-web-devicons' }
    },

    --Pop up still needed?
    'nvim-lua/popup.nvim',

    --auto complete
    'hrsh7th/nvim-cmp',
    'hrsh7th/cmp-buffer',
    'hrsh7th/cmp-path',
    'hrsh7th/cmp-cmdline',
    'saadparwaiz1/cmp_luasnip',
    'hrsh7th/cmp-nvim-lsp',

    --snippets
    'L3MON4D3/LuaSnip',
    'rafamadriz/friendly-snippets',

    --LSP 
    'williamboman/mason.nvim',
    'williamboman/mason-lspconfig.nvim',
    'neovim/nvim-lspconfig',
    
    --rust-tools
    --'simrat39/rust-tools.nvim',

    --rustaceanvim

    {
    'mrcjkb/rustaceanvim',
    version = '^3', -- Recommended
    ft = { 'rust' },
    },

    -- DAP
    'mfussenegger/nvim-dap',

    --bufferline
    {'akinsho/bufferline.nvim', version = "v3.*", dependencies = 'nvim-tree/nvim-web-devicons'},

    --toggleterm
    {'akinsho/toggleterm.nvim', version = "*", config = true},
    
    --illuminate
    'RRethy/vim-illuminate',

    --gitsigns
    'lewis6991/gitsigns.nvim',

    --tree-sitter
    'nvim-treesitter/nvim-treesitter',

    --which-key
    "folke/which-key.nvim",
    config = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 300
      require("which-key").setup({
        -- your configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
      })
    end,

  },
  {
    ui = {
      border = "rounded"
    },
  }
  )

-- Lua Line Setup
-------------------------------------------------------------------------------
require("lualine").setup {
  options = {
    theme = 'dracula-nvim'
  }
}

-- Mason and LSP Setup
-------------------------------------------------------------------------------
require("mason").setup()
require("mason-lspconfig").setup()
require("lspconfig").pyright.setup{}

-- bufferline setup
-------------------------------------------------------------------------------
require("bufferline").setup{}

-- gitsigns setup
-------------------------------------------------------------------------------
require("gitsigns").setup()

-- nvim-tree setup
-------------------------------------------------------------------------------
require("nvim-tree").setup {}

-- nvim tree-sitter setup
-------------------------------------------------------------------------------
require("nvim-treesitter.configs").setup{
  nsure_installed = { "lua", "rust", "toml" },
  auto_install = true,
  highlight = {
    enable = true,
  }
}
