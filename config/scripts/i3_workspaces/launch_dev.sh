#!/bin/bash
i3-msg "workspace 1: dev; kill"
i3-msg "workspace 1: dev; append_layout ~/.config/scripts/i3_workspaces/workspace_1_dev.json"
(kitty ~/.config/scripts/pfetch/shell_pfetch.sh &)
sleep 0.5
(kitty &)
(kitty &)
