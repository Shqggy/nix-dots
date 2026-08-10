{
  homeStateVersion,
  user,
  pkgs,
  ...
}: {
  imports = [
    ./modules
    ./home-packages.nix
  ];

  home = {
    username = user;
    homeDirectory = "/home/${user}";
    stateVersion = homeStateVersion;
    # sessionPath = ["/home/${user}/.cargo/bin"];
    pointerCursor = {
      enable = true;
      sway.enable = true;
      sway.size = 24;
      package = pkgs.apple-cursor;
      name = "macOS";
    };
  };
}
