return {
    "sidebar-nvim/sidebar.nvim",
    main = "sidebar-nvim",
    cmd = "SidebarNvimToggle",
    opts = {
      side = "right",
      sections = { "buffers", "git", "symbols" },
      section_separator = {"", "─────────", ""},
    }

}
