{ pkgs, ... }:
{
  programs.librewolf = {
    enable = true;
    languagePacks = [ "en-US" ];

    profiles = {
      rough = {
        name = "rough";
        id = 0;
        isDefault = true;
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
              definedAliases = [ "np" ];
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
              definedAliases = [ "np" ];
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
      DisableFormHistory = true;

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
