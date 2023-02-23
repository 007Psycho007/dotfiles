from libqtile.config import Key, Drag, Click
from libqtile.lazy import lazy
from libqtile.utils import guess_terminal
from plugins import traverse
import os

mod = "mod4"
terminal = guess_terminal()
keys = [
    # A list of available commands that can be bound to keys can be found
    # at https://docs.qtile.org/en/latest/manual/config/lazy.html
    # Switch between windows
    Key([mod], "h", lazy.prev_screen(), desc="Move focus to left"),
    Key([mod], "l", lazy.next_screen(), desc="Move focus to right"),
    Key([mod], "j", lazy.layout.down(), desc="Move focus down"),
    Key([mod], "k", lazy.layout.up(), desc="Move focus up"),
    Key([mod], "space", lazy.layout.next(), desc="Move window focus to other window"),
    # Move windows between left/right columns or move up/down in current stack.
    # Moving out of range in Columns layout will create new column.
    Key([mod, "shift"], "h", lazy.layout.shuffle_left(), desc="Move window to the left"),
    Key([mod, "shift"], "l", lazy.layout.shuffle_right(), desc="Move window to the right"),
    Key([mod, "shift"], "j", lazy.layout.shuffle_down(), desc="Move window down"),
    Key([mod, "shift"], "k", lazy.layout.shuffle_up(), desc="Move window up"),
    # Grow windows. If current window is on the edge of screen and direction
    # will be to screen edge - window would shrink.
    Key([mod, "control"], "h", lazy.layout.grow_left(), desc="Grow window to the left"),
    Key([mod, "control"], "l", lazy.layout.grow_right(), desc="Grow window to the right"),
    Key([mod, "control"], "j", lazy.layout.grow_down(), desc="Grow window down"),
    Key([mod, "control"], "k", lazy.layout.grow_up(), desc="Grow window up"),
    Key([mod], "n", lazy.layout.normalize(), desc="Reset all window sizes"),
    Key([mod], "t", lazy.window.toggle_floating(), desc='Toggle floating'),
    Key([mod], "f", lazy.window.toggle_fullscreen()),

    Key(
        [mod, "shift"],
        "Return",
        lazy.layout.toggle_split(),
        desc="Toggle between split and unsplit sides of stack",
    ),
    Key([mod], "Return", lazy.spawn(terminal), desc="Launch terminal"),
    # Toggle between different layouts as defined below
    Key([mod], "Tab", lazy.next_layout(), desc="Toggle between layouts"),
    Key([mod, "shift"], "q", lazy.window.kill(), desc="Kill focused window"),
    Key([mod, "control"], "r", lazy.reload_config(), desc="Reload the config"),
    Key([mod], "d", lazy.spawn("rofi -show run")),

    Key([mod], 'o', lazy.group['term'].dropdown_toggle('term')),
    Key([mod], 's', lazy.group['ncspot'].dropdown_toggle('ncspot')),
    Key([mod], 'XF86AudioPlay', lazy.group['ncspot'].dropdown_toggle('ncspot')),


    Key([mod], "p", lazy.spawn(os.path.expanduser("~/.config/scripts/display-selector.sh"))),
    Key([mod], "g", lazy.spawn(os.path.expanduser("~/.config/scripts/dmenu/menu.sh")), desc="Script Menu"),
    Key([mod], "x", lazy.spawn("betterlockscreen -l"), desc="Screen Lock"),
    Key([mod], "b", lazy.spawn(os.path.expanduser("~/.config/scripts/bwmenu/bwmenu")), desc="Screen Lock"),
    Key([mod], "m", lazy.widget["keyboardlayout"].next_keyboard(), desc="Next keyboard layout."),
    # Playerctl
    Key([], "XF86AudioPlay", lazy.spawn("playerctl play-pause")),
    Key([], "XF86AudioStop", lazy.spawn("playerctl pause")),
    Key([], "XF86AudioNext", lazy.spawn("playerctl next")),
    Key([], "XF86AudioPrev", lazy.spawn("playerctl previous")),
]


mouse = [
    Drag([mod], "Button1", lazy.window.set_position_floating(), start=lazy.window.get_position()),
    Drag([mod], "Button3", lazy.window.set_size_floating(), start=lazy.window.get_size()),
    Click([mod], "Button2", lazy.window.bring_to_front()),
]
