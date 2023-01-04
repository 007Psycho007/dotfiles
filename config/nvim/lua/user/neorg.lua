require('neorg').setup {
    load = {
        ["core.defaults"] = {},
        ["core.norg.dirman"] = {
            config = {
                workspaces = {
                    home = "~/notes",
                }
            }
        },
        ["core.norg.completion"] = {
            config = { -- Note that this table is optional and doesn't need to be provided
                engine = "nvim-cmp" -- Configuration here
            }
        },  
        ["core.norg.concealer"] = {
            config = { -- Note that this table is optional and doesn't need to be provided
                icon_preset = "basic",
                dim_code_blocks = {
                    enabled = true,
                    conceal = true
                },
                folds = false
            }
        },
        ["core.export"] = {
            config = { -- Note that this table is optional and doesn't need to be provided
               -- Configuration here
            }
        }
    }
}
