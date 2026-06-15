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
      settings = {
        default-timeout = 4000;
        background-color = "#1d1f21";
        text-color = "#c5c8c6";
        border-color = "#4d6a7c";
        border-size = 2;
        border-radius = 4;
        padding = "10";
        font = "Maple NF";
      };
    };
  };
}
