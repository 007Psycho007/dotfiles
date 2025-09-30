from libqtile import layout
from color import onedark

margin=10

def tile():
    return layout.Tile(
        margin=margin,
        border_focus=onedark["accent"],
        border_normal=onedark["primary"],
        border_width=2
    )


def wide():
    return layout.MonadWide(
        margin=margin,
        border_width=2,
        border_focus=onedark["accent"],
        border_normal=onedark["primary"],
        ratio=0.7
    )

def tabbed():
    return layout.TreeTab(
        margin=margin,
        active_fg=onedark["primary"],
        active_bg=onedark["accent"],
        inactive_fg=onedark["primary"],
        inactive_bg=onedark["label"],
        urgent_fg=onedark["label"],
        urgent_bg=onedark["critical"],
        border_width=2,
        bg_color="ffffff55",
        section_top=0,
        sections=[""]

    )

def full():
    return layout.Max(
        margin=margin,
        border_focus=onedark["accent"],
        border_normal=onedark["primary"],
        border_width=2
    )

def zoom():
    return layout.Zoomy(
        margin=margin,
        border_focus=onedark["accent"],
        border_normal=onedark["primary"],

    )

def floating():
    return layout.Floating(
        border_focus=onedark["accent"],
        border_normal=onedark["primary"],
        border_width=2
    )
layouts = [
    tile(),
    wide(),
    full(),
    tabbed(),
    # Try more layouts by unleashing below layouts.
    # layout.Bsp(),
    # layout.Matrix(),
    # layout.MonadTall(),
    # layout.RatioTile(),
    # layout.TreeTab(),
    # layout.VerticalTile(),
    # layout.Zoomy(),
]
