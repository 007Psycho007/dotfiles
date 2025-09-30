{ inputs, pkgs, ... }:
{
    programs.starship = {
      
      enable = true;
      enableFishIntegration = true;
      settings = {
        format = "[ $os ](bg:8 fg:blue)[](fg:8 bg:white)[ $username ](fg:black bg:white)[](fg:white bg:8)[ $directory ](fg:white bg:8)[$git_branch$git_status](fg:white bg:8)[$golang](fg:white bg:8)[$python](fg:white bg:8)[$lua](fg:white bg:8)[$terraform](fg:white bg:8)[$kubernetes](fg:white bg:8)[](fg:8)[$fill](fg:white)[](fg:8)[$status](fg:white bg:8)[$conda](fg:white bg:8)[$nix_shell](fg:white bg:8)[$character](fg:white bg:8) ";
        
        continuation_prompt = "      [│](fg:blue)  ";
        os = {
          format = "$symbol";
          style = "bold blue";
          disabled = false;
          symbols = {
            Arch = "";
            NixOS = "";
          };
        };

        username = {
          style_user = "black bold";
          style_root = "red bold";
          format = "$user";
          disabled = false;
          show_always = true;
        };

        directory = {
          truncation_length = 3;
          truncation_symbol = "…/";
          truncate_to_repo = true;
          format = "$path $read_only";
          home_symbol = " ~";
          read_only = "";
          read_only_style = "red";
        };
        git_branch = {
          symbol = " ";
          truncation_length = 15;
          truncation_symbol = "";
          style = "red";
          format = " [$symbol$branch](fg:red bg:8)";
        };
        git_status = {
          conflicted = " =$count";
          ahead = " ⇡$count";
          behind = " ⇣$count";
          diverged = " ⇕$count";
          up_to_date = "✓";
          untracked = " ?$count";
          stashed = " $$count";
          renamed = " »$count";
          deleted = " X$count";
          staged = " +$count";
          modified = " !$count";
          format = "[$all_status](fg:red bg:8) ";
        };

        conda = {
          symbol = "";
          style = "yellow";
          format = " [$symbol $environment](fg:yellow bg:8) ";
          ignore_base = false;
        };

        aws = {
          symbol = "";
          format = " [$symbol $profile](fg:yellow bg:8) ";
        };

        kubernetes = {
          symbol = "";
          format = " [$symbol $context](fg:blue bg:8) ";
        };

        lua = {
          symbol = "";
          format = " [$symbol $version](fg:blue bg:8) ";
        };
        
        golang = {
          symbol = "";
          format = " [$symbol $version](fg:blue bg:8) ";
        };

        python = {
          symbol = "";
          format = " [$symbol $version $virtualenv ](fg:yellow bg:8) ";
        };

        terraform = {
          symbol = "";
          format = " [$symbol $version](fg:blue bg:8) ";
        };

        fill = {
          symbol = "─";
          style = "bold white";
        };

        status = {
          symbol = "[](fg:red bg:8) ";
          success_symbol = "[](fg:green bg:8) ";
          format = " $symbol$status ";
          disabled = false;
        };

        nix_shell = {
          symbol = "";
          format = " [$symbol $name](fg:blue bg:8) ";
        };

        character = {
          format = "$symbol";
          success_symbol = " [  ](fg:white bg:8)[\n ❯](bold green)";
          error_symbol = " [  ](fg:white bg:8)[\n ❯](bold green)";
          vicmd_symbol = " [  ](fg:white bg:8)[\n ❯](bold green)";
          vimcmd_replace_one_symbol = " [  ](fg:white bg:8)[\n ❯](bold green)";
          vimcmd_replace_symbol = " [  ](fg:white bg:8)[\n ❯](bold green)";
          vimcmd_visual_symbol = " [󰈈  ](fg:white bg:8)[\n ❯](bold green)";
        };
        time = {
          disabled = false;
          format = "[$time](fg:blue bg:8)[ ](fg:8)";
          time_format = "%H:%M";
        };
      };
    };
}
