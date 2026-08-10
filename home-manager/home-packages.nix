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
    qimgv
    rnote
    vlc
    zotero

    # CLI utils
    bc
    bottom
    brightnessctl
    cliphist
    ungoogled-chromium
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
    gdown
    silicon
    slurp
    sshfs
    unzip
    wget
    wl-clipboard
    wtype
    xev
    yt-dlp
    zip

    # Coding stuff
    gcc
    rustup
    python3
    uv
    nodejs
    zlib

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
    apple-cursor
    autotiling
    awww
    nix-prefetch-scripts
  ];

  fonts.fontconfig.enable = true;
}
