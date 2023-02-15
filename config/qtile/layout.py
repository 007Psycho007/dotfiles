from libqtile import layout
from color import onedark

def tile():
    return layout.Tile(
        margin=8,
        border_focus=onedark["accent"],
    )


def wide():
    return layout.MonadWide(
        margin=8,
        border_width=1,
        border_focus=onedark["accent"],
        border_normal=onedark["primary"],
        ratio=0.7
    )

def tabbed():
    return layout.TreeTab(
        margin=8,
        active_fg=onedark["primary"],
        active_bg=onedark["accent"],
        inactive_fg=onedark["primary"],
        inactive_bg=onedark["label"],
        urgent_fg=onedark["label"],
        urgent_bg=onedark["critical"],
        border_width=1,
        bg_color="ffffff00",
        section_top=0,
        sections=[""]

    )

def full():
    return layout.Max(
        margin=8,
        border_focus=onedark["accent"],
        border_normal=onedark["primary"],
        border_width=1
    )
def zoom():
    return layout.Zoomy(
        margin=8,
        border_focus=onedark["accent"],
        border_normal=onedark["primary"],

    )

layouts = [
    tile(),
    wide(),
    full(),
    tabbed(),
    zoom()
    # Try more layouts by unleashing below layouts.
    # layout.Bsp(),
    # layout.Matrix(),
    # layout.MonadTall(),
    # layout.RatioTile(),
    # layout.TreeTab(),
    # layout.VerticalTile(),
    # layout.Zoomy(),
]
