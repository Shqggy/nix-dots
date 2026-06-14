{ pkgs, ... }:
{
  services.power-profiles-daemon.enable = true;

  environment.systemPackages = with pkgs; [
    gcc
    python3
    rustc
    cargo

    samtools
    minimap2
    freebayes

    fastfetch
    tree

    krita
  ];
}
