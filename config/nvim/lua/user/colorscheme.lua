require('onedark').setup {
  colors = {
  },
  highlights = {
    BarbecueSeparator = {fg = '$fg', bg = '$bg0', fmt = 'bold'},
    DiagnosticHint = {fg = '#61afef', bg = '$bg0', fmt = 'bold'},
    TabLine= {fg = '#282c34', bg = '#61afef'},
  }
}

local colorscheme = "onedark"

local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
  vim.notify("colorscheme " .. colorscheme .. " not found!")
  return
end

