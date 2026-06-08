{ pkgs, ... }:
{
  programs.rofi = {
    enable = true;
    font = "MapleMono NF: size=10";
    terminal = "${pkgs.foot}/bin/foot";

    extraConfig = {
      modi = "drun";
      drun-display-format = "{name}";
      location = 0;
      disable-history = false;
      hide-scrollbar = true;
      display-drun = "Apps";
      sidebar-mode = true;
    };
  };
}
