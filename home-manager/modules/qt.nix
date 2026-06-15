{ pkgs, ... }:
{
  qt = {
    enable = true;
    platformTheme.name = "kde";
    style.name = "kvantum";
    kvantum = {
      enable = true;
      themes = with pkgs; [
        catppuccin-kvantum
      ];
    };
  };
}
