{
  programs.waybar = {
    enable = true;
    style = ./style.css;
    settings = {
      mainBar = {
        layer = "top";
        height = 30;
      };
      modules-left = [
        "sway/workspaces"
        "sway/mode"
        "wlr/taskbar"
      ];
      modules-center = [ "clock" ];
      modules-right = [
        "backlight"
        "pulseaudio"
        "upower"
      ];
    };
  };
}
