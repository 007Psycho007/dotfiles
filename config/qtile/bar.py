import os
from libqtile.config import Screen
from libqtile import bar, widget
from libqtile.lazy import lazy
from color import onedark
from qtile_extras import widget
from qtile_extras.widget import CurrentLayoutIcon as NewLayoutIcon, UPowerWidget
from qtile_extras.widget.decorations import PowerLineDecoration
from plugins.music import status
import platform

def default_prefix():
    return {
        "foreground":onedark["primary"],
        "background":onedark["accent"],
        "padding": 11,
    }

def default_label():
    return {
        "foreground":onedark["label"],
        "font":"Source Code Pro",
        "padding": 12,
    }
defaults = {
    "textsize": 14,
    "iconsize": 16,
}
widget_defaults = dict(
    font="Source Code Pro",
    fontsize=12,
    background=onedark["accent"]
)
extension_defaults = widget_defaults.copy()

powerline_forward = {
    "decorations": [
        PowerLineDecoration(path="forward_slash")
    ]
}

powerline_back = {
    "decorations": [
        PowerLineDecoration(path="back_slash")
    ]
}

def icon(symbol,**kwargs):
    return widget.TextBox(
        **default_prefix(),
        text=symbol,
        **kwargs
    )

def menu(**kwargs):
    return widget.TextBox(
        **default_prefix(),
        text="  ",
        fontsize=defaults["iconsize"],
        mouse_callbacks={"Button1":lazy.spawn("rofi -show run")},
        **kwargs
    )
def workspaces(bg,**kwargs):
    return widget.GroupBox(
        **default_label(),
        background=bg,
        disable_drag=True,
        spacing=0,
        scroll_step=0,
        use_mouse_wheel=False,
        borderwitdh=3,
        highlight_method="line",
        block_highlight_text_color=None,
        fontsize=defaults["iconsize"],
        this_current_screen_border=onedark["accent"],
        this_screen_border=onedark["label"],
        other_current_screen_border=onedark["accent"],
        other_screen_border=onedark["label"],
        highlight_color=bg,
        inactive=onedark["secondary"],
        active=onedark["label"],
        urgent_border=onedark["critical"],
        urgent_text=onedark["label"],
        center_aligned=True,
        rounded=False,
        margin_x=-2,
        **kwargs
    )


def layout(bg,**kwargs):
    return NewLayoutIcon(
        foreground=onedark["label"],
        padding=0,
        background=bg,
        scale=0.4,
        **kwargs
    )

def window(bg,**kwargs):
    return widget.WindowName(
        **default_label(),
        background=bg,
        format='{name}',
        width=150,
        fontsize=defaults["textsize"],
        max_chars=15,
        **kwargs
    )

def keymap(bg,**kwargs):
    return widget.KeyboardLayout(
        **default_label(),
        fmt="  {}",
        background=bg,
        configured_keyboards=["us","de","gb"],
        **kwargs
    )

def buffer(**kwargs):
    return widget.Spacer(
        **kwargs
    )

def network(bg,**kwargs):
    return widget.Net(
        **default_label(),
        background=bg,
        fmt="<span size='12pt'></span>{}",
        format='{down} ↓↑ {up}',
        width=150,
        **kwargs
    )
    
def cpu(bg,**kwargs):
    return widget.CPU(
        **default_label(),
        background=bg,
        fmt="<span size='12pt'></span>  {}",
        format="{load_percent}",
        width=65,
        **kwargs
    )

def mem(bg,**kwargs):
    return widget.Memory(
        **default_label(),
        background=bg,
        fmt="  {}",
        format="{MemPercent}",
        width=65,
        **kwargs
    )

def bat_icon(bg,**kwargs):
    if str(platform.node()) != "PC-Main":
        return UPowerWidget(
            **default_label(),
            background=bg,
            border_charge_colour=onedark["success"],
            border_critical_colour=onedark["label"],
            border_colour=onedark["label"],
            fill_charge=onedark["label"],
            fill_critical=onedark["critical"],
            fill_low=onedark["warning"],

            margin=11,
            **kwargs
        )
    else: return widget.TextBox(
            fontsize=20,
            text="󰤅",
            **default_label(),
            background=bg,
            **kwargs
        )

