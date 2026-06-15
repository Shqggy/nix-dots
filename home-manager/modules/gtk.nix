# gtk.nix — GTK theming for envy
#
# Sets a dark base theme (Arc-Dark) + Papirus-Dark icons + a dark cursor theme,
# then layers Tomorrow Night color overrides via gtk3.extraCss so GTK3 apps
# (Blueman, file pickers, etc.) sit closer to the waybar/swayosd palette.
#
# Reference: https://mynixos.com/home-manager/options/gtk

{ config, pkgs, ... }:

{
  gtk = {
    enable = true;

    # ── Base theme (GTK 2/3) ─────────────────────────────────────────────────
    theme = {
      name = "Arc-Dark";
      package = pkgs.arc-theme;
    };

    # ── Icon theme ───────────────────────────────────────────────────────────
    iconTheme = {
      name = "Papirus-Dark";
      package = pkgs.papirus-icon-theme;
    };

    # ── Cursor theme ─────────────────────────────────────────────────────────
    cursorTheme = {
      name = "Adwaita";
      package = pkgs.adwaita-icon-theme;
      size = 24;
    };

    # ── Global font (GTK 2/3/4) ──────────────────────────────────────────────
    # font = {
    #   name = "Maple Mono NF";
    #   size = 11;
    # };

    # ── Prefer dark mode app-wide ────────────────────────────────────────────
    gtk3.extraConfig = {
      gtk-application-prefer-dark-theme = 1;
    };

    gtk4.extraConfig = {
      gtk-application-prefer-dark-theme = 1;
    };

    # ── Tomorrow Night overrides for GTK3 apps (e.g. Blueman) ───────────────
    gtk3.extraCss = ''
      window {
        background-color: #1d1f21;
        color: #c5c8c6;
      }

      headerbar, .titlebar {
        background-color: #282a2e;
        color: #c5c8c6;
        border: none;
        box-shadow: none;
      }

      button {
        background-color: #373b41;
        color: #c5c8c6;
        border: none;
        border-radius: 0;
      }

      button:hover {
        background-color: #4d6a7c;
      }

      treeview, list, row {
        background-color: #1d1f21;
        color: #c5c8c6;
      }

      row:selected {
        background-color: #4d6a7c;
        color: #c5c8c6;
      }

      scrollbar, scrollbar slider {
        background-color: #282a2e;
        border-radius: 0;
      }

      entry {
        background-color: #282a2e;
        color: #c5c8c6;
        border: 1px solid #373b41;
        border-radius: 0;
      }
    '';
  };

  # GTK_THEME env var helps some apps (e.g. Electron) pick up the theme
  home.sessionVariables = {
    GTK_THEME = "Arc-Dark";
  };
}
