{ pkgs, ... }:
{
  programs.rofi = {
    enable = true;
    font = "JetBrainsMono Nerd Font 12";
    terminal = "${pkgs.foot}/bin/foot";

    extraConfig = {
      modi = "drun";
      show-icons = true;
      drun-display-format = "{name}";
      location = 0;
      disable-history = false;
      hide-scrollbar = true;
      display-drun = "Apps";
      sidebar-mode = true;
    };
  };
}