def bat(bg,**kwargs):
    if str(platform.node()) != "PC-Main":
        return widget.Battery(
            **default_label(),
            background=bg,
            format="{char}  {percent:2.0%}",
            show_short_text=False,
            full_char="",
            charge_char="ﮣ",
            discharge_char="",
            empty_char="",
            **kwargs
        )
    else: return widget.TextBox(
            text="ﮣ",
            **default_label(),
            background=bg,
            **kwargs
        )

def disk(partition,symbol,bg,**kwargs):
    return widget.DF(
        background=bg,
        **default_label(),
        fmt=symbol + "  {}",
        format="{r:.0f}",
        visible_on_warn=False,
        partition=partition,
        **kwargs
    )

def music(bg,**kwargs):
    return widget.GenPollText(
        **default_label(),
        background=bg,
        fmt="<span size='12pt'></span>  {}",
        mouse_callbacks={'Button1': lazy.group['ncspot'].dropdown_toggle('ncspot')},
        update_interval=1, 
        func=status,
        width=265,
        **kwargs
    )

def updates(bg,**kwargs):
    return widget.CheckUpdates(
        **default_label(),
        background=bg,
        no_update_string="0",
        display_format="{updates}",
        fmt="<span size='12pt'></span> {}",
        **kwargs
    )

def clock():
    return widget.Clock(
        **default_prefix(),
        fmt="  {}"
    )


def tabs(bg,**kwargs):
    return widget.TaskList(
        foreground=onedark['label'],
        background=bg,
        highlight_method='block',
        border=onedark['gradient3'],
        margin_y=0,
        margin_x=10,
        urgent_border=onedark['critical'],
        rounded=False,
        icon_size=0,
        **kwargs
    )
    

widgets_main = [
    menu(**powerline_forward),
    workspaces(onedark["gradient1"],**powerline_forward),
    keymap(onedark["gradient2"],**powerline_forward),
    layout(onedark["gradient3"]),
    window(onedark["gradient3"],**powerline_forward),
    buffer(**powerline_back),
    network(onedark["gradient3"],**powerline_back),
    cpu(onedark["gradient2"]),
    mem(onedark["gradient2"]),
    bat(onedark["gradient2"],**powerline_back),
    disk("/","",onedark["gradient1"]),
    disk("/home","",onedark["gradient1"],**powerline_back),
    clock()
]

widgets_second = [
    menu(**powerline_forward),
    workspaces(onedark["gradient1"],**powerline_forward),
    layout(onedark["gradient3"]),
    window(onedark["gradient3"],**powerline_forward),
    buffer(**powerline_back),
    updates(onedark["gradient3"],**powerline_back),
    music(onedark["gradient1"],**powerline_back),
    clock()
]

widgets_single = [
    menu(**powerline_forward),
    workspaces(onedark["gradient1"],**powerline_forward),
    keymap(onedark["gradient2"],**powerline_forward),
    layout(onedark["gradient3"]),
    window(onedark["gradient3"],**powerline_forward),
    buffer(),
    music(onedark["gradient4"]),
    buffer(**powerline_back),
    network(onedark["gradient3"],**powerline_back),
    cpu(onedark["gradient2"]),
    mem(onedark["gradient2"]),
    bat(onedark["gradient2"],**powerline_back),
    disk("/","",onedark["gradient1"]),
    disk("/home","",onedark["gradient1"],**powerline_back),
    clock()
]

widgets_tab1 = [
    icon('',**powerline_back),
    tabs(onedark['gradient1'],**powerline_forward),
    icon(''),
]

widgets_tab2 = [
    icon('',**powerline_back),
    tabs(onedark['gradient1'],**powerline_forward),
    icon(''),
]
