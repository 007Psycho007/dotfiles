require('orgmode').setup_ts_grammar()
require'nvim-treesitter.configs'.setup {
  ensure_installed = {"go", "gomod", "python", "html", "lua", "markdown", "sql", "bash", "dockerfile", "yaml", "hcl", "terraform","org", "norg", "nix","markdown","markdown_inline"},
  sync_install = false, 
  ignore_install = { "" }, -- List of parsers to ignore installing
  highlight = {
    enable = true, -- false will disable the whole extension
    disable = { "" }, -- list of language that will be disabled
    additional_vim_regex_highlighting = true,

  },
  indent = { enable = true, disable = { "yaml" } },
}
