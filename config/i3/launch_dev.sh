#!/bin/bash

i3-msg "workspace 1: dev; append_layout ~/.config/i3/workspace_1_dev.json"
(kitty ~/.config/i3/pfetch/shell_pfetch.sh &)
sleep 0.5
(kitty &)
(kitty &)
