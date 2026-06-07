{
  pkgs,
  self,
  hostname,
  ...
}:

{
  services = {
    mako = {
      enable = true;
      actions = true;
      borderRadius = 8;
      borderSize = 1;
      defaultTimeout = 10000;
      icons = true;
      layer = "overlay";
      maxVisible = 3;
      padding = "10";
      width = 300;
    };
  };
}
