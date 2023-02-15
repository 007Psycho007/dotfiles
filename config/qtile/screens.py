import os
from libqtile.config import Screen
from libqtile import bar, widget
from libqtile.lazy import lazy
from color import onedark
home = os.path.expanduser('~')

def default_prefix():
    return {
        "foreground":onedark["primary"],
        "background":onedark["accent"],
        "padding": 10,
    }

def default_label():
    return {
        "foreground":onedark["label"],
        "background":onedark["primary"],
        "padding": 10,
    }
defaults = {
    "textsize": 16,
    "iconsize": 16,
}
widget_defaults = dict(
    font="Source Code Pro",
    fontsize=12,
    background=onedark["accent"]
)
extension_defaults = widget_defaults.copy()

def icon(symbol=""):
    return widget.TextBox(
        **default_prefix(),
        text=symbol,
        fontsize=defaults["iconsize"],
    )

def menu():
    return widget.TextBox(
        **default_prefix(),
        text="  ",
        fontsize=defaults["iconsize"],
        mouse_callbacks={"Button1":lazy.spawn("rofi -show run")}
    )

def separator():
    return widget.Sep(
        padding=15,
        linewidth=0
    )
def workspaces():
    return widget.GroupBox(
        **default_label(),
        spacing=0,
        borderwitdh=3,
        highlight_method="block",
        fontsize=defaults["iconsize"],
        block_highlight_text_color=onedark["primary"],
        this_current_screen_border=onedark["accent"],
        this_screen_border=onedark["label"],
        other_current_screen_border=onedark["accent"],
        other_screen_border=onedark["label"],
        highlight_color=onedark["accent"],
        inactive=onedark["background"],
        active=onedark["label"],
        urgent_alert_method="border",
        urgent_border=onedark["critical"],
        urgent_text=onedark["label"],
        center_aligned=True,
        rounded=False,
        margin_x=-2

    )

def layout():
    return widget.CurrentLayoutIcon(
        **default_prefix(),
        custom_icon_paths=[home + "/.config/qtile/layout-icons"],
        scale=0.7,
    )

def buffer():
    return widget.Spacer(
    )


def title():
    return widget.WindowName(
        **default_label(),
        width=150,
        fontsize=defaults["textsize"],
        max_chars=15
    )

def keymap():
    return widget.KeyboardLayout(
        **default_label(),
        configured_keyboards=["us","de","gb"],
    )

def cpu():
    return widget.CPU(
        **default_label(),
        format="{load_percent}",
        width=45
    )

def cpu_graph():
    return widget.CPUGraph(
        **default_label(),
        width=40,
        border_width=0,
        type="line",
        graph_color=onedark["accent"],
        line_width=2
    )

def mem():
    return widget.Memory(
        **default_label(),
        format="{MemPercent}",
        width=45
    )

def mem_graph():
    return widget.MemoryGraph(
        **default_label(),
        width=40,
        border_width=0,
        type="box",
        graph_color=onedark["accent"],
        line_width=2
    )


def bat_icon():
    return widget.Battery(
        **default_prefix(),
        format="{char}",
        show_short_text=False,
        full_char="",
        charge_char="ﮣ",
        discharge_char="",
        empty_char=""
    )

def bat():
    return widget.Battery(
        **default_label(),
        format="{percent:2.0%}",
        show_short_text=False,
        width=45
    )

def disk(partition):
    return widget.DF(
        **default_label(),
        format="{r:.0f}",
        visible_on_warn=False,
        partition=partition
    )

def clock():
    return widget.Clock(
        **default_label(),
    )

def network():
    return widget.Net(
        **default_label(),
        format=" {down}  {up}",
        width=130
    )

widgets_main = [
    menu(),
    separator(),
    workspaces(),
    separator(),
    icon(""),
    keymap(),
    buffer(),
    layout(),
    title(),
    buffer(),
    icon(""),
    network(),
    separator(),
    icon(""),
    cpu(),
    separator(),
    icon(""),
    mem(),
    separator(),
    bat_icon(),
    bat(),
    separator(),
    icon(""),
    disk("/"),
    separator(),
    icon(""),
    disk("/home"),
    separator(),
    icon(""),
    clock()
]

widgets_second = [
    menu(),
    separator(),
    workspaces(),
    buffer(),
    layout(),
    title(),
    buffer(),
    icon(""),
    clock()
]
screens = [
    Screen(
        top=bar.Bar(
            widgets_main,
            26,
            margin=[10,10,0,10],
            background=onedark["bar_background"],
            border_color=onedark["bar_background"],
            border_width=[5, 10, 5, 10],  # Draw top and bottom borders
            # border_width=[2, 0, 2, 0],  # Draw top and bottom borders
            # border_color=["ff00ff", "000000", "ff00ff", "000000"]  # Borders are magenta
        ),
    ),
    Screen(
        top=bar.Bar(
            widgets_second,
            26,
            margin=[10,10,0,10],
            background="#ffffff00",
            border_color=onedark["bar_background"],
            border_width=0#[5, 10, 5, 10],  # Draw top and bottom borders

            # border_color=["ff00ff", "000000", "ff00ff", "000000"]  # Borders are magenta
        ),
    ),
]
