{
  programs.waybar = {
    enable = true;
    style = ./style.css;
    settings = {
      mainBar = {
        layer = "top";
        height = 30;
        modules-left = [
          "sway/workspaces"
        ];
        modules-center = [ "clock" ];
        modules-right = [
          "backlight"
          "pulseaudio"
          "upower"
        ];
      };
    };
  };
}
