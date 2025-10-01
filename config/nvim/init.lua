-- Set leader key
vim.g.mapleader = " "

-- Install lazy.nvim if not installed
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- Setup plugins
require("lazy").setup({
  {
    "navarasu/onedark.nvim",
    lazy = false,
    priority = 1000,
  },
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("lualine").setup({
        options = {
          theme = "onedark",
          section_separators = "",
          component_separators = "",
          globalstatus = true, -- always at bottom
          disabled_filetypes = { "neo-tree" },
        },
      })
    end,
  },
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
      require("nvim-treesitter.configs").setup({
        ensure_installed = { "lua", "vim", "vimdoc", "query" },
        highlight = { enable = true },
      })
    end,
  },
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons",
      "MunifTanjim/nui.nvim",
    },
    config = function()
      require("neo-tree").setup({
        window = {
          position = "right",
          show_end_of_buffer = false, -- no ~ in empty lines
        },
      })
      vim.keymap.set("n", "<leader>e", ":Neotree toggle<CR>", { silent = true, noremap = true })
    end,
  },
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    config = function()
      local wk = require("which-key")
      wk.setup({
        win = { border = "rounded" },
        layout = { spacing = 6 },
      })
      wk.add({
        { "<leader>e", ":Neotree toggle<CR>", desc = "Explorer" },
        { "<leader>q", ":q<CR>", desc = "Quit" },
        { "<leader>w", ":w<CR>", desc = "Save" },
        { "<leader>f", ":Telescope find_files<CR>", desc = "Find Files" },
        { "<leader>g", ":Telescope live_grep<CR>", desc = "Live Grep" },
        { "<leader>tt", "<cmd>ToggleTerm<cr>", desc = "Toggle Terminal" },
        { "<leader>nh", "<cmd>NoiceHistory<cr>", desc = "Noice History" },
        { "<leader>nd", "<cmd>NoiceDismiss<cr>", desc = "Noice Dismiss" },
      })
    end,
  },
  {
    "akinsho/bufferline.nvim",
    version = "*",
    dependencies = "nvim-tree/nvim-web-devicons",
    config = function()
      local normal_bg = vim.api.nvim_get_hl(0, { name = "Normal" }).bg
      require("bufferline").setup({
        options = {
          mode = "buffers",
          diagnostics = "nvim_lsp",
          separator_style = "slant",
          show_buffer_close_icons = false,
          show_close_icon = false,
          persist_buffer_sort = true,
          offsets = {
            {
              filetype = "neo-tree",
              text = "File Explorer",
              highlight = "Directory",
              text_align = "center",
            },
          },
        },
        highlights = {
          fill = { bg = normal_bg }, -- empty area matches editor bg
        },
      })
    end,
  },
  {
    "nvim-telescope/telescope.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    cmd = "Telescope",
  },
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    config = function()
      require("nvim-autopairs").setup()
    end,
  },
  {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    config = function()
      local hooks = require("ibl.hooks")
      vim.api.nvim_set_hl(0, "IblScope", { fg = "#61afef" }) -- Onedark blue
      hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
        vim.api.nvim_set_hl(0, "IblScope", { fg = "#61afef" })
      end)
      require("ibl").setup({
        indent = { char = "│" },
        scope = { highlight = "IblScope" },
      })
    end,
  },
  {
    "lewis6991/gitsigns.nvim",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      require("gitsigns").setup({
        signs = {
          add = { text = "│" },
          change = { text = "│" },
          delete = { text = "_" },
          topdelete = { text = "‾" },
          changedelete = { text = "~" },
        },
        current_line_blame = true,
        current_line_blame_opts = {
          delay = 500,
          virt_text_pos = "eol",
        },
      })
    end,
  },
  {
    "akinsho/toggleterm.nvim",
    version = "*",
    config = function()
      require("toggleterm").setup({
        size = 10,                 -- height of horizontal terminal
        open_mapping = [[<C-\>]],  -- Ctrl+\
        direction = "horizontal",  -- open at bottom
        shade_terminals = true,
        shading_factor = 2,
      })
    end,
  },
  {
    "folke/noice.nvim",
    event = "VeryLazy",
    dependencies = {
      "MunifTanjim/nui.nvim",
      "rcarriga/nvim-notify",
    },
    config = function()
      require("noice").setup({
        lsp = {
          progress = { enabled = true },
          hover = { enabled = true },
          signature = { enabled = true },
        },
        presets = {
          bottom_search = true,
          command_palette = true,
          long_message_to_split = true,
          inc_rename = false,
          lsp_doc_border = true,
        },
      })
      vim.notify = require("notify")
    end,
  },
})

-- Enable onedark colorscheme
vim.cmd("colorscheme onedark")

-- Match Neo-tree background with editor
vim.api.nvim_set_hl(0, "NeoTreeNormal", { link = "Normal" })
vim.api.nvim_set_hl(0, "NeoTreeNormalNC", { link = "Normal" })
vim.api.nvim_set_hl(0, "NeoTreeEndOfBuffer", { link = "Normal" })

-- Basic sane settings
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.expandtab = true
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.termguicolors = true

-- Better window navigation with Ctrl + hjkl
vim.keymap.set("n", "<C-h>", "<C-w>h", { noremap = true, silent = true })
vim.keymap.set("n", "<C-j>", "<C-w>j", { noremap = true, silent = true })
vim.keymap.set("n", "<C-k>", "<C-w>k", { noremap = true, silent = true })
vim.keymap.set("n", "<C-l>", "<C-w>l", { noremap = true, silent = true })

-- Exit terminal mode with Esc
vim.keymap.set("t", "<Esc>", [[<C-\><C-n>]], { noremap = true, silent = true })

-- Window navigation inside terminal mode with Ctrl + hjkl
vim.keymap.set("t", "<C-h>", [[<C-\><C-n><C-w>h]], { noremap = true, silent = true })
vim.keymap.set("t", "<C-j>", [[<C-\><C-n><C-w>j]], { noremap = true, silent = true })
vim.keymap.set("t", "<C-k>", [[<C-\><C-n><C-w>k]], { noremap = true, silent = true })
vim.keymap.set("t", "<C-l>", [[<C-\><C-n><C-w>l]], { noremap = true, silent = true })
