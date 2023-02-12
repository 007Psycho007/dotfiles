require("mason").setup()
require("mason-lspconfig").setup({
  ensure_installed = {'pyright', 'gopls', 'terraformls'}
})
require("mason-nvim-dap").setup({
  ensure_installed = { "debugpy", "delve" },
  automatic_installation = true,
  automatic_setup = true
})

local lspconfig = require('lspconfig')
require('mason-lspconfig').setup_handlers({
  function(server)
    lspconfig[server].setup({})
  end,
})
require 'mason-nvim-dap'.setup_handlers()

