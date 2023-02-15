from libqtile.config import Group, Key
from libqtile.lazy import lazy

mod = "mod4"

from keys import keys
groups = [
        Group("dev",label="",layout="monadwide"),
        Group("web",label="爵"),
        Group("med",label="ﱘ"),
        Group("com",label=""),
        Group("sec",label=""),
        Group("set",label="漣"),
        Group("ent",label=""),
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
                str((i+1)%9),
                lazy.window.togroup(o.name, switch_group=True),
                desc="Switch to & move focused window to group {}".format(o.name),
            ),
            # Or, use below if you prefer not to switch to that group.
            # # mod1 + shift + letter of group = move focused window to group
            # Key([mod, "shift"], i.name, lazy.window.togroup(i.name),
            #     desc="move focused window to group {}".format(i.name)),
        ]
    )
