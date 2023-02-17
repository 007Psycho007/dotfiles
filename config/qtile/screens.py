import os
from libqtile.config import Screen
from libqtile import bar, widget
from libqtile.lazy import lazy
from color import onedark
from psutil import sensors_battery
from bar import widgets_main,widgets_second,widgets_single
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
            wallpaper=bg_image,
            wallpaper_mode="fill"
        ),
    ]
