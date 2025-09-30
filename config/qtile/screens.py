import os
from libqtile.config import Screen
from libqtile import bar, widget, qtile, hook
from libqtile.lazy import lazy
from color import onedark
from psutil import sensors_battery
from bar import widgets_main,widgets_second,widgets_single,widgets_tab1,widgets_tab2
import os

bg_image = "~/.config/qtile/files/wallpaper.jpg"

screens = [
    Screen(
        top=bar.Bar(
            widgets_main,
            28,
            margin=0,
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


