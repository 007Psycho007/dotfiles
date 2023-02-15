import os
from libqtile.config import Screen
from libqtile import bar, widget
from libqtile.lazy import lazy
from color import onedark
from psutil import sensors_battery
from bar import widgets_main,widgets_second

screens = [
    Screen(
        top=bar.Bar(
            widgets_main,
            28,
            margin=[5,10,0,10],
            background=onedark["bar_background"],
            border_color=onedark["bar_border"],
            border_width=[5, 10, 5, 10],  # Draw top and bottom borders
        ),
    ),
    Screen(
        top=bar.Bar(
            widgets_second,
            28,
            margin=[5,10,0,10],
            background=onedark["bar_background"],
            border_color=onedark["bar_border"],
            border_width=[5, 10, 5, 10],  # Draw top and bottom borders
        ),
    ),
]
