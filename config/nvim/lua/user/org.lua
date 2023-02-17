require('orgmode').setup({
    org_agenda_files = {'~/notes/work/*','~/notes/private/*'},
    org_default_notes_file = '~/notes/refile.org',
        mappings = {
            global = {
                org_agenda = 'gA',
                org_capture = 'gC'
            },
            org = {
                org_cycle = 't',
                org_global_cycle = 'T'
            }
        },
})
