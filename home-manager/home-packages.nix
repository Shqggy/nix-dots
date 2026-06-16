{ pkgs, ... }:
{
  home.packages = with pkgs; [
    # Packages in each category are sorted alphabetically

    # Desktop apps
    anki
    kdePackages.dolphin
    kdePackages.gwenview
    kdePackages.kate
    lapce
    libreoffice
    mpv
    obs-studio
    obsidian
    pavucontrol
    vscodium
    helix
    vlc
    zotero

    # CLI utils
    bc
    bottom
    brightnessctl
    cliphist
    ffmpeg
    ffmpegthumbnailer
    fzf
    git-graph
    grim
    htop
    hyprpicker
    libnotify
    ntfs3g
    pastel
    playerctl
    ripgrep
    silicon
    slurp
    unzip
    wget
    wl-clipboard
    wtype
    yt-dlp
    zip

    # Coding stuff
    nodejs

    # Fonts
    maple-mono.NF
    google-fonts

    # Other
    autotiling
    awww
    nix-prefetch-scripts
  ];

  fonts.fontconfig.enable = true;
}
