{
  pkgs,
  user,
  ...
}: {
  programs.zsh.enable = true;

  users = {
    defaultUserShell = pkgs.bash;
    users.${user} = {
      isNormalUser = true;
      extraGroups = ["wheel" "networkmanager" "audio" "docker"];
    };
  };

  services.getty.autologinUser = user;
}
