require("project_nvim").setup {
    detection_methods = { "lsp", "pattern" },
    patterns = { ".git", "main.py",">Projects"},
}
