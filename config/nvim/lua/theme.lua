-- Centralized palette + highlights for your setup.
-- Reads env vars (COLOR_*) from your generator, with Tokyo Night fallbacks.

local M = {}
-- sanitize color strings from env
local function trim(s) return (s or ""):gsub("^%s+", ""):gsub("%s+$", "") end
local function unquote(s)
  s = trim(s or "")
  if (s:sub(1,1) == '"' and s:sub(-1) == '"') or (s:sub(1,1) == "'" and s:sub(-1) == "'") then
    return s:sub(2, -2)
  end
  return s
end
local function rgb_to_hex_str(r,g,b) return string.format("#%02x%02x%02x", r, g, b) end
local function parse_rgb_fn(s)
  -- accepts rgb(216,222,233) with arbitrary spaces
  local r,g,b = s:match("^rgb%s*%(%s*(%d+)%s*,%s*(%d+)%s*,%s*(%d+)%s*%)$")
  if r and g and b then
    r,g,b = tonumber(r), tonumber(g), tonumber(b)
    if r and g and b and r>=0 and r<=255 and g>=0 and g<=255 and b>=0 and b<=255 then
      return rgb_to_hex_str(r,g,b)
    end
  end
  return nil
end
local function normalize_color(s, fallback)
  s = unquote(s)
  if s == "" then return fallback end
  -- rgb(...) -> #RRGGBB
  local maybe = parse_rgb_fn(s)
  if maybe then return maybe end
  -- allow #RRGGBB (case-insensitive) with stray spaces
  s = s:gsub("%s+", "")
  if s:match("^#%x%x%x%x%x%x$") then
    return "#" .. s:sub(2):upper()
  end
  return fallback
end

-- env with fallback, then normalize to hex
local function env_color(name, fb)
  local v = vim.env[name]
  return normalize_color(v or "", fb)
end

-- Exported palette
M.palette = {
  bg      = env_color("COLOR_BACKGROUND", "#1A1B26"),
  fg      = env_color("COLOR_FOREGROUND", "#C0CAF5"),
  accent  = env_color("COLOR_ACCENT",     "#7AA2F7"),
  black   = env_color("COLOR_BLACK",      "#15161E"),
  red     = env_color("COLOR_RED",        "#F7768E"),
  green   = env_color("COLOR_GREEN",      "#9ECE6A"),
  yellow  = env_color("COLOR_YELLOW",     "#E0AF68"),
  blue    = env_color("COLOR_BLUE",       "#7AA2F7"),
  magenta = env_color("COLOR_MAGENTA",    "#BB9AF7"),
  cyan    = env_color("COLOR_CYAN",       "#7DCFFF"),
  white   = env_color("COLOR_WHITE",      "#A9B1D6"),
}
-- --- color helpers (hex) ---
local function hex_to_rgb(hex)
  hex = hex:gsub("#","")
  return tonumber(hex:sub(1,2),16), tonumber(hex:sub(3,4),16), tonumber(hex:sub(5,6),16)
end
local function rgb_to_hex(r,g,b)
  return string.format("#%02x%02x%02x", r, g, b)
end
-- mix c1 toward c2 by t (0..1): t=0 keeps c1, t=1 becomes c2
local function mix(c1, c2, t)
  local r1,g1,b1 = hex_to_rgb(c1)
  local r2,g2,b2 = hex_to_rgb(c2)
  local r = math.floor(r1*(1-t) + r2*t + 0.5)
  local g = math.floor(g1*(1-t) + g2*t + 0.5)
  local b = math.floor(b1*(1-t) + b2*t + 0.5)
  return rgb_to_hex(r,g,b)
end

