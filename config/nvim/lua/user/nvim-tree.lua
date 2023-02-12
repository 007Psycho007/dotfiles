-- following options are the default
-- each of these are documented in `:help nvim-tree.OPTION_NAME`
-- vim.g.nvim_tree_icons = {
--   default = "",
--   symlink = "",
--   git = {
--     unstaged = "",
--     staged = "S",
--     unmerged = "",
--     renamed = "➜",
--     deleted = "",
--     untracked = "U",
--     ignored = "◌",
--   },
--   folder = {
--     arrow_open = "",
--     arrow_closed = "",
--     default = "",
--     open = "",
--     empty = "",
--     empty_open = "",
--     symlink = "",
--   },
-- }

local status_ok, nvim_tree = pcall(require, "nvim-tree")
if not status_ok then
  return
end

local config_status_ok, nvim_tree_config = pcall(require, "nvim-tree.config")
if not config_status_ok then
  return
end

local tree_cb = nvim_tree_config.nvim_tree_callback

nvim_tree.setup {
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
  remove_keymaps = {"<Tab>"},
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
    hide_root_folder = false,
    side = "right",
    -- auto_resize = true,
    mappings = {
      custom_only = false,
      list = {
        { key = { "l", "<CR>", "o" }, cb = tree_cb "edit" },
        { key = "h", cb = tree_cb "close_node" },
        { key = "v", cb = tree_cb "vsplit" },
      },
    },
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



vim.api.nvim_create_autocmd("BufEnter", {
  group = vim.api.nvim_create_augroup("NvimTreeClose", {clear = true}),
  pattern = "NvimTree_*",
  callback = function()
    local layout = vim.api.nvim_call_function("winlayout", {})
    if layout[1] == "leaf" and vim.api.nvim_buf_get_option(vim.api.nvim_win_get_buf(layout[2]), "filetype") == "NvimTree" and layout[3] == nil then vim.cmd("confirm quit") end
  end
})

local function open_nvim_tree(data)

  -- buffer is a directory
  local directory = vim.fn.isdirectory(data.file) == 1

  local no_name = data.file == "" and vim.bo[data.buf].buftype == ""

  if not directory and not no_name then
    return
  end

  -- change to the directory
  if directory then
    vim.cmd.cd(data.file)
  
  -- open the tree
    require("nvim-tree.api").tree.open()
  end

  if no_name then
    require("nvim-tree.api").tree.toggle({ focus = false, find_file = true, })
  end
end

vim.api.nvim_create_autocmd({ "VimEnter" }, { callback = open_nvim_tree })
