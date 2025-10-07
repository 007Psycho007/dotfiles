-- lua/theme.lua
-- Centralized palette + highlights for your setup.
-- Reads env vars (COLOR_*) from your generator, with Tokyo Night fallbacks.

local M = {}

-- Read env with fallback
local function env(name, fallback)
  local v = vim.env[name]
  return (v ~= nil and v ~= "") and v or fallback
end

-- Exported palette
M.palette = {
  bg      = env("COLOR_BACKGROUND", "#1a1b26"),
  fg      = env("COLOR_FOREGROUND", "#c0caf5"),
  accent  = env("COLOR_ACCENT",     "#7aa2f7"),
  black   = env("COLOR_BLACK",      "#15161e"),
  red     = env("COLOR_RED",        "#f7768e"),
  green   = env("COLOR_GREEN",      "#9ece6a"),
  yellow  = env("COLOR_YELLOW",     "#e0af68"),
  blue    = env("COLOR_BLUE",       "#7aa2f7"),
  magenta = env("COLOR_MAGENTA",    "#bb9af7"),
  cyan    = env("COLOR_CYAN",       "#7dcfff"),
  white   = env("COLOR_WHITE",      "#a9b1d6"),
}

-- Base UI highlights
local function apply_base_highlights(p)
  local set = vim.api.nvim_set_hl
  set(0, "Normal",        { fg = p.fg,     bg = p.bg })
  set(0, "NormalNC",      { fg = p.fg,     bg = p.bg })
  set(0, "LineNr",        { fg = p.white })
  set(0, "CursorLine",    { bg = p.black })
  set(0, "CursorLineNr",  { fg = p.accent, bold = true })
  set(0, "Visual",        { fg = p.bg,     bg = p.blue })
  set(0, "Search",        { fg = p.bg,     bg = p.yellow })
  set(0, "IncSearch",     { fg = p.bg,     bg = p.magenta })
  set(0, "Pmenu",         { fg = p.fg,     bg = p.black })
  set(0, "PmenuSel",      { fg = p.bg,     bg = p.accent })
  set(0, "StatusLine",    { fg = p.fg,     bg = p.black })
  set(0, "StatusLineNC",  { fg = p.white,  bg = p.black })
  set(0, "WinSeparator",  { fg = p.black })
  set(0, "MatchParen",    { fg = p.accent, bg = p.black, bold = true })

  -- Diagnostics
  set(0, "DiagnosticError", { fg = p.red })
  set(0, "DiagnosticWarn",  { fg = p.yellow })
  set(0, "DiagnosticInfo",  { fg = p.blue })
  set(0, "DiagnosticHint",  { fg = p.cyan })
end

