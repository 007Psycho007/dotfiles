from libqtile import qtile, hook
def show_or_hide_tabs(screen=None, offset=0):
    if screen is None:
        screen = qtile.current_screen

    bar = screen.bottom
    if not bar:
        return

    if screen.group.layout.name == 'max':
        nwindows = len(screen.group.windows) + offset
        if nwindows > 1:
            bar.show()
        else:
            if bar.window:
                bar.show(False)
    else:
        if bar.window:
            bar.show(False)


@hook.subscribe.client_killed
def update_tabs_client_killed(window):
    show_or_hide_tabs(offset=-1)


@hook.subscribe.group_window_add
def update_tabs_group_window_add(group, window):
    show_or_hide_tabs(offset=1)


@hook.subscribe.layout_change
def update_tabs_layout_change(layout, group):
    show_or_hide_tabs()


@hook.subscribe.setgroup
def update_tabs_setgroup():
    for screen in qtile.screens:
        show_or_hide_tabs(screen)


@hook.subscribe.startup_complete
def update_tabs_startup_complete():
    for screen in qtile.screens:
        show_or_hide_tabs(screen)
