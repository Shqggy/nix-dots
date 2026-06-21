{pkgs, ...}: {
  home.packages = with pkgs; [
    # Packages in each category are sorted alphabetically

    # Desktop apps
    anki
    kdePackages.dolphin
    kdePackages.gwenview
    libreoffice
    mpv
    krita
    obs-studio
    obsidian
    pavucontrol
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
    fastfetch
    tree
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
    gcc
    rustup
    python3
    uv
    nodejs

    # Container stuff
    apptainer
    docker

    # Comp Bio stuff
    samtools
    minimap2
    freebayes

    # Fonts
    maple-mono.NF
    google-fonts

    # Other
    autotiling
    awww
    nix-prefetch-scripts
    nix-ld
  ];

  fonts.fontconfig.enable = true;
}
