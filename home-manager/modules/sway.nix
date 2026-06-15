{ pkgs, ... }: {

  wayland.windowManager.sway = {
    enable = true;
    package = pkgs.swayfx;
    checkConfig = false;

    wrapperFeatures.gtk = true;

    config = rec {
      modifier = "Mod4";
      terminal = "foot";
      menu = "rofi -show drun";

      defaultWorkspace = "workspace number 1";

      input = {
        "type:touchpad" = {
          tap = "enabled";
          natural_scroll = "disabled";
          dwt = "enabled";
        };
        "type:keyboard" = {
          repeat_delay = "400";
          repeat_rate = "30";

          xkb_options = "caps:swapescape";
        };
      };

      # resize mode
      modes.resize = {
        h = "resize shrink width 10 px";
        j = "resize grow height 10 px";
        k = "resize shrink height 10 px";
        l = "resize grow width 10 px";

        Return = "mode default";
        Escape = "mode default";
      };

      keybindings =
        let
          mod = "Mod4";
        in
        {
          "${mod}+Return" = "exec foot";
          "${mod}+r" = "exec rofi -show drun";
          "${mod}+q" = "kill";

          # focus
          "${mod}+h" = "focus left";
          "${mod}+j" = "focus down";
          "${mod}+k" = "focus up";
          "${mod}+l" = "focus right";

          # layout
          "${mod}+f" = "fullscreen toggle";
          "${mod}+v" = "floating toggle";
          "${mod}+d" = "mode resize";

          "${mod}+m" = "layout toggle split";
          "${mod}+t" = "layout tabbed";
          "${mod}+s" = "layout stacking";

          # scratchpad
          "${mod}+Space" = "scratchpad show";
          "${mod}+Shift+Space" = "move scratchpad";

          # screenshot
          "Print" =
            ''exec grim -g "$(slurp)" - | wl-copy && notify-send -i camera-photo "snap!" "region copied to clipboard"'';
          "Shift+Print" =
            ''exec grim - | wl-copy && notify-send -i camera-photo "snap!" "screen copied to clipboard"'';
          "Mod1+Print" =
            ''exec sh -c 'c=$(hyprpicker -a); notify-send "swish!" "$c ($(pastel format name "$c")) copied to clipboard"' '';

          # move window
          "${mod}+Shift+h" = "move left";
          "${mod}+Shift+j" = "move down";
          "${mod}+Shift+k" = "move up";
          "${mod}+Shift+l" = "move right";

          # workspaces
          "${mod}+1" = "workspace number 1";
          "${mod}+2" = "workspace number 2";
          "${mod}+3" = "workspace number 3";
          "${mod}+4" = "workspace number 4";
          "${mod}+5" = "workspace number 5";
          "${mod}+6" = "workspace number 6";
          "${mod}+7" = "workspace number 7";
          "${mod}+8" = "workspace number 8";
          "${mod}+9" = "workspace number 9";
          "${mod}+0" = "workspace number 10";

          "${mod}+Shift+1" = "move container to workspace number 1, workspace number 1";
          "${mod}+Shift+2" = "move container to workspace number 2, workspace number 2";
          "${mod}+Shift+3" = "move container to workspace number 3, workspace number 3";
          "${mod}+Shift+4" = "move container to workspace number 4, workspace number 4";
          "${mod}+Shift+5" = "move container to workspace number 5, workspace number 5";
          "${mod}+Shift+6" = "move container to workspace number 6, workspace number 6";
          "${mod}+Shift+7" = "move container to workspace number 7, workspace number 7";
          "${mod}+Shift+8" = "move container to workspace number 8, workspace number 8";
          "${mod}+Shift+9" = "move container to workspace number 9, workspace number 9";
          "${mod}+Shift+0" = "move container to workspace number 10, workspace number 10";

          # Audio Volume Controls (Sink - Output)
          "XF86AudioRaiseVolume" = "exec swayosd-client --output-volume raise";
          "XF86AudioLowerVolume" = "exec swayosd-client --output-volume lower";
          "XF86AudioMute" = "exec swayosd-client --output-volume mute-toggle";

          # Microphone Volume Control (Source - Input)
          "XF86AudioMicMute" = "exec swayosd-client --input-volume mute-toggle";

          # Caps Lock
          "--release Caps_Lock" = "exec swayosd-client --caps-lock";

          # Brightness Controls
          "XF86MonBrightnessUp" = "exec swayosd-client --brightness +2";
          "XF86MonBrightnessDown" = "exec swayosd-client --brightness -2";

          # Media Player Controls
          "XF86AudioPlay" = "exec swayosd-client --playerctl play-pause";
          "XF86AudioNext" = "exec swayosd-client --playerctl next";
          "XF86AudioPrev" = "exec swayosd-client --playerctl prev";
        };

      gaps = {
        smartBorders = "on";
        smartGaps = "on";
        inner = 4;
        outer = 4;
      };

      window = {
        titlebar = false;
        commands = [
          {
            criteria = {
              app_id = "blueman-manager";
            };
            command = "floating enable, resize set 300 500, move position 1000 32";
          }
        ];
      };

      bars = [ ]; # make way for swaybar

      startup = [
        { command = "waybar"; }
        { command = "autotiling"; }
        { command = "awww-daemon"; }
      ];

      colors = {
        focused = {
          border = "#e9bc76c8";
          background = "#373b41";
          text = "#c5c8c6";
          indicator = "#e7a051";
          childBorder = "#e9bc76";
        };
        unfocused = {
          border = "#373b4100";
          background = "#282a2e";
          text = "#c5c8c6";
          indicator = "#282a2e";
          childBorder = "#373b41";
        };
        urgent = {
          border = "#bf2037c8";
          background = "#e36c6a";
          text = "#c5c8c6";
          indicator = "#e36c6a";
          childBorder = "#bf2037";
        };
      };
    };

    # additional swayfx options
    extraConfig = ''
      # blur 
      blur enable
      blur_passes 2
      blur_radius 2

      # corner radius
      corner_radius 2

      # shadows
      shadows enable
      shadow_blur_radius 15
      shadow_color #282a2e7f
      shadow_inactive_color #282a2e7f
    '';
  };
}