-- Plugin UI highlights
local function apply_plugin_highlights(p)
  local set = vim.api.nvim_set_hl
  -- Shared float look
  set(0, "NormalFloat", { fg = p.fg, bg = p.black })
  set(0, "FloatBorder", { fg = p.accent, bg = p.black })

  -- Neo-tree
  set(0, "NeoTreeNormal",        { fg = p.fg, bg = p.bg })
  set(0, "NeoTreeNormalNC",      { fg = p.fg, bg = p.bg })
  set(0, "NeoTreeEndOfBuffer",   { fg = p.bg, bg = p.bg })
  set(0, "NeoTreeWinSeparator",  { fg = p.black, bg = p.bg })
  set(0, "NeoTreeFloatBorder",   { fg = p.accent, bg = p.black })
  set(0, "NeoTreeFloatTitle",    { fg = p.bg, bg = p.accent, bold = true })
  set(0, "NeoTreeDirectoryName", { fg = p.blue })
  set(0, "NeoTreeDirectoryIcon", { fg = p.blue })
  set(0, "NeoTreeRootName",      { fg = p.magenta, bold = true })
  set(0, "NeoTreeFileName",      { fg = p.fg })
  set(0, "NeoTreeSymbolicLinkTarget", { fg = p.cyan })
  set(0, "NeoTreeModified",      { fg = p.yellow })
  set(0, "NeoTreeIndentMarker",  { fg = p.black })
  set(0, "NeoTreeExpander",      { fg = p.white })
  set(0, "NeoTreeGitAdded",      { fg = p.green })
  set(0, "NeoTreeGitDeleted",    { fg = p.red })
  set(0, "NeoTreeGitModified",   { fg = p.yellow })
  set(0, "NeoTreeGitRenamed",    { fg = p.blue })
  set(0, "NeoTreeGitUntracked",  { fg = p.cyan })
  set(0, "NeoTreeGitConflict",   { fg = p.red, bold = true })
  set(0, "NeoTreeTabActive",               { fg = p.fg,    bg = p.black, bold = true })
  set(0, "NeoTreeTabInactive",             { fg = p.white, bg = p.bg })
  set(0, "NeoTreeTabSeparatorActive",      { fg = p.accent, bg = p.bg })
  set(0, "NeoTreeTabSeparatorInactive",    { fg = p.black,  bg = p.bg })

  -- which-key
  set(0, "WhichKey",          { fg = p.accent, bold = true })
  set(0, "WhichKeyGroup",     { fg = p.blue })
  set(0, "WhichKeySeparator", { fg = p.white })
  set(0, "WhichKeyDesc",      { fg = p.fg })
  set(0, "WhichKeyFloat",     { bg = p.black })
  set(0, "WhichKeyBorder",    { fg = p.accent, bg = p.black })

  -- Telescope
  set(0, "TelescopeNormal",        { fg = p.fg, bg = p.black })
  set(0, "TelescopeBorder",        { fg = p.accent, bg = p.black })
  set(0, "TelescopePromptNormal",  { fg = p.fg, bg = p.black })
  set(0, "TelescopePromptBorder",  { fg = p.accent, bg = p.black })
  set(0, "TelescopePromptTitle",   { fg = p.bg, bg = p.accent, bold = true })
  set(0, "TelescopeResultsTitle",  { fg = p.bg, bg = p.blue,    bold = true })
  set(0, "TelescopePreviewTitle",  { fg = p.bg, bg = p.green,   bold = true })
  set(0, "TelescopeSelection",     { fg = p.bg, bg = p.accent,  bold = true })
  set(0, "TelescopeMatching",      { fg = p.yellow, bold = true })

  -- Noice / Notify borders
  set(0, "NoicePopupBorder",        { fg = p.accent, bg = p.black })
  set(0, "NoiceCmdlinePopupBorder", { fg = p.accent, bg = p.black })
  set(0, "NotifyBackground",        { bg = p.black })
  set(0, "NotifyINFOBorder",        { fg = p.blue,   bg = p.black })
  set(0, "NotifyWARNBorder",        { fg = p.yellow, bg = p.black })
  set(0, "NotifyERRORBorder",       { fg = p.red,    bg = p.black })
  set(0, "NotifyDEBUGBorder",       { fg = p.white,  bg = p.black })
  set(0, "NotifyTRACEBorder",       { fg = p.magenta,bg = p.black })
end

