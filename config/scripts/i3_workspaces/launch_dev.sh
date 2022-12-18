#!/bin/bash
i3-msg "workspace 1: dev; kill"
i3-msg "workspace 1: dev; append_layout ~/.config/scripts/i3_workspaces/workspace_1_dev.json"
(kitty nvim ~/notes/tasks.org &)
sleep 0.5
(kitty &)
(kitty &)
