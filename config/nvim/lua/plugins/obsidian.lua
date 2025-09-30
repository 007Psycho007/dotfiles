return {
  "epwalsh/obsidian.nvim",
  version = "*",  -- recommended, use latest release instead of latest commit
  lazy = true,
  ft = "markdown",
  -- Replace the above line with this if you only want to load obsidian.nvim for markdown files in your vault:
  -- event = {
  --   -- If you want to use the home shortcut '~' here you need to call 'vim.fn.expand'.
  --   -- E.g. "BufReadPre " .. vim.fn.expand "~" .. "/my-vault/*.md"
  --   -- refer to `:h file-pattern` for more examples
  --   "BufReadPre path/to/my-vault/*.md",
  --   "BufNewFile path/to/my-vault/*.md",
  -- },
  dependencies = {
    -- Required.
    "nvim-lua/plenary.nvim",

  },
  opts = {
    workspaces = {
      {
        name = "Wiki",
        path = "~/Documents/wiki",
        overrides = {
          notes_subdir = "notes",
        },
      },
    },
    mappings = {},
    completion = {
    -- Set to false to disable completion.
      nvim_cmp = true,
    -- Trigger completion at 2 chars.
      min_chars = 2,
    },
    ui = {
        enable = true,  -- set to false to disable all additional syntax features
        update_debounce = 200,  -- update delay after a text change (in milliseconds)
        max_file_length = 5000,  -- disable UI features for files with more than this many lines
        -- Define how various check-boxes are displayed
        checkboxes = {
          -- NOTE: the 'char' value has to be a single character, and the highlight groups are defined below.
          [" "] = { char = "󰄱", hl_group = "ObsidianTodo" },
          ["x"] = { char = "", hl_group = "ObsidianDone" },
          [">"] = { char = "", hl_group = "ObsidianRightArrow" },
          ["~"] = { char = "󰰱", hl_group = "ObsidianTilde" },
          ["!"] = { char = "", hl_group = "ObsidianImportant" },
          -- Replace the above with this if you don't have a patched font:
          -- [" "] = { char = "☐", hl_group = "ObsidianTodo" },
          -- ["x"] = { char = "✔", hl_group = "ObsidianDone" },

          -- You can also add more custom ones...
        },
        -- Use bullet marks for non-checkbox lists.
        bullets = { char = "•", hl_group = "ObsidianBullet" },
        external_link_icon = { char = "", hl_group = "ObsidianExtLinkIcon" },
        -- Replace the above with this if you don't have a patched font:
        -- external_link_icon = { char = "", hl_group = "ObsidianExtLinkIcon" },
        reference_text = { hl_group = "ObsidianRefText" },
        highlight_text = { hl_group = "ObsidianHighlightText" },
        tags = { hl_group = "ObsidianTag" },
        block_ids = { hl_group = "ObsidianBlockID" },
        hl_groups = {
          -- The options are passed directly to `vim.api.nvim_set_hl()`. See `:help nvim_set_hl`.
          ObsidianTodo = { bold = true, fg = "#e86671" },
          ObsidianDone = { bold = true, fg = "#61afef" },
          ObsidianRightArrow = { bold = true, fg = "#e86671" },
          ObsidianTilde = { bold = true, fg = "#e86671" },
          ObsidianImportant = { bold = true, fg = "#B5585F" },
          ObsidianBullet = { bold = true, fg = "#61afef" },
          ObsidianRefText = { underline = true, fg = "#c678dd" },
          ObsidianExtLinkIcon = { fg = "#c678dd" },
          ObsidianTag = { italic = true, fg = "#61afef" },
          ObsidianBlockID = { italic = true, fg = "#61afef" },
          ObsidianHighlightText = { bg = "#d19a66" },
        },
    },
    attachments = {
      img_folder = "assets"
    },
  }
}
