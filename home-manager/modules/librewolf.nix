{pkgs, ...}: {
  programs.librewolf = {
    enable = true;
    languagePacks = ["en-US"];

    profiles = {
      rough = {
        name = "rough";
        id = 0;
        isDefault = true;
        settings = {
          # Remember cookies between sessions
          "network.cookie.lifetimePolicy" = 0;

          # Don't clear data when closing LibreWolf
          "privacy.sanitize.sanitizeOnShutdown" = false;
          "privacy.clearOnShutdown.cookies" = false;
          "privacy.clearOnShutdown.history" = false;
          "privacy.clearOnShutdown.cache" = false;
          "privacy.clearOnShutdown.downloads" = false;
          "privacy.clearOnShutdown.sessions" = false;
          "privacy.clearOnShutdown.siteSettings" = false;

          # Don't always use private browsing
          "browser.privatebrowsing.autostart" = false;

          # Accept normal cookies
          "network.cookie.cookieBehavior" = 0;
        };

        search = {
          default = "ddg";
          force = true;
          engines = {
            wiki.metaData.alias = "<";
            bing.metaData.hidden = true;
            perplexity.metaData.hidden = true;

            wikipedia = {
              name = "Wikipedia";
              urls = [
                {
                  template = "https://en.wikipedia.org/w/index.php";
                  params = [
                    {
                      name = "search";
                      value = "{searchTerms}";
                    }
                  ];
                }
              ];
              icon = "https://en.wikipedia.org/favicon.ico";
              definedAliases = [
                "wk"
                "<"
              ];
            };

            google-scholar = {
              name = "Google Scholar";
              urls = [
                {
                  template = "https://scholar.google.com/scholar";
                  params = [
                    {
                      name = "q";
                      value = "{searchTerms}";
                    }
                  ];
                }
              ];
              icon = "https://scholar.google.com/favicon.ico";
              definedAliases = [
                "gs"
                "@scholar"
              ];
            };

            youtube = {
              name = "YouTube";
              urls = [
                {
                  template = "https://www.youtube.com/results";
                  params = [
                    {
                      name = "search_query";
                      value = "{searchTerms}";
                    }
                  ];
                }
              ];
              icon = "https://www.youtube.com/favicon.ico";
              definedAliases = ["yt"];
            };

            nix-packages = {
              name = "Nix Packages";
              urls = [
                {
                  template = "https://search.nixos.org/packages";
                  params = [
                    {
                      name = "type";
                      value = "packages";
                    }
                    {
                      name = "query";
                      value = "{searchTerms}";
                    }
                  ];
                }
              ];
              icon = "${pkgs.nixos-icons}/share/icons/hicolor/scalable/apps/nix-snowflake.svg";
              definedAliases = ["np"];
            };
          };
        };
        extensions = {
          force = true;
          packages = with pkgs.nur.repos.rycee.firefox-addons; [
            ublock-origin
            proton-pass
            zotero-connector
            youtube-recommended-videos
            wikipedia-first
            darkreader
            tasks-for-canvas
            tomato-clock
          ];
        };
      };

      squishy = {
        name = "squishy";
        id = 1;
        isDefault = false;
        search = {
          default = "ddg";
          force = true;
          engines = {
            wiki.metaData.alias = "<";
            bing.metaData.hidden = true;
            perplexity.metaData.hidden = true;

            nix-packages = {
              name = "Nix Packages";
              urls = [
                {
                  template = "https://search.nixos.org/packages";
                  params = [
                    {
                      name = "type";
                      value = "packages";
                    }
                    {
                      name = "query";
                      value = "{searchTerms}";
                    }
                  ];
                }
              ];
              icon = "${pkgs.nixos-icons}/share/icons/hicolor/scalable/apps/nix-snowflake.svg";
              definedAliases = ["np"];
            };
          };
        };
        extensions = {
          force = true;
          packages = with pkgs.nur.repos.rycee.firefox-addons; [
            ublock-origin
            proton-pass
            zotero-connector
            youtube-recommended-videos
            wikipedia-first
            darkreader
            tasks-for-canvas
          ];
        };
      };
    };

    policies = {
      # blank homepage
      Homepage = {
        URL = "about:home";
        StartPage = "homepage";
      };
      NewTabPage = true;

      # updates and background services
      AppAutoUpdate = false;
      BackgroundAppUpdate = false;

      # feature disabling
      DisableFirefoxStudies = true;
      DisableFirefoxAccounts = true;
      DisableFirefoxScreenshots = true;
      DisableForgetButton = true;
      DisableMasterPasswordCreation = true;
      DisableProfileImport = true;
      DisableProfileRefresh = true;
      DisableSetDesktopBackground = true;
      DisablePocket = true;
      DisableTelemetry = true;
      DisableFormHistory = false;

      # access restrictions
      BlockAboutConfig = false;
      BlockAboutProfiles = false;
      BlockAboutSupport = false;

      # ui and behavior
      DisplayMenuBar = "never";
      DontCheckDefaultBrowser = true;
      HardwareAcceleration = false;
      OfferToSaveLogins = false;
      DefaultDownloadDirectory = "~/Downloads";

      # extensions
      ExtensionSettings = {
        "ublock0@raymondhill.net" = {
          default_area = "menupanel";
          install_url = "https://addons.mozilla.org/firefox/downloads/latest/ublock-origin/latest.xpi";
          installation_mode = "force_installed";
          private_browsing = true;
        };
      };
    };
  };
}
