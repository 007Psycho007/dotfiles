#!/usr/bin/env bash

configs=$( ls -w1 $HOME/.screenlayout/ )
choice=$( echo "$configs" | rofi -dmenu -p "Select a Screenlayout Config" ) 
$HOME/.screenlayout/$choice


