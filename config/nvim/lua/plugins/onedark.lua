return {
    'navarasu/onedark.nvim',
    priority = 100,
    config = function()
        require('onedark').setup{
          colors = {
          },
          highlights = {
            CmpBorder = {fg = '#61afef', bg = "NONE"},
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
            OutlineBlue = { fg = "#61afef" },

            PmenuSel = { bg = "#282C34", fg = "NONE" },
            Pmenu = { fg = "#C5CDD9", bg = "#22252A" },

            CmpItemAbbrDeprecated = { fg = "#7E8294", bg = "NONE", strikethrough = true },
            CmpItemAbbrMatch = { fg = "#61afef", bg = "NONE", bold = true },
            CmpItemAbbrMatchFuzzy = { fg = "#61afef", bg = "NONE", bold = true },
            CmpItemMenu = { fg = "#61afef", bg = "NONE", italic = true },

            CmpItemKindField = { fg = "#282c34", bg = "#B5585F" },
            CmpItemKindProperty = { fg = "#282c34", bg = "#B5585F" },
            CmpItemKindEvent = { fg = "#282c34", bg = "#B5585F" },

            CmpItemKindText = { fg = "#282c34", bg = "#8ebd6b" },
            CmpItemKindEnum = { fg = "#282c34", bg = "#8ebd6b" },
            CmpItemKindKeyword = { fg = "#282c34", bg = "#8ebd6b" },

            CmpItemKindConstant = { fg = "#282c34", bg = "#d19a66" },
            CmpItemKindConstructor = { fg = "#282c34", bg = "#d19a66" },
            CmpItemKindReference = { fg = "#282c34", bg = "#d19a66" },

            CmpItemKindFunction = { fg = "#282c34", bg = "#c678dd" },
            CmpItemKindStruct = { fg = "#282c34", bg = "#c678dd" },
            CmpItemKindClass = { fg = "#282c34", bg = "#c678dd" },
            CmpItemKindModule = { fg = "#282c34", bg = "#c678dd" },
            CmpItemKindOperator = { fg = "#282c34", bg = "#c678dd" },

            CmpItemKindVariable = { fg = "#282c34", bg = "#e86671" },
            CmpItemKindFile = { fg = "#282c34", bg = "#e86671" },

            CmpItemKindUnit = { fg = "#282c34", bg = "#e5c07b" },
            CmpItemKindSnippet = { fg = "#282c34", bg = "#e5c07b" },
            CmpItemKindFolder = { fg = "#282c34", bg = "#e5c07b" },

            CmpItemKindMethod = { fg = "#282c34", bg = "#61afef" },
            CmpItemKindValue = { fg = "#282c34", bg = "#61afef" },
            CmpItemKindEnumMember = { fg = "#282c34", bg = "#61afef" },

            CmpItemKindInterface = { fg = "#282c34", bg = "#98c379" },
            CmpItemKindColor = { fg = "#282c34", bg = "#98c379" },
            CmpItemKindTypeParameter = { fg = "#282c34", bg = "#98c379" },


            RenderMarkdownH1Bg = {cterm = 'reverse', bg = '#282c34'},
	  }, 
        }
    require('onedark').load()
    end,
}
