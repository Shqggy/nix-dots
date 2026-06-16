{pkgs, ...}: {
  home.packages = [
    (import ./tmux-launcher.nix {inherit pkgs;})
    (import ./wallpaper-picker.nix {inherit pkgs;})
  ];
}
