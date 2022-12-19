function GetFileExtension(url)
  return url:match("^.+(%..+)$"):sub(2)
end

local function get_modified(buf)
    if vim.bo[buf].modified then
        return ''
    else
        return ' '
    end
end

local function get_devicon(filename)
    if filename == "NvimTree_1" then 
        return "פּ"
    end
    if string.find(filename,"%.") then
        ext = GetFileExtension(filename)
    else
        ext =''
    end
        return require'nvim-web-devicons'.get_icon(filename, ext, { default = true })
end
local theme = {
  fill = 'TabLineFill',
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
      local hl = tab.is_current() and theme.current_tab or theme.tab
      return {
        line.sep('', hl, theme.fill),
        tab.number(),
        line.sep('', hl, theme.fill),
        hl = hl,
        margin = ' ',
      }
    end),
    line.spacer(),
    line.wins_in_tab(line.api.get_current_tab()).foreach(function(win)
      local hl = win.is_current() and theme.current_tab or theme.inactive_tab
      return {
        line.sep('', hl, theme.fill),
        get_devicon(win.buf_name()),
        win.buf_name(),
        get_modified(win.buf().id),
        line.sep('', hl, theme.fill),
        hl = hl,
        margin = ' ',
      }
    end),
    {
      line.sep('', theme.tail, theme.fill),
      { '  ', hl = theme.tail },
    },
    hl = theme.fill,
  }
end)
