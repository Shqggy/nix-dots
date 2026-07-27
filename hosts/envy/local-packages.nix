{pkgs, ...}: {
  services.power-profiles-daemon.enable = true;
  programs.steam.enable = true;

  environment.systemPackages = with pkgs; [
  ];
}
