-- Bootstrap Lazy

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


-- NOTE: Install your plugins here
require('lazy').setup({
  -- UI and Colorschemes
  {"iamcco/markdown-preview.nvim",build = function() vim.fn["mkdp#util#install"]() end,},
  "kyazdani42/nvim-web-devicons",
  "nvim-lua/popup.nvim", -- An implementation of the Popup API from vim in Neovim
  "nvim-lualine/lualine.nvim",
  'nanozuki/tabby.nvim',
  "lukas-reineke/indent-blankline.nvim",
  'navarasu/onedark.nvim',
  --"nvim-zh/colorful-winsep.nvim",
  'akinsho/bufferline.nvim',
  "folke/lsp-colors.nvim",
  "b0o/incline.nvim",

  -- Utils Functions 
  "folke/todo-comments.nvim",
  "nvim-lua/plenary.nvim", -- Useful lua functions used ny lots of plugins
  "folke/which-key.nvim",
  "kyazdani42/nvim-tree.lua",
  "sidebar-nvim/sidebar.nvim",
  'RaafatTurki/hex.nvim',
  "jcdickinson/wpm.nvim",
  "windwp/nvim-autopairs",

  -- Rest
  "moll/vim-bbye",
  'echasnovski/mini.nvim',

  -- Helpers 
  "MunifTanjim/nui.nvim",

  -- cmp plugins
  "hrsh7th/nvim-cmp", -- The completion plugin
  "hrsh7th/cmp-buffer", -- buffer completions
  "hrsh7th/cmp-path", -- path completions
  "hrsh7th/cmp-cmdline", -- cmdline completions
  "saadparwaiz1/cmp_luasnip", -- snippet completions
  "hrsh7th/cmp-nvim-lsp",
  "hrsh7th/cmp-nvim-lua",

  -- snippets
  "L3MON4D3/LuaSnip", --snippet engine
  "rafamadriz/friendly-snippets", -- a bunch of snippets to use

  -- LSP
  "neovim/nvim-lspconfig", -- enable LSP
  "williamboman/mason.nvim", -- simple to use language server installer
  "williamboman/mason-lspconfig.nvim", -- simple to use language server installer
  "jayp0521/mason-nvim-dap.nvim",
  "glepnir/lspsaga.nvim",
  'simrat39/symbols-outline.nvim',

  -- Treesitter
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
  },
  -- Git
  "lewis6991/gitsigns.nvim",

  -- Term
  {"akinsho/toggleterm.nvim"},

  -- Tagbar

  -- Projects
  "ahmedkhalf/project.nvim",

  -- Colorpicker

  "norcalli/nvim-colorizer.lua",
      -- Debugger
  'mfussenegger/nvim-dap',
  { "rcarriga/nvim-dap-ui", dependencies = {"mfussenegger/nvim-dap"} },

  -- Telescope
  {
    'nvim-telescope/telescope.nvim', tag = '0.1.0',
    dependencies = { 'nvim-lua/plenary.nvim' ,
                 'IllustratedMan-code/telescope-conda.nvim',        
        }
  },
  -- {'stevearc/dressing.nvim'}
  -- Iron -- 
  {'hkupty/iron.nvim'},

  -- Org
  {'nvim-orgmode/orgmode'},
  {
    'nvim-neorg/neorg',
    build = ":Neorg sync-parsers"
    },
  {'willthbill/opener.nvim'}
})

