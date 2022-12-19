
function getconda()
    if vim.bo.filetype ~= "python" then
        return ""
    end
    if os.getenv("CONDA_DEFAULT_ENV") == nil then 
        return "System"
    end
    return os.getenv("CONDA_DEFAULT_ENV")
end

local status = function (str)
    if (str == "NORMAL") then
        return "  "
    elseif (str == "INSERT") then
        return "  "
    elseif (str == "COMMAND") then
        return "  "
    elseif (str == "V-LINE") then
        return " "
    elseif (str == "VISUAL") then
        return "  "
    elseif (str == "V-BLOCK") then
        return " "
    elseif (str == "REPLACE") then
        return "  "
    elseif (str == "TERMINAL") then
        return "  "
    elseif (str == "O-PENDING") then
        return "  "
    else return str
    end
end


require('lualine').setup {
    options = {
      icons_enabled = true,
      theme = 'onedark',
      component_separators = { left = '', right = ''},
      section_separators = { left = '', right = ''},
      disabled_filetypes = {},
      always_divide_middle = true,
      globalstatus = true,
    },
    sections = {
      lualine_a ={ { 'mode',fmt = status } },
      lualine_b = {'branch', 'diff', 'diagnostics'},
      lualine_c = {},
      lualine_x = {'encoding'},
      lualine_y = {'filetype', {getconda}},
      lualine_z = {'location'}
    },
    inactive_sections = {
      lualine_a = {},
      lualine_b = {},
      lualine_c = {'filename'},
      lualine_x = {'location'},
      lualine_y = {},
      lualine_z = {}
    },
    tabline = {},
    --extensions = {"nvim-tree"}
}

