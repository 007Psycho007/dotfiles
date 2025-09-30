return {
    'nvim-telescope/telescope.nvim', 
    cmd = "Telescope",
    tag = '0.1.4',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
        require("telescope").load_extension('projects')
        local actions = require "telescope.actions"

        require("telescope").setup {
          defaults = {

            prompt_prefix = "󰍉 ",
            selection_caret = " ",
            path_display = { "smart" },
            initial_mode = "normal",
            borderchars = { "─", "│", "─", "│", "┌", "┐", "┘", "└" }
          },
          pickers = {
          },
          }

    end
}

