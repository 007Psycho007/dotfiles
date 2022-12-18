require('neorg').setup {
    load = {
        ["core.defaults"] = {},
        ["core.norg.dirman"] = {
            config = {
                workspaces = {
                    home = "~/notes/home",
                }
            }
        },
        ["core.norg.completion"] = {
            config = { -- Note that this table is optional and doesn't need to be provided
                engine = "nvim-cmp" -- Configuration here
            }
        },  
        ["core.gtd.base"] = {
            config = { -- Note that this table is optional and doesn't need to be provided
                workspace = "home"-- Configuration here
            }
        },
    }
}
