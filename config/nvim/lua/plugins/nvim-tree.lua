return {
    'nvim-tree/nvim-tree.lua',
    cmd = {"NvimTreeOpen","NvimTreeToggle"},
    dependencies = {
        'nvim-tree/nvim-web-devicons',
    },
    config = function()
        local function on_attach(bufnr)
          local api = require('nvim-tree.api')

          local function opts(desc)
            return { desc = 'nvim-tree: ' .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
          end
        api.config.mappings.default_on_attach(bufnr)
        end

        require("nvim-tree").setup{

          on_attach = on_attach,
          renderer = {
            icons = {
              glyphs = {
                default = "",
                symlink = "",
                git = {
                  unstaged = "",
                  staged = "S",
                  unmerged = "",
                  renamed = "➜",
                  deleted = "",
                  untracked = "U",
                  ignored = "◌",
                },
                folder = {
                  arrow_open = "",
                  arrow_closed = "",
                  default = "",
                  open = "",
                  empty = "",
                  empty_open = "",
                  symlink = "",
                },
              },
            },
          },
          disable_netrw = true,
          hijack_netrw = true,
          open_on_tab = false,
          hijack_cursor = false,
          update_cwd = true,
          --update_to_buf_dir = {
          --  enable = true,
          --  auto_open = true,
          --},
          diagnostics = {
            enable = true,
            icons = {
              hint = "",
              info = "",
              warning = "",
              error = "",
            },
          },
          update_focused_file = {
            enable = true,
            update_cwd = true,
            ignore_list = {},
          },
          git = {
            enable = true,
            ignore = true,
            timeout = 500,
          },
          view = {
            width = 30,
            side = "right",
            -- auto_resize = true,
            number = false,
            relativenumber = false,
          },
          -- quit_on_open = 0,
          --git_hl = 1,
          --disable_window_picker = 0,
          --root_folder_modifier = ":t",
          --show_icons = {
          --  git = 1,
          --  folders = 1,
          --  files = 1,
          --  tree_width = 30,
          --},
        }
    vim.opt.fillchars:append { eob = " " }
    end
}

