require("indent_blankline").setup {
    show_end_of_line = false,
    show_current_context = true,
    show_current_context_start = true,
    use_treesitter = true,
    filetype_exclude = {
        "lspinfo",
        "packer",
        "checkhealth",
        "help",
        "man",
        "norg",
        "",
    },
    char = " ",
    context_char = "▎",
    context_highlight_list = {
        'IndentChar'
    }

}
