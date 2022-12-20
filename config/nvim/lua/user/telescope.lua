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
    -- Default configuration for builtin pickers goes here:
    -- picker_name = {
    --   picker_config_key = value,
    --   ...
    -- }
    -- Now the picker_config_key will be applied every time you call this
    -- builtin picker  pickers = {
    }
  }
