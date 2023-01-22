require("mason").setup()
require("mason-lspconfig").setup({
  ensure_installed = {'sumneko_lua', 'pyright', 'gopls', 'terraformls'}
})

local lspconfig = require('lspconfig')
require('mason-lspconfig').setup_handlers({
  function(server)
    lspconfig[server].setup({})
  end,
})