-- Base UI highlights
local function apply_base_highlights(p)
  local set = vim.api.nvim_set_hl

  -- Editor core
  set(0, "Normal",        { fg = p.fg, bg = p.bg })
  set(0, "NormalNC",      { fg = p.fg, bg = p.bg })
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

  -- Diagnostics (colors only; underlines set in syntax block)
  set(0, "DiagnosticError", { fg = p.red })
  set(0, "DiagnosticWarn",  { fg = p.yellow })
  set(0, "DiagnosticInfo",  { fg = p.blue })
  set(0, "DiagnosticHint",  { fg = p.cyan })

  -- Gutter: make numbers/signs dimmer than main text
  local dimnr = mix(p.fg, p.bg, 0.70)  -- 70% toward background
  set(0, "LineNr",       { fg = dimnr })
  set(0, "LineNrAbove",  { fg = dimnr })   -- Neovim 0.9+
  set(0, "LineNrBelow",  { fg = dimnr })   -- Neovim 0.9+
  set(0, "SignColumn",   { fg = dimnr, bg = p.bg })
  set(0, "FoldColumn",   { fg = dimnr, bg = p.bg })
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

  -- Neo-tree Git (basic)
  set(0, "NeoTreeGitAdded",      { fg = p.green })
  set(0, "NeoTreeGitDeleted",    { fg = p.red })
  set(0, "NeoTreeGitModified",   { fg = p.yellow })
  set(0, "NeoTreeGitRenamed",    { fg = p.blue })
  set(0, "NeoTreeGitUntracked",  { fg = p.cyan })
  set(0, "NeoTreeGitConflict",   { fg = p.red, bold = true })

  -- Neo-tree Git (more states / aliases)
  local dimgit = mix(p.white, p.bg, 0.55)  -- muted for ignored/etc.
  set(0, "NeoTreeGitStaged",      { fg = p.green,  bold = true })
  set(0, "NeoTreeGitUnstaged",    { fg = p.yellow })
  set(0, "NeoTreeGitIgnored",     { fg = dimgit })
  set(0, "NeoTreeGitUnmerged",    { fg = p.red,    bold = true })
  set(0, "NeoTreeGitDirty",       { fg = p.yellow })
  set(0, "NeoTreeGitClean",       { fg = p.green })
  set(0, "NeoTreeGitStash",       { fg = p.magenta })
  set(0, "NeoTreeGitSubmodule",   { fg = p.cyan })

  set(0, "NeoTreeTabActive",               { fg = p.fg,    bg = p.black, bold = true })
  set(0, "NeoTreeTabInactive",             { fg = p.white, bg = p.bg })
  set(0, "NeoTreeTabSeparatorActive",      { fg = p.accent, bg = p.bg })
  set(0, "NeoTreeTabSeparatorInactive",    { fg = p.black,  bg = p.bg })

  set(0, "NeoTreeGitUntracked",      { fg = p.red })        -- file/folder name
  set(0, "NeoTreeGitUntrackedIcon",  { fg = p.red })        -- some versions style the icon separately

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
  set(0, "@constructor",          { fg = p.cyan })

  link("@parameter",              "Identifier")
  link("@variable",               "Identifier")
  set(0, "@variable.builtin",     { fg = p.cyan, italic = true })
  set(0, "@field",                { fg = p.cyan })
  set(0, "@property",             { fg = p.cyan })

  link("@keyword",                "Keyword")
  link("@keyword.function",       "Keyword")
  link("@keyword.operator",       "Operator")
  link("@keyword.return",         "Keyword")
  link("@conditional",            "Conditional")
  link("@repeat",                 "Repeat")
  set(0, "@operator",             { fg = p.fg })

  set(0, "@type",                 { fg = p.yellow })
  set(0, "@type.builtin",         { fg = p.yellow, italic = true })
  set(0, "@namespace",            { fg = p.magenta })
  set(0, "@symbol",               { fg = p.cyan })

  -- Markup / tags
  set(0, "@tag",                  { fg = p.blue })
  set(0, "@tag.delimiter",        { fg = p.fg })
  set(0, "@attribute",            { fg = p.yellow })
  set(0, "@markup.italic",        { italic = true })
  set(0, "@markup.bold",          { bold = true })
  set(0, "@markup.heading",       { fg = p.magenta, bold = true })
  set(0, "@markup.link",          { fg = p.blue, underline = true })
  set(0, "@markup.raw",           { fg = p.green })

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
  set(0, "DiagnosticUnderlineError", { undercurl = true, sp = p.red })
  set(0, "DiagnosticUnderlineWarn",  { undercurl = true, sp = p.yellow })
  set(0, "DiagnosticUnderlineInfo",  { undercurl = true, sp = p.blue })
  set(0, "DiagnosticUnderlineHint",  { undercurl = true, sp = p.cyan })

  -- Inlay hints
  set(0, "LspInlayHint", { fg = p.white, bg = p.black, italic = true })
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

