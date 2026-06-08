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
    };
  };
}
