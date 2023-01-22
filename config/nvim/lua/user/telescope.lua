local status_ok, telescope = pcall(require, "telescope")
if not status_ok then
  return
end

telescope.load_extension('projects')
local actions = require "telescope.actions"

telescope.setup {
  defaults = {

    prompt_prefix = "﬌ ",
    selection_caret = " ",
    path_display = { "smart" },
    initial_mode = "normal",
  },
  pickers = {
    }
  }
