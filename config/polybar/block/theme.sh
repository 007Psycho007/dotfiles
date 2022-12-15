#!/bin/bash
export COLOR_BACKGROUND="#00212121"
export COLOR_ACCENT="#61AFEF"
export COLOR_PRIMARY="#282C34"
export COLOR_SECONDARY="#90caf9"
export COLOR_PREFIX="#282C34"
export COLOR_LABEL="#ABB2BF"
export COLOR_SUCCESS="#98C379"
export COLOR_WARNING="#E5C07B"
export COLOR_CRITICAL="#E06C75"

export RAMP_LV_1="%{T3}%{F$COLOR_SUCCESS} %{F$COLOR_LABEL}%{F-}%{T-}"
export RAMP_LV_2="%{T3}%{F$COLOR_SUCCESS} %{F$COLOR_LABEL}%{F-}%{T-}"
export RAMP_LV_3="%{T3}%{F$COLOR_WARNING} %{F$COLOR_LABEL}%{F-}%{T-}"
export RAMP_LV_4="%{T3}%{F$COLOR_CRITICAL} %{F$COLOR_LABEL}%{F-}%{T-}"

export TITLE_PREFIX="%{T2}%{F$COLOR_ACCENT}%{B$COLOR_BACKGROUND}%{F-}%{B-}%{T-}%{T4}%{F$COLOR_PREFIX}%{B$COLOR_ACCENT} 缾 %{F-}%{B-}%{T-}%{T2}%{F$COLOR_ACCENT}%{B$COLOR_PRIMARY}%{F-}%{B-}%{T-}"
export TITLE_LABEL="<label>%{T2}%{F$COLOR_ACCENT}%{B$COLOR_PRIMARY} %{T2}%{B$COLOR_BACKGROUND}%{F-}%{B-}%{T-}"

export MUSIC_PREFIX_TOP="%{T2}%{F$COLOR_ACCENT}%{B$COLOR_BACKGROUND}%{F-}%{B-}%{T-}%{T4}%{F$COLOR_PREFIX}%{B$COLOR_ACCENT}  %{F-}%{B-}%{T-}%{T2}%{F$COLOR_ACCENT}%{B$COLOR_PRIMARY}%{F-}%{B-}%{T-}"
export MUSIC_LABEL_TOP="<label>%{T2}%{F$COLOR_ACCENT}%{B$COLOR_PRIMARY}%{T2}%{B$COLOR_BACKGROUND}%{F-}%{B-}%{T-}"

export MUSIC_PREFIX_BOT="%{T2}%{F$COLOR_ACCENT}%{B$COLOR_BACKGROUND}%{F-}%{B-}%{T-}%{T4}%{F$COLOR_PREFIX}%{B$COLOR_ACCENT}  %{F-}%{B-}%{T-}%{T2}%{F$COLOR_ACCENT}%{B$COLOR_PRIMARY}%{F-}%{B-}%{T-}"
export MUSIC_LABEL_BOT="<label>%{T2}%{F$COLOR_ACCENT}%{B$COLOR_PRIMARY}%{T2}%{B$COLOR_BACKGROUND}%{F-}%{B-}%{T-}"

export NET_PREFIX_TOP="%{T4} %{T-}%{T2}%{F$COLOR_ACCENT}%{B$COLOR_PRIMARY}%{F-}%{B-}%{T-}"
export NET_PREFIX_BOT="%{T4} %{T-}%{T2}%{F$COLOR_ACCENT}%{B$COLOR_PRIMARY}%{F-}%{B-}%{T-}"

export CPU_PREFIX="%{T4} %{T-}%{T2}%{F$COLOR_ACCENT}%{B$COLOR_PRIMARY}%{F-}%{B-}%{T-}"
export MEM_PREFIX="%{T4} %{T-}%{T2}%{F$COLOR_ACCENT}%{B$COLOR_PRIMARY}%{F-}%{B-}%{T-}"
export AC_PREFIX="%{T4}ﮣ %{T-}%{T2}%{F$COLOR_ACCENT}%{B$COLOR_PRIMARY}%{F-}%{B-}%{T-}"
export BAT_PREFIX="%{T4} %{T-}%{T2}%{F$COLOR_ACCENT}%{B$COLOR_PRIMARY}%{F-}%{B-}%{T-}"
export DISK_PREFIX="%{T4} %{T-}%{T2}%{F$COLOR_ACCENT}%{B$COLOR_PRIMARY}%{F-}%{B-}%{T-}"
export HOME_PREFIX="%{T4} %{T-}%{T2}%{F$COLOR_ACCENT}%{B$COLOR_PRIMARY}%{F-}%{B-}%{T-}"
export DATE_PREFIX="%{T4} %{T-}%{T2}%{F$COLOR_ACCENT}%{B$COLOR_PRIMARY}%{F-}%{B-}%{T-}"


export KEY_PREFIX="%{T4}%{T-}%{T2}%{F$COLOR_ACCENT}%{B$COLOR_PRIMARY}%{F-}%{B-}%{T-}"
source $HOME/.config/polybar/block/local.sh
