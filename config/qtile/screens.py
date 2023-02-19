import os
from libqtile.config import Screen
from libqtile import bar, widget, qtile, hook
from libqtile.lazy import lazy
from color import onedark
from psutil import sensors_battery
from bar import widgets_main,widgets_second,widgets_single,widgets_tab1,widgets_tab2
from plugins import monitors

bg_image = "~/.config/qtile/files/wallpaper.jpg"


if monitors.count() > 1:
    screens = [
        Screen(
            top=bar.Bar(
                widgets_main,
                28,
                margin=0,
                background=onedark["gradient4"],
                border_width=0,  # Draw top and bottom borders
            ),
            bottom=bar.Bar(
                widgets_tab1, 
                size=24,
                background=onedark["gradient4"],
                border_width=0,  # Draw top and bottom borders
            ),
            wallpaper=bg_image,
            wallpaper_mode="fill"
        ),
        Screen(
            top=bar.Bar(
                widgets_second,
                28,
                margin=0,
                background=onedark["gradient4"],
                border_width=0  # Draw top and bottom borders
            ),
            bottom=bar.Bar(widgets_tab2, size=24,background=onedark["gradient4"]),
            wallpaper=bg_image,
            wallpaper_mode="fill"
        ),
    ]
else:
    screens = [
        Screen(
            top=bar.Bar(
                widgets_single,
                28,
                margin=0,
                background=onedark["gradient4"],
                border_width=0,  # Draw top and bottom borders
            ),
            bottom=bar.Bar(widgets_tab1, size=24,background=onedark["gradient4"]),
            wallpaper=bg_image,
            wallpaper_mode="fill"
        ),
    ]



######## Tab Hooks

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

