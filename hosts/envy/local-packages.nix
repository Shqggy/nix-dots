{pkgs, ...}: {
  services.power-profiles-daemon.enable = true;
  programs.steam.enable = true;
  virtualisation.docker.enable = true;
  virtualisation.podman.enable = true;

  environment.systemPackages = with pkgs; [
  ];
}
