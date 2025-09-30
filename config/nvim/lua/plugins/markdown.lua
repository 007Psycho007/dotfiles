return {
    'MeanderingProgrammer/render-markdown.nvim',
    dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' }, -- if you prefer nvim-web-devicons
    opts = {
        indent = { enabled = true },
        bullet = {
            enabled = true,
            icons = { '●', '○', '◆', '◇' },
            right_pad = 1,
            highlight = 'DiagnosticHint',
    },
        heading = {
            enabled = true,
            sign = false,
            position = 'inline',
            icons = { '󰐾 ', '󰐾 ', '󰐾 ', '󰐾 ', '󰐾 ', '󰐾 ' },
            signs = { '󰫎 ' },
            width = 'full',
            left_pad = 0,
            right_pad = 0,
            min_width = 0,
            border = false,
            border_prefix = false,
            above = '▄',
            below = '▀',
            -- Highlight for the heading icon and extends through the entire line
            backgrounds = {
                'RenderMarkdownH1Bg',
            },
            -- The 'level' is used to index into the array using a clamp
            -- Highlight for the heading and sign icons
            foregrounds = {
                'RenderMarkdownH1',
                'RenderMarkdownH2',
                'RenderMarkdownH3',
                'RenderMarkdownH4',
                'RenderMarkdownH5',
                'RenderMarkdownH6',
            },
        },
    }
}
