-- init.lua
vim.g.mapleader = " "
vim.opt.termguicolors = true

-- Load theme (palette + highlights)
local theme = require("theme")
theme.setup()  -- apply highlights & autocmds
local palette = theme.palette

-- Install lazy.nvim if needed
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({ "git", "clone", "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git", "--branch=stable", lazypath })
end
vim.opt.rtp:prepend(lazypath)

-- Plugins
require("lazy").setup({
  {
    "norcalli/nvim-colorizer.lua",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      require("colorizer").setup({ "*", css = { rgb_fn = true }, html = { names = true } })
    end,
  },
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
   config = function()
      require("lualine").setup({
        options = {
          theme = theme.lualine_theme(),
          section_separators = "",
          component_separators = "",
          globalstatus = true,
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
        window = { position = "right", show_end_of_buffer = false },
          default_component_configs = {
            git_status = {
              symbols = {
                added     = "",  -- diff-added
                modified  = "",  -- diff-modified
                deleted   = "",  -- diff-removed
                renamed   = "",  -- diff-renamed
                untracked = "",  -- question
                ignored   = "",  -- ignored
                unstaged  = "",  -- exclamation-circle
                staged    = "",  -- check
                conflict  = "",  -- git-merge
              },
            },
          },
      })
      vim.keymap.set("n", "<leader>e", ":Neotree toggle<CR>", { silent = true, noremap = true })
    end,
  },
  {
    "folke/which-key.nvim",
    version = "^3",
    event = "VeryLazy",
    config = function()
      local wk = require("which-key")
      wk.setup({ win = { border = "rounded" }, layout = { spacing = 6 } })
      wk.add({
        -- Top-level
        { "<leader>e", ":Neotree toggle<CR>", desc = "Explorer" },
        { "<leader>w", ":w<CR>", desc = "Save" },
        { "<leader>q", ":confirm qa<CR>", desc = "Quit (confirm save)" },
        { "<leader>s", group = "Split" },
        -- GROUPS
        { "<leader>f", group = "Find" },
        { "<leader>b", group = "Buffers" },
        { "<leader>t", group = "Terminal" },  -- ← group label
        { "<leader>n", group = "Noice" },

        -- Find
        { "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Find Files" },
        { "<leader>fg", "<cmd>Telescope live_grep<cr>",  desc = "Live Grep" },

        -- Buffers
        { "<leader>bn", "<cmd>BufferLineCycleNext<cr>", desc = "Next Buffer" },
        { "<leader>bN", "<cmd>BufferLineCyclePrev<cr>", desc = "Prev Buffer" },
        { "<leader>bd", "<cmd>confirm bdelete<cr>",     desc = "Close Buffer" },
        { "<leader>bp", "<cmd>BufferLinePickClose<cr>", desc = "Pick Buffer to Close" },

        -- Terminal
        { "<leader>tt", "<cmd>ToggleTerm<cr>", desc = "Toggle Terminal" },  -- ← restored

        -- Noice
        { "<leader>nh", "<cmd>NoiceHistory<cr>", desc = "History" },
        { "<leader>nd", "<cmd>NoiceDismiss<cr>", desc = "Dismiss" },

        -- Split
        { "<leader>sv", "<C-w>v", desc = "Split Vertically" },
        { "<leader>sh", "<C-w>s", desc = "Split Horizontally" },
        { "<leader>se", "<C-w>=", desc = "Equalize Splits" },
        { "<leader>sx", "<cmd>close<CR>", desc = "Close Split" },
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
          separator_style = "sloped",
          show_buffer_close_icons = false,
          show_close_icon = false,
          persist_buffer_sort = true,
          offsets = { { filetype = "neo-tree", text = "File Explorer", highlight = "Directory", text_align = "center" } },
        },
        highlights = { fill = { bg = normal_bg } },
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
    config = function() require("nvim-autopairs").setup() end,
  },
  {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    config = function()
      local hooks = require("ibl.hooks")
      vim.api.nvim_set_hl(0, "IblScope", { fg = palette.accent })
      hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
        vim.api.nvim_set_hl(0, "IblScope", { fg = palette.accent })
      end)
      require("ibl").setup({ indent = { char = "│" }, scope = { highlight = "IblScope" } })
    end,
  },
  {
    "lewis6991/gitsigns.nvim",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      require("gitsigns").setup({
        signs = {
          add          = { text = "│" },
          change       = { text = "│" },
          delete       = { text = "_" },
          topdelete    = { text = "‾" },
          changedelete = { text = "~" },
        },
        current_line_blame = true,
        current_line_blame_opts = { delay = 500, virt_text_pos = "eol" },
      })
      vim.api.nvim_set_hl(0, "GitSignsAdd",    { fg = palette.green })
      vim.api.nvim_set_hl(0, "GitSignsChange", { fg = palette.yellow })
      vim.api.nvim_set_hl(0, "GitSignsDelete", { fg = palette.red })
    end,
  },
  {
    "akinsho/toggleterm.nvim",
    version = "*",
    config = function()
      require("toggleterm").setup({
        size = 10,
        open_mapping = [[<C-\>]],
        direction = "horizontal",
        shade_terminals = true,
        shading_factor = 2,
      })
    end,
  },
  {
    "folke/noice.nvim",
    event = "VeryLazy",
    dependencies = { "MunifTanjim/nui.nvim", "rcarriga/nvim-notify" },
    config = function()
      require("noice").setup({
        lsp = {
          progress  = { enabled = true },
          hover     = { enabled = true },
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

-- Basic settings
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.expandtab = true
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.clipboard:append("unnamedplus")

-- Window nav
vim.keymap.set("n", "<C-h>", "<C-w>h", { noremap = true, silent = true })
vim.keymap.set("n", "<C-j>", "<C-w>j", { noremap = true, silent = true })
vim.keymap.set("n", "<C-k>", "<C-w>k", { noremap = true, silent = true })
vim.keymap.set("n", "<C-l>", "<C-w>l", { noremap = true, silent = true })

-- No yanks on delete/change
vim.keymap.set({ "n", "v" }, "d", '"_d')
vim.keymap.set({ "n", "v" }, "D", '"_D')
vim.keymap.set({ "n", "v" }, "x", '"_x')
vim.keymap.set({ "n", "v" }, "X", '"_X')
vim.keymap.set({ "n", "v" }, "c", '"_c')
vim.keymap.set({ "n", "v" }, "C", '"_C')

-- Terminal mode
vim.keymap.set("t", "<Esc>", [[<C-\><C-n>]], { noremap = true, silent = true })
vim.keymap.set("t", "<C-h>", [[<C-\><C-n><C-w>h]], { noremap = true, silent = true })
vim.keymap.set("t", "<C-j>", [[<C-\><C-n><C-w>j]], { noremap = true, silent = true })
vim.keymap.set("t", "<C-k>", [[<C-\><C-n><C-w>k]], { noremap = true, silent = true })
vim.keymap.set("t", "<C-l>", [[<C-\><C-n><C-w>l]], { noremap = true, silent = true })

-- Buffer switching
vim.keymap.set("n", "<Tab>", "<cmd>BufferLineCycleNext<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<S-Tab>", "<cmd>BufferLineCyclePrev<CR>", { noremap = true, silent = true })

