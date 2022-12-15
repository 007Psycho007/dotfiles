#!/bin/bash

if [[ "$(cat /etc/*-release | grep DISTRIB_ID | sed 's/DISTRIB_ID=//g')" == "Ubuntu" ]]; then
    export MENU_LABEL="%{T4}  %{T-}"    
else
    export MENU_LABEL="%{T4}  %{T-}"    
fi

if [[ $(uname -n) == "PC-Main" ]];then 
   export MAIN_LEFT="menu end-left-i3 i3 end-right-i3 keymap end-right-i3 end-right mode"
   export MAIN_CENTER="title"
   export MAIN_RIGHT="end-left cpu sep-1 memory sep-1 disk_home sep-1 disk_root sep-1 date"
   export SECOND_LEFT="menu end-left-i3 i3 end-right-i3 end-right"
   export SECOND_CENTER="music-top"
   export SECOND_RIGHT="end-left net-top"
elif [[ $(uname -n) == "jpeterhaensel-ThinkPad-L580" ]];then 
   export MAIN_LEFT="menu end-left-i3 i3 end-right-i3 keymap end-right-i3 end-right mode"
   export MAIN_CENTER="title"
   export MAIN_RIGHT="end-left cpu sep-1 memory sep-1 battery sep-1 disk_root sep-1 date"
   export SECOND_LEFT="end-left-i3 i3 end-right-i3 end-right"
   export SECOND_CENTER="music-top"
   export SECOND_RIGHT="end-left net-top"
   export THIRD_LEFT="i3 end-right-i3 end-right"
   export INTERNAL_LEFT=
   export INTERNAL_CENTER="music-bot"
   export INTERNAL_RIGHT="sep-2 net-bot"


fi
