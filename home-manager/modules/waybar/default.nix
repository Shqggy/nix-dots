# waybar.nix — Tomorrow Night theme
# Matches the dense, flat, monospace bar style from the reference screenshot.
#
# Layout (left → center → right):
#   LEFT  : workspaces · sway/mode · cpu · memory · temperature · disk · battery
#   CENTER: sway/window · clock (time) · clock (date)
#   RIGHT : idle_inhibitor · pulseaudio · network · user · tray
#
# Font: Maple Mono NF is already in your Home Manager config (envy).
# The style.css is read from ./style.css (same directory as this file).

{ config, pkgs, ... }:

{
  programs.waybar = {
    enable = true;
    style = ./style.css;
    settings = {
      mainBar = {
        layer = "top";
        position = "top";
        height = 34;
        spacing = 2;

        modules-left = [
          "sway/workspaces"
          "idle_inhibitor"
          "sway/mode"
        ];

        modules-center = [
          "privacy"
          "clock"
        ];

        modules-right = [
          "bluetooth"
          "group/hardware"
          "network"
          "battery"
          "pulseaudio"
          "user"
        ];

        # ── Left modules ────────────────────────────────────────────────────

        "sway/workspaces" = {
          disable-scroll = true;
          all-outputs = true;
          numeric-first = true;
          format = "{name}";
          persistent-workspaces = {
            "1" = [ ];
            "2" = [ ];
            "3" = [ ];
            "4" = [ ];
            "5" = [ ];
          };
        };

        "sway/mode" = {
          format = "  {}"; # nerd font "mode" indicator glyph
        };

        "cpu" = {
          interval = 5;
          format = "󰍛 {usage}%";
          tooltip = false;
          states = {
            warning = 70;
            critical = 90;
          };
        };

        "memory" = {
          interval = 10;
          format = " {used:0.1f}G";
          tooltip-format = "{used:0.1f}G / {total:0.0f}G used";
          states = {
            warning = 75;
            critical = 90;
          };
        };

        "temperature" = {
          # thermal-zone  = 2;   # uncomment and adjust for your hardware
          critical-threshold = 80;
          format = "󰔏 {temperatureF}°F";
          format-critical = "󰸁 {temperatureF}°F";
          tooltip = false;
        };

        "disk" = {
          interval = 30;
          format = " {percentage_used}%";
          path = "/";
          tooltip-format = "{used} / {total} used on {path}";
        };

        "battery" = {
          interval = 30;
          format = "{icon} {capacity}%";
          format-charging = "󱐋 {capacity}%";
          format-plugged = "󰚥 {capacity}%";
          format-icons = {
            default = [
              "󰂎"
              "󰁺"
              "󰁻"
              "󰁼"
              "󰁽"
              "󰁾"
              "󰁿"
              "󰂀"
              "󰂁"
              "󰂂"
              "󰁹"
            ];
          };
          states = {
            warning = 25;
            critical = 10;
          };
          tooltip-format = "{capacity}% — {timeTo} remaining";
        };

        "sway/window" = {
          format = "{app_id}";
          max-length = 60;
          tooltip = false;
        };

        "privacy" = {
          icon-spacing = 4;
          icon-size = 14;
          transition-duration = 250;
          modules = [
            {
              type = "screenshare";
              tooltip = true;
              tooltip-icon-size = 24;
            }
            {
              type = "audio-in";
              tooltip = true;
              tooltip-icon-size = 24;
            }
          ];
        };

        "clock" = {
          format = "󰥔 {:%I:%M  󰃭 %a %d}";
          tooltip-format = "<tt>{calendar}</tt>";
        };

        "idle_inhibitor" = {
          format = "{icon}";
          format-icons = {
            activated = "";
            deactivated = "󱄅";
          };
          tooltip-format-activated = "Idle inhibited";
          tooltip-format-deactivated = "Idle allowed";
        };

        "pulseaudio" = {
          format = "{icon} {volume}%";
          format-muted = "󰖁 {volume}%";
          format-icons = {
            default = [
              "󰕿"
              "󰖀"
              "󰕾"
            ];
          };
          on-click = "wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle";
          scroll-step = 2;
          tooltip-format = "{desc} — {volume}%";
        };

        "network" = {
          interval = 10;
          format-wifi = "󰖩 {signalStrength}%";
          format-ethernet = "󰈀";
          format-disconnected = "󰖪";
          tooltip-format-wifi = "{essid} ({signalStrength}%) via {gwaddr}";
          tooltip-format-ethernet = "{ifname} via {gwaddr}";
          tooltip-format-disconnected = "Disconnected";
        };

        "group/hardware" = {
          orientation = "inherit";
          drawer = {
            transition-duration = 300;
            children-class = "hardware-child";
            transition-left-to-right = false;
          };
          modules = [
            "cpu"
            "temperature"
            "disk"
            "memory"
          ];
        };

        "user" = {
          format = "{user}";
          tooltip-format = "up {work_d}d {work_H}h";
        };

        "bluetooth" = {
          format = "󰂯";
          format-disabled = "󰂲";
          format-connected = "󰂱";
          tooltip-format = "{controller_alias}\t{controller_address}";
          tooltip-format-connected = "{controller_alias}\t{controller_address}\n\n{device_enumerate}";
          tooltip-format-enumerate-connected = "{device_alias}\t{device_address}";
          on-click = "blueman-manager";
        };
      };
    };
  };
}
