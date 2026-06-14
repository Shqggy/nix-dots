{ lib, ... }:
{
  programs.foot = {
    enable = true;

    settings = {
      main = {
        font = "MapleMono NF: size=8";
        term = "xterm-256color";
        dpi-aware = "yes";
      };

      mouse = {
        hide-when-typing = "yes";
      };

      colors-dark = {
        alpha = 0.88;
        # Atelier
        foreground = "e5e4e2";
        background = "272522";

        regular0 = "1d1b18"; # black
        regular1 = "ea2743"; # red
        regular2 = "8c9440"; # green
        regular3 = "e7a051"; # yellow
        regular4 = "4d6a7c"; # blue
        regular5 = "85678f"; # magenta
        regular6 = "5e907a"; # cyan
        regular7 = "dec9c4"; # white

        bright0 = "766c6a"; # bright black
        bright1 = "e36c6a"; # bright red
        bright2 = "b5bd68"; # bright green
        bright3 = "e9bc76"; # bright yellow
        bright4 = "8ba4ab"; # bright blue
        bright5 = "b294bb"; # bright magenta
        bright6 = "7ac9b4"; # bright cyan
        bright7 = "f6eade"; # bright white
      };
    };
  };
}
