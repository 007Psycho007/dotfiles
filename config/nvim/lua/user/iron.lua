local iron = require("iron.core")

iron.setup {
  config = {
    -- Whether a repl should be discarded or not
    scratch_repl = true,
    -- Your repl definitions come here
    repl_definition = {
      sh = {
        -- Can be a table or a function that
        -- returns a table (see below)
        command = {"zsh"}
      },
      py = {
        command = {"python3"}
            }
    },
    -- How the repl window will be displayed
    -- See below for more information
    repl_open_cmd = "vertical botright 80 split",
  },
}
