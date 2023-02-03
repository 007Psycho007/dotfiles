local utils = require("lualine.utils.utils")
local highlight = require("lualine.highlight")

local diagnostics_message = require("lualine.component"):extend()

diagnostics_message.default = {
	colors = {
		error = utils.extract_color_from_hllist(
			{ "fg", "sp" },
			{ "DiagnosticError", "LspDiagnosticsDefaultError", "DiffDelete" },
			"#e32636"
		),
		warning = utils.extract_color_from_hllist(
			{ "fg", "sp" },
			{ "DiagnosticWarn", "LspDiagnosticsDefaultWarning", "DiffText" },
			"#ffa500"
		),
		info = utils.extract_color_from_hllist(
			{ "fg", "sp" },
			{ "DiagnosticInfo", "LspDiagnosticsDefaultInformation", "DiffChange" },
			"#ffffff"
		),
		hint = utils.extract_color_from_hllist(
			{ "fg", "sp" },
			{ "DiagnosticHint", "LspDiagnosticsDefaultHint", "DiffAdd" },
			"#273faf"
		),
	},
}
function diagnostics_message:init(options)
	diagnostics_message.super:init(options)
	self.options.colors = vim.tbl_extend("force", diagnostics_message.default.colors, self.options.colors or {})
	self.highlights = { error = "", warn = "", info = "", hint = "" }
	self.highlights.error = highlight.create_component_highlight_group(
		{ fg = self.options.colors.error },
		"diagnostics_message_error",
		self.options
	)
	self.highlights.warn = highlight.create_component_highlight_group(
		{ fg = self.options.colors.warn },
		"diagnostics_message_warn",
		self.options
	)
	self.highlights.info = highlight.create_component_highlight_group(
		{ fg = self.options.colors.info },
		"diagnostics_message_info",
		self.options
	)
	self.highlights.hint = highlight.create_component_highlight_group(
		{ fg = self.options.colors.hint },
		"diagnostics_message_hint",
		self.options
	)
end

function diagnostics_message:update_status(is_focused)
        local r, _ = unpack(vim.api.nvim_win_get_cursor(0))
        local diagnostics = vim.diagnostic.get(0, { lnum = r - 1 })
        if #diagnostics > 0 then
	        local top = diagnostics[1]
	        for _, d in ipairs(diagnostics) do
		        if d.severity < top.severity then
			        top = d
		        end
	        end
	        local icons = { " ", " ", " ", " " }
	        local hl = {
		        self.highlights.error,
		        self.highlights.warn,
		        self.highlights.info,
		        self.highlights.hint,
	        }
	        return highlight.component_format_highlight(hl[top.severity])
		        .. icons[top.severity]
		        .. " "
		        .. utils.stl_escape(top.message)
        else
	        return ""
        end
end

--------------------------------------
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
        return "  "
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
      lualine_c = {{
				diagnostics_message,
				colors = {
					error = "#e86671",
					warn = "#e5c07b",
					info = "#61afef",
					hint = "#61afef",
        }
				}},
      lualine_x = { 'encoding'},
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

