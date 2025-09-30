{ inputs, pkgs, ... }:
{
  programs.hyprlock = {
    enable = true;
    settings = {
      general = {
        disable_loading_bar = true;
        hide_cursor = true;
        no_fade_in = false;
      };

      background = [
        {
          path = "screenshot";
          blur_passes = 3;
          blur_size = 8;
        }
      ];

      input-field = [
        {
          size = "200, 50";
          position = "0, 0";
          monitor = "";
          dots_center = true;
          fade_on_empty = false;
          font_color = "rgb(171, 178, 191)";
          inner_color = "rgb(40, 44, 52)";
          outer_color = "rgb(97, 175, 239)";
          outline_thickness = 5;
          placeholder_text = "\'<span foreground=\"##cad3f5\">Enter Password</span>\'";
          shadow_passes = 2;
        }
      ];
    };
  };
}