-- Code syntax: Vim groups + Treesitter + LSP semantic tokens
local function apply_syntax_highlights(p)
  local set = vim.api.nvim_set_hl
  local function link(a, b) set(0, a, { link = b }) end

  -- Vim base groups
  set(0, "Comment",        { fg = p.white, italic = true })
  set(0, "Constant",       { fg = p.yellow })
  set(0, "String",         { fg = p.green })
  set(0, "Character",      { fg = p.green })
  set(0, "Number",         { fg = p.yellow })
  set(0, "Boolean",        { fg = p.yellow })
  set(0, "Float",          { fg = p.yellow })
  set(0, "Identifier",     { fg = p.fg })
  set(0, "Function",       { fg = p.blue })
  set(0, "Statement",      { fg = p.magenta })
  set(0, "Conditional",    { fg = p.magenta })
  set(0, "Repeat",         { fg = p.magenta })
  set(0, "Label",          { fg = p.magenta })
  set(0, "Operator",       { fg = p.fg })
  set(0, "Keyword",        { fg = p.magenta })
  set(0, "Exception",      { fg = p.magenta })
  set(0, "PreProc",        { fg = p.magenta })
  set(0, "Include",        { fg = p.magenta })
  set(0, "Define",         { fg = p.magenta })
  set(0, "Macro",          { fg = p.magenta })
  set(0, "PreCondit",      { fg = p.magenta })
  set(0, "Type",           { fg = p.yellow })
  set(0, "StorageClass",   { fg = p.yellow })
  set(0, "Structure",      { fg = p.yellow })
  set(0, "Typedef",        { fg = p.yellow })
  set(0, "Special",        { fg = p.cyan })
  set(0, "SpecialComment", { fg = p.white, italic = true })
  set(0, "Delimiter",      { fg = p.fg })
  set(0, "Todo",           { fg = p.bg, bg = p.yellow, bold = true })

  -- Treesitter
  link("@comment",                "Comment")
  link("@punctuation",            "Delimiter")
  link("@punctuation.delimiter",  "Delimiter")
  link("@punctuation.bracket",    "Delimiter")
  link("@punctuation.special",    "Special")

  link("@string",                 "String")
  link("@string.escape",          "Special")
  link("@string.special",         "Special")
  link("@character",              "Character")

  link("@constant",               "Constant")
  link("@constant.builtin",       "Constant")
  link("@constant.macro",         "Macro")
  link("@number",                 "Number")
  link("@boolean",                "Boolean")
  link("@float",                  "Float")

  link("@function",               "Function")
  link("@function.builtin",       "Function")
  link("@function.macro",         "Macro")
  link("@method",                 "Function")
  set(0, "@constructor",          { fg = M.palette.cyan })

  link("@parameter",              "Identifier")
  link("@variable",               "Identifier")
  set(0, "@variable.builtin",     { fg = M.palette.cyan, italic = true })
  set(0, "@field",                { fg = M.palette.cyan })
  set(0, "@property",             { fg = M.palette.cyan })

  link("@keyword",                "Keyword")
  link("@keyword.function",       "Keyword")
  link("@keyword.operator",       "Operator")
  link("@keyword.return",         "Keyword")
  link("@conditional",            "Conditional")
  link("@repeat",                 "Repeat")
  set(0, "@operator",             { fg = M.palette.fg })

  set(0, "@type",                 { fg = M.palette.yellow })
  set(0, "@type.builtin",         { fg = M.palette.yellow, italic = true })
  set(0, "@namespace",            { fg = M.palette.magenta })
  set(0, "@symbol",               { fg = M.palette.cyan })

  -- Markup / tags
  set(0, "@tag",                  { fg = M.palette.blue })
  set(0, "@tag.delimiter",        { fg = M.palette.fg })
  set(0, "@attribute",            { fg = M.palette.yellow })
  set(0, "@markup.italic",        { italic = true })
  set(0, "@markup.bold",          { bold = true })
  set(0, "@markup.heading",       { fg = M.palette.magenta, bold = true })
  set(0, "@markup.link",          { fg = M.palette.blue, underline = true })
  set(0, "@markup.raw",           { fg = M.palette.green })

  -- LSP semantic tokens
  link("@lsp.type.class",         "@type")
  link("@lsp.type.enum",          "@type")
  link("@lsp.type.interface",     "@type")
  link("@lsp.type.struct",        "@type")
  link("@lsp.type.type",          "@type")
  link("@lsp.type.typeParameter", "@type")
  link("@lsp.type.parameter",     "@parameter")
  link("@lsp.type.variable",      "@variable")
  link("@lsp.type.property",      "@property")
  link("@lsp.type.enumMember",    "@constant")
  link("@lsp.type.function",      "@function")
  link("@lsp.type.method",        "@method")
  link("@lsp.type.macro",         "@function.macro")
  link("@lsp.type.keyword",       "@keyword")
  link("@lsp.type.comment",       "@comment")
  link("@lsp.type.string",        "@string")
  link("@lsp.type.number",        "@number")
  link("@lsp.type.boolean",       "@boolean")
  link("@lsp.typemod.variable.readonly", "@constant")

  -- Diagnostics underline
  set(0, "DiagnosticUnderlineError", { undercurl = true, sp = M.palette.red })
  set(0, "DiagnosticUnderlineWarn",  { undercurl = true, sp = M.palette.yellow })
  set(0, "DiagnosticUnderlineInfo",  { undercurl = true, sp = M.palette.blue })
  set(0, "DiagnosticUnderlineHint",  { undercurl = true, sp = M.palette.cyan })

  -- Inlay hints
  set(0, "LspInlayHint", { fg = M.palette.white, bg = M.palette.black, italic = true })
end

-- Public helper: lualine theme built from palette
local function lualine_theme_from(p)
  local common_b = { fg = p.fg, bg = p.black }
  local common_c = { fg = p.fg, bg = p.bg }
  return {
    normal  = { a = { fg = p.bg, bg = p.accent, gui = "bold" }, b = common_b, c = common_c },
    insert  = { a = { fg = p.bg, bg = p.blue,   gui = "bold" }, b = common_b, c = common_c },
    visual  = { a = { fg = p.bg, bg = p.magenta,gui = "bold" }, b = common_b, c = common_c },
    replace = { a = { fg = p.bg, bg = p.red,    gui = "bold" }, b = common_b, c = common_c },
    command = { a = { fg = p.bg, bg = p.yellow, gui = "bold" }, b = common_b, c = common_c },
    inactive= { a = { fg = p.white, bg = p.bg }, b = { fg = p.white, bg = p.bg }, c = common_c },
  }
end

function M.lualine_theme()
  return lualine_theme_from(M.palette)
end

-- Apply everything + reapply on colorscheme changes
function M.setup()
  apply_base_highlights(M.palette)
  apply_plugin_highlights(M.palette)
  apply_syntax_highlights(M.palette)

  vim.api.nvim_create_autocmd({ "ColorScheme", "VimEnter" }, {
    callback = function()
      apply_base_highlights(M.palette)
      apply_plugin_highlights(M.palette)
      apply_syntax_highlights(M.palette)
    end,
  })
end

return M

