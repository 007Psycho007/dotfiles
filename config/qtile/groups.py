from libqtile.config import Group, Key, Match
from libqtile.lazy import lazy

mod = "mod4"

web_match=[
    Match(wm_class=["firefox"]),
    Match(wm_class=["qutebrowser"]),
    Match(wm_class=["librewolf-default"]),
]

com_match=[
    Match(wm_class=["thunderbird"]),
    Match(wm_class=["thunderbird"]),
    Match(wm_class=["Chromium"]),
]

med_match=[
    Match(wm_class=["Spotify"]),
    Match(wm_class=["ncspot"])
]

set_match=[
    Match(wm_class=["Pavucontrol"]),
    Match(wm_class=["easyeffects"]),
    Match(wm_class=["pulseeffects"]),
    Match(wm_class=["Streamdeck UI"]),
]

sec_match=[
    Match(wm_class=["Bitwarden"]),
    Match(wm_class=["KeePassXC"])
]

ent_match=[ 
    Match(wm_class=["Steam"]),
    Match(wm_class=["dwarffortress"]),
]
from keys import keys
groups = [
        Group("dev",label="",layout="monadwide",spawn=["kitty","kitty","kitty"]),
        Group("web",label="爵",layout="tile",matches=web_match),
        Group("med",label="ﱘ",layout="tile",matches=med_match),
        Group("com",label="", layout="tile",matches=com_match),
        Group("sec",label="",layout="treetab",matches=sec_match),
        Group("set",label="漣",layout="treetab",matches=set_match),
        Group("ent",label="",layout="max",matches=ent_match),
        Group("doc",label=""),
        Group("re9",label=""),
        Group("re0",label=""),
        ]
for i , o in enumerate(groups):
    keys.extend(
        [
            # mod1 + letter of group = switch to group
            Key(
                [mod],
                str((i+1)%10),
                lazy.group[o.name].toscreen(),
                desc="Switch to group {}".format(o.name),
            ),
            # mod1 + shift + letter of group = switch to & move focused window to group
            Key(
                [mod, "shift"],
                str((i+1)%10),
                lazy.window.togroup(o.name, switch_group=True),
                desc="Switch to & move focused window to group {}".format(o.name),
            ),
            # Or, use below if you prefer not to switch to that group.
            # # mod1 + shift + letter of group = move focused window to group
            # Key([mod, "shift"], i.name, lazy.window.togroup(i.name),
            #     desc="move focused window to group {}".format(i.name)),
        ]
    )
