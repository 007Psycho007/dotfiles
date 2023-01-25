function tab_name(tab) 
   return string.gsub(tab,"%[..%]","") 
end

function tab_modified(tab)
    wins = require("tabby.module.api").get_tab_wins(tab)
    for i, x in pairs(wins) do
        if vim.bo[vim.api.nvim_win_get_buf(x)].modified then
            return ""
        end
    end
    return ""
end

function lsp_diag(buf) 
    diagnostics = vim.diagnostic.get(buf)
    local count = {0, 0, 0, 0}
    
    for _, diagnostic in ipairs(diagnostics) do
        count[diagnostic.severity] = count[diagnostic.severity] + 1
    end
    if count[1] > 0 then
        return vim.bo[buf].modified and "" or ""
    elseif count[2] > 0 then 
        return vim.bo[buf].modified and "" or ""
    end
    return vim.bo[buf].modified and "" or ""
end 

function GetFileExtension(url)
  return url:match("^.+(%..+)$"):sub(2)
end

local function get_modified(buf)
    if vim.bo[buf].modified then
        return ''
    else
        return ''
    end
end

local function get_devicon(filename)
    if string.find(filename,"NvimTree") then
        return "פּ"
    elseif string.find(filename,"SidebarNvim") then
        return "פּ"
    end
    if string.find(filename,"%.") and not string.sub(filename, 1, 1) == "." then
        ext = GetFileExtension(filename)
    else
        ext =''
    end
        return require'nvim-web-devicons'.get_icon(filename, ext, { default = true })
end

local function buffer_name(buf)
  if string.find(buf,"NvimTree") then 
        return "Filetree"
  elseif string.find(buf,"SidebarNvim") then 
        return "Sidebar"
    end
    return buf
end
local theme = {
  fill = 'TabFill',
  -- Also you can do this: fill = { fg='#f2e9de', bg='#907aa9', style='italic' }
  head = 'TabLineHead',
  current_tab = 'TabLineSel',
  inactive_tab = 'TabLineIn',
  tab = 'TabLine',
  win = 'TabLineHead',
  tail = 'TabLineHead',
}
require('tabby.tabline').set(function(line)
  return {
    {
      { '  ', hl = theme.head },
      line.sep('', theme.head, theme.fill),
    },
    line.tabs().foreach(function(tab)
      local hl = tab.is_current() and theme.current_tab or theme.inactive_tab
      return {
        line.sep('', hl, theme.fill),
        tab.number(),
        "",
        tab_name(tab.name()),
        "",
        tab_modified(tab.id),
        line.sep('', hl, theme.fill),
        hl = hl,
        margin = ' ',
      }
    end),
    line.spacer(),
    {
      line.sep('', theme.tail, theme.fill),
      { '  ', hl = theme.tail },
    },
    hl = theme.fill,
  }
end)
