{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    python3
    gcc

    samtools
    minimap2
    freebayes

    fastfetch
    tree
  ];
}
