require('onedark').setup {
  colors = {
  },
  highlights = {
    BarbecueSeparator = {fg = '$fg', bg = '$bg0', fmt = 'bold'},
    DiagnosticHint = {fg = '#61afef', bg = '#21252b', fmt = 'bold'},
    DiagnosticSignWarn = { fg = "#e5b07c" , bg = "#21252b"},
    DiagnosticSignError = { fg = "#e06c75" , bg = "#21252b"},
    DiagnosticSignHint = { fg = "#c678dd" , bg = "#21252b"},
    DiagnosticSignInfo = { fg = "#56b6c2" , bg = "#21252b"},
    TabLine = {fg = '#abb2bf', bg = '#282c34'},
    TabLineIn = {bg ='#abb2bf', fg = '#282c34'},
    TabLineHead = {fg = '#282c34', bg = '#61afef'},
    TabLineSel =  {fg = '#282c34', bg = '#61afef'},
    TabFill = {bg = "#282c34"},
    LineNr = { bg = "#21252b"},
    CursorLineNr = { bg = "#21252b"},
    SignColumn = { bg = "#21252b"},
    GitSIgnsAdd = { bg = "#21252b"},
    GItSIgnsChange = { bg = "#21252b"},
    GItSIgnsDelete = { bg = "#21252b"},
    GItSIgnsStagedAdd = { bg = "#21252b"},
    GItSIgnsStagedChanged = { bg = "#21252b"},
    GItSIgnsStagedDelete = { bg = "#21252b"},
    GItSIgnsStagedTopdelete = { bg = "#21252b"},
    IndentChar = { fg = "#61afef" },
    IndentBlanklineContextStart = { sp = "#61afef", fmt = "underline"}


  },
}

local colorscheme = "onedark"

local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
  vim.notify("colorscheme " .. colorscheme .. " not found!")
  return
end

