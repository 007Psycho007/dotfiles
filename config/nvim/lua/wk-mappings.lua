local status_ok, wk = pcall(require, "which-key")
if not status_ok then
  return
end

local mappings = {
  { "<leader>a", group = "Tabnine", nowait = true, remap = false, icon={icon="󰧑",hl="WhichKeyIconOrange"}},
  { "<leader>aa", "<cmd>TabnineToggle<cr>", desc = "Toggle Tabnine", nowait = true, remap = false },
  { "<leader>ac", "<cmd>TabnineChat<cr>", desc = "Chat", nowait = true, remap = false ,icon={icon="󰧑",hl="WhichKeyIconOrange"}},

  { "<leader>b", group = "buffers", icon={icon="󰈔",hl="WhichKeyIconOrange"}, expand = function()
      return require("which-key.extras").expand.buf()
    end
  },

  { "<leader>c", group = "Code Actions", nowait = true, remap = false, icon={icon=" ",hl="WhichKeyIconOrange"}},
  { "<leader>cc", "<cmd>ColorizerToggle<cr>", desc = "Toggle Colorizer", nowait = true, remap = false, icon="" },
  { "<leader>ch", "<cmd>HexToggle<cr>", desc = "Toggle Hexedit", nowait = true, remap = false, icon="󱊧" },
  { "<leader>cj", group = "JSON", nowait = true, remap = false, icon=""},
  { "<leader>cjf", "<CMD>:%! jq .<cr>", desc = "Format JSON", nowait = true, remap = false },
  { "<leader>ct", "<cmd>TodoTelescope<cr>", desc = "Todos", nowait = true, remap = false, icon="" },

  { "<leader>d", "<cmd>bdelete<cr>", desc = "Close Buffer", nowait = true, remap = false, icon={icon=" ",hl="WhichKeyIconBlue"}},

  { "<leader>e", "<cmd>Lspsaga show_line_diagnostics<cr>", desc = "Line Diagnostics", nowait = true, remap = false, icon={icon="󱖫 ",hl="WhichKeyIconBlue"} },

  { "<leader>f", group = "Files/Search", nowait = true, remap = false,icon={icon="󰱽 ",hl="WhichKeyIconOrange"} },
  { "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Find Files", nowait = true, remap = false },
  { "<leader>fg", "<cmd>Telescope live_grep<cr>", desc = "Live Grep", nowait = true, remap = false },
  { "<leader>fs", "<cmd>SidebarNvimToggle<cr>", desc = "Sidebar", nowait = true, remap = false },
  { "<leader>ft", "<cmd>NvimTreeToggle<cr>", desc = "NVIM Tree", nowait = true, remap = false },

  { "<leader>g", group = "Git", nowait = true, remap = false },
  { "<leader>gb", "<cmd>Telescope git_branches<cr>", desc = "Checkout branch", nowait = true, remap = false },
  { "<leader>gc", "<cmd>Telescope git_commits<cr>", desc = "Checkout commit", nowait = true, remap = false },
  { "<leader>gd", "<cmd>Gitsigns diffthis HEAD<cr>", desc = "Diff", nowait = true, remap = false },
  { "<leader>gg", "<cmd>Neogit<cr>", desc = "NeoGit", nowait = true, remap = false },
  { "<leader>gj", "<cmd>lua require 'gitsigns'.next_hunk()<cr>", desc = "Next Hunk", nowait = true, remap = false },
  { "<leader>gk", "<cmd>lua require 'gitsigns'.prev_hunk()<cr>", desc = "Prev Hunk", nowait = true, remap = false },
  { "<leader>gl", "<cmd>lua require 'gitsigns'.blame_line()<cr>", desc = "Blame", nowait = true, remap = false },
  { "<leader>go", "<cmd>Telescope git_status<cr>", desc = "Open changed file", nowait = true, remap = false },
  { "<leader>gp", "<cmd>lua require 'gitsigns'.preview_hunk()<cr>", desc = "Preview Hunk", nowait = true, remap = false },
  { "<leader>gs", "<cmd>lua require 'gitsigns'.stage_hunk()<cr>", desc = "Stage Hunk", nowait = true, remap = false },
  { "<leader>gu", "<cmd>lua require 'gitsigns'.undo_stage_hunk()<cr>", desc = "Undo Stage Hunk", nowait = true, remap = false },

  { "<leader>h", "<cmd>nohlsearch<CR>", desc = "No Highlight", nowait = true, remap = false , icon = {icon="󰙒 ",hl="WhichKeyIconBlue"}},

  { "<leader>l", group = "LSP", nowait = true, remap = false, icon ={icon=" ",hl="WhichKeyIconOrange"}},
  { "<leader>lI", "<cmd>LspInstallInfo<cr>", desc = "Installer Info", nowait = true, remap = false, icon = " " },
  { "<leader>lc", "<cmd>Telescope lsp_references<CR>", desc = "Declaration", nowait = true, remap = false, icon = " " },
  { "<leader>ld", "<cmd>Lspsaga hover_doc<cr>", desc = "Documenation", nowait = true, remap = false, icon = " " },
  { "<leader>lf", "<cmd>Telescope lsp_definitions<CR>", desc = "Definition", nowait = true, remap = false, icon = " " },
  { "<leader>li", "<cmd>LspInfo<cr>", desc = "Info", nowait = true, remap = false, icon = " " },
  { "<leader>lo", "<cmd>SymbolsOutline<cr>", desc = "Code Outline", nowait = true, remap = false , icon = " "},
  { "<leader>lr", "<cmd>Lspsaga rename<cr>", desc = "Rename Definition", nowait = true, remap = false, icon = " " },
  { "<leader>ls", "<cmd>Telescope diagnostics<CR>", desc = "Diagnostic List", nowait = true, remap = false },

  { "<leader>n", "<cmd>tabnew<cr>", desc = "New Tab", nowait = true, remap = false, icon={icon="󰓩 ",hl="WhichKeyIconBlue"}},

  { "<leader>o", group = "Obsidian", nowait = true, remap = false, icon ={icon=" ",hl="WhichKeyIconOrange"}},
  { "<leader>os", "<cmd>ObsidianQuickSwitch<cr>", desc = "Switch Note", nowait = true, remap = false, icon = " " },
  { "<leader>oc", "<cmd>ObsidianToggleCheckbox<cr>", desc = "Toggle Checkbox", nowait = true, remap = false, icon = " " },
  
  
  { "<leader>q", "<cmd>qa!<CR>", desc = "Quit without saving", nowait = true, remap = false, icon={icon="󰈆 ",hl="WhichKeyIconRed"} },

  { "<leader>s", group = "Split", nowait = true, remap = false, icon={icon=" ",hl="WhichKeyIconBlue"} },
  { "<leader>sc", "<cmd>close<cr>", desc = "Close Window", nowait = true, remap = false,icon={icon=" ",hl="WhichKeyIconBlue"}},
  { "<leader>sh", "<cmd>split<cr>", desc = "Split Horizontal", nowait = true, remap = false,icon={icon=" ",hl="WhichKeyIconBlue"}},
  { "<leader>sv", "<cmd>vsplit<cr>", desc = "Split Vertical", nowait = true, remap = false,icon={icon=" ",hl="WhichKeyIconBlue"} },

  { "<leader>t", group = "Terminal", nowait = true, remap = false, icon={icon="",hl="WhichKeyIconOrange"}},
  { "<leader>tf", "<cmd>ToggleTerm direction=float<cr>", desc = "Float", nowait = true, remap = false },
  { "<leader>th", "<cmd>ToggleTerm size=10 direction=horizontal<cr>", desc = "Horizontal", nowait = true, remap = false },
  { "<leader>tt", "<cmd>ToggleTerm direction=tab<cr>", desc = "Tab", nowait = true, remap = false },
  { "<leader>tv", "<cmd>ToggleTerm size=80 direction=vertical<cr>", desc = "Vertical", nowait = true, remap = false },

  { "<leader>w", "<cmd>w!<CR>", desc = "Save", nowait = true, remap = false, icon ={icon="",hl="WhichKeyIconGreen"}},
  { "<leader>x", "<cmd>tabclose<cr>", desc = "Close Tab", nowait = true, remap = false ,icon={icon="󰭌",hl="WhichKeyIconRed"}},
  { "<leader>z", "<cmd>:ZenMode<cr>", desc = "Zen Mode", nowait = true, remap = false, icon = "󰚀" },
}

local vopts = {
  mode = "v", -- VISUAL mode
  prefix = "<leader>",
  buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
  silent = true, -- use `silent` when creating keymaps
  noremap = true, -- use `noremap` when creating keymaps
  nowait = true, -- use `nowait` when creating keymaps
}
local vmappings = {
  ["/"] = { "<ESC><CMD>lua require(\"Comment.api\").toggle_linewise_op(vim.fn.visualmode())<CR>", "Comment" },
  ["s"] = {"<cmd>ToggleTermSendVisualLines<cr>", "Send Visual"},
}

local status_ok, wk = pcall(require, "which-key")
if not status_ok then
  return
end

wk.add(mappings)
