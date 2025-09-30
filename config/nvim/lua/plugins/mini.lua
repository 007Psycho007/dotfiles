return {
    'echasnovski/mini.nvim',
    main = "mini.comment",
    opts = {
        bullet = {
            -- Turn on / off list bullet rendering
            enabled = true,
            -- Replaces '-'|'+'|'*' of 'list_item'
            -- How deeply nested the list is determines the 'level'
            -- The 'level' is used to index into the array using a cycle
            -- If the item is a 'checkbox' a conceal is used to hide the bullet instead
            icons = { '● ', '○ ', '◆ ', '◇ ' },
            -- Padding to add to the left of bullet point
            left_pad = 0,
            -- Padding to add to the right of bullet point
            right_pad = 0,
            -- Highlight for the bullet icon
            highlight = 'RenderMarkdownBullet',
    },
    }
}
