require('onedark').setup {
  colors = {
  },
  highlights = {
    BarbecueSeparator = {fg = '$fg', bg = '$bg0', fmt = 'bold'},
    DiagnosticHint = {fg = '#61afef', bg = '$bg0', fmt = 'bold'},
    TabLine = {fg = '#abb2bf', bg = '#282c34'},
    TabLineIn = {bg ='#abb2bf', fg = '#282c34'},
    TabLineHead = {fg = '#282c34', bg = '#61afef'},
    TabLineSel =  {fg = '#282c34', bg = '#61afef'},
    TabFill = {bg = "#282c34"},
    IndentChar = { fg = "#61afef" },
    IndentBlanklineContextStart = { sp = "#61afef", fmt = "underline"},
    LspDiagnosticsVirtualTextError = { fg = "#e86671" },
    NvimTreeWinSeparator = { fg = '#61afef'},
    NvimTreeNormal = { bg = '#282c34'},
    NvimTreeEndOfBuffer = { fg = 'NONE',bg = '#282c34'},
    InclineFocused = {fg = "#282c34", bg = "#61afef"},
    InclineUnfocused = {bg ='#abb2bf', fg = '#282c34'},
    OutlineBlue = { fg = "#61afef" }
  },
}

local colorscheme = "onedark"

local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
  vim.notify("colorscheme " .. colorscheme .. " not found!")
  return
end

vim.opt.fillchars:append('eob: ')


