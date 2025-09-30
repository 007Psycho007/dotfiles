{ inputs, pkgs, ... }:
{
    wayland.windowManager.hyprland = {
      enable = true;
      systemd.enable = true;
      plugins = [ pkgs.hyprlandPlugins.hy3 ];
      settings = {
        exec-once= [
          "hyprpaper"
          "waybar"
          "pavucontrol"
          "kitty"
          "swaync"
        ];

        "$terminal" = "kitty";
        "$menu" = "rofi -show run";


        "$mod" = "SUPER"; # Sets "Windows" key as main modifier

        general = {
          gaps_in = 4;
          gaps_out = 8;

          border_size = 2;

          # https://wiki.hyprland.org/Configuring/Variables/#variable-types for info about colors
          "col.active_border" = "rgb(61AFEF) rgb(98C379) 45deg";
          "col.inactive_border" = "rgb(282C34) rgb(393f4a)";

          # Set to true enable resizing windows by clicking and dragging on borders and gaps
          resize_on_border = false;

          # Please see https://wiki.hyprland.org/Configuring/Tearing/ before you turn this on
          allow_tearing = false;

          layout = "hy3";
        };
        dwindle = {
          preserve_split = true;
          force_split = 2;
          default_split_ratio = 1.2;
        };
        decoration = {
          rounding = 8;
        };
        plugin = {
          hy3 = {
            autotile = {
              enable = true;
            };
          };
        };

        cursor = {
          no_warps = true;
        };
        input = {
          follow_mouse = 2;
          kb_options = "caps:escape,grp:win_space_toggle";
          kb_layout="us,de";
        };

        windowrulev2 = [
          "workspace 4, class:^(discord)$"
          "workspace 4, class:^(WebCord)$"
          "workspace 2, class:^(firefox)$"
          "workspace 2, class:^(qutebrowser)$"
          "workspace 1, class:^(kitty)$"
          "workspace 6, class:^(org.pulseaudio.pavucontrol)$"
          "workspace 6, class:^(streamcontroller)$"
          "workspace 5, class:^(pavucontrol)$"
          "workspace 10, class:^(Shadow PC)$"
          "workspace 10, title:^(Shadow PC - Display)$"
          "workspace 9, class:^(nvim)$"
          "workspace 7, class:^(steam)$"
          "workspace 4, class:^(Chromium-browser)$"
          "workspace 8, class:^(obsidian)$"
          "workspace 8, class:^(greenlight)$"
        ];

        bindm = [
           "$mod, mouse:272, movewindow"
        ];
        bind = [
            "$mod , f, fullscreenstate, 2"
            "$mod SHIFT, Q, killactive"
            "$mod , RETURN, exec, $terminal"
            "$mod , D, exec, $menu"
            "$mod , G, exec, ~/.config/scripts/dmenu/menu.sh"
            "$mod , V, togglefloating"
            "$mod , P, pseudo"
            "$mod , X, exec, hyprlock"
            "$mod , S, togglesplit"
            "$mod , C, exec, hyprshot -m region -o ~/Pictures/"


            # Movement
            "$mod , H, hy3:movefocus, l"
            "$mod , L, hy3:movefocus, r"
            "$mod , K, hy3:movefocus, u"
            "$mod , J, hy3:movefocus, d"
            "$mod SHIFT, H, hy3:movewindow, l"
            "$mod SHIFT, L, hy3:movewindow, r"
            "$mod SHIFT, K, hy3:movewindow, u"
            "$mod SHIFT, J, hy3:movewindow, d"
            "$mod ALT, H, movecurrentworkspacetomonitor, l"
            "$mod ALT, L, movecurrentworkspacetomonitor, r"

            "$mod, T,hy3:makegroup, tab"
            "$mod, U,hy3:changegroup, untab"
            # Media Keys
            ", XF86AudioNext, exec, playerctl next"
            ", XF86AudioPause, exec, playerctl play-pause"
            ", XF86AudioPlay, exec, playerctl play-pause"
            ", XF86AudioPrev, exec, playerctl previous"
            "$mod, 0, workspace, 10"
            "$mod SHIFT, 0, movetoworkspace, 10"

          ]
          ++ (
            # workspaces
            # binds $mod + [shift +] {1..9} to [move to] workspace {1..9}
            builtins.concatLists (builtins.genList (i:
                let ws = i + 1;
                in [
                  "$mod, code:1${toString i}, workspace, ${toString ws}"
                  "$mod SHIFT, code:1${toString i}, hy3:movetoworkspace, ${toString ws}"
                ]
              )
              9)
          );
      };
    };
}
