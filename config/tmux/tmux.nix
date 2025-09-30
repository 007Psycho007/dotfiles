{ inputs, pkgs, ... }:
  {
    programs.tmux = {
      enable = true;
      plugins = with pkgs; [
        tmuxPlugins.cpu
        {
        plugin = tmuxPlugins.tmux-nova;
        extraConfig = ''
          set -g "@nova-pane-border-style" "#282a36"

          set -g @nova-nerdfonts true
          set -g @nova-nerdfonts-left 
          set -g @nova-nerdfonts-right 

          set -g "@nova-pane-active-border-style" "#61afef"
          set -g "@nova-pane-border-style" "#979eab"

          set -g "@nova-status-style-bg" "#4c566a"
          set -g "@nova-status-style-fg" "#d8dee9"
          set -g "@nova-status-style-active-bg" "#61afef"
          set -g "@nova-status-style-active-fg" "#282c34"

          set -g @nova-pane "#I#{?pane_in_mode,  #{pane_mode},}  #W"

          set -g @nova-segment-mode "#{?client_prefix,,}"
          set -g @nova-segment-mode-colors "#98c379 #282c34"

          set -g @nova-segment-prekernel " 󱄅 "
          set -g @nova-segment-prekernel-colors "#61afef #282c34"

          set -g @nova-segment-prename "  "
          set -g @nova-segment-prename-colors "#61afef #282c34"

          set -g @nova-segment-preclock "  "
          set -g @nova-segment-preclock-colors "#61afef #282c34"

          set -g @nova-segment-kernel " #(uname --kernel-release)"
          set -g @nova-segment-kernel-colors "#282c34 #abb2bf"

          set -g @nova-segment-name " #(uname -n)"
          set -g @nova-segment-name-colors "#282c34 #abb2bf"

          set -g @nova-segment-time "#(date +"%T")"
          set -g @nova-segment-time-colors "#282c34 #abb2bf"

          set -g @nova-segments-0-left "mode"
          set -g @nova-segments-0-right "prename name prekernel kernel preclock time"
          set -g @nova-rows 0
        '';
        }
      ];
      extraConfig = ''
        # Start with 1 
        set -g base-index 1
        setw -g pane-base-index 1

        # Move between wiindows with Alt+Arrowkeys
        bind -n M-Left select-pane -L
        bind -n M-Right select-pane -R
        bind -n M-Up select-pane -U
        bind -n M-Down select-pane -D

        # switch windows alt+number
        bind-key -n M-1 select-window -t 1
        bind-key -n M-2 select-window -t 2
        bind-key -n M-3 select-window -t 3
        bind-key -n M-4 select-window -t 4
        bind-key -n M-5 select-window -t 5
        bind-key -n M-6 select-window -t 6
        bind-key -n M-7 select-window -t 7
        bind-key -n M-8 select-window -t 8
        bind-key -n M-9 select-window -t 9

        # Enable mouse mode (tmux 2.1 and above)
        set -g mouse on

        # reload config file (change file location to your the tmux.conf you want to use)
        bind r source-file ~/.config/tmux/tmux.conf
        # Set Terminal Colors
        set -g default-terminal "screen-256color"
        set -g allow-passthrough 1

        # Split Panes
        unbind '"'
        unbind %
        bind , split-window -h
        bind . split-window -v

      '';
    };
  }
