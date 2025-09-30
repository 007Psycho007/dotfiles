return {
    'nvimdev/lspsaga.nvim',
    cmd = "Lspsaga",
    opts = {
          symbol_in_winbar = {
            enable = false,
          },
          lightbulb = {
            enable = false,
          },
          ui = {
            -- currently only round theme
            theme = 'round',
            title = false,
            -- border type can be single,double,rounded,solid,shadow.
            border = 'single',
            winblend = 0,
            expand = '',
            collapse = '',
            preview = ' ',
            code_action = ' ',
            diagnostic = ' ',
            incoming = ' ',
            outgoing = ' ',
            virtual_text = false,
            colors = {
              --float window normal background color
              normal_bg = "#282c34",
              --title background color
              title_bg = '#282c34',
              red = '#e06c7b',
              magenta = '#b33076',
                  orange = "#d19a66",
                  yellow = "#e5c07b",
                  green = "#98c379",
                  cyan = "#56b6c2",
              blue = '#61afef',
                  purple = "#c678dd",
                  white = "#abb2bf",
              black = '#61afef',
            },
            kind = {},
          },
    }
}
