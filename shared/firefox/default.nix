{
  inputs,
  config,
  pkgs,
  lib,
  ...
}:
let
  cfgff = config.hm-modules.firefox;
  cfglw = config.hm-modules.librewolf;
  extensions = {
    # Can easily be found through installation, then about:debugging#/runtime/this-firefox
    "uBlock0@raymondhill.net" = {
      installation_mode = "force_installed";
      install_url = "https://addons.mozilla.org/firefox/downloads/latest/ublock-origin/latest.xpi";
      private_browsing = true;
    };
    "{446900e4-71c2-419f-a6a7-df9c091e268b}" = {
      installation_mode = "force_installed";
      install_url = "https://addons.mozilla.org/firefox/downloads/latest/bitwarden-password-manager/latest.xpi";
    };
  };
  added-engines = [
    {
      Name = "Qwant";
      URLTemplate = "https://www.qwant.com/?q={searchTerms}&locale=en_GB";
      Method = "GET";
      IconURL = "https://www.qwant.com/public/favicon.066f5ee2ab77b590bb5846c32c57cb84.ico";
      Alias = "@qwant";
      Description = "Search with Qwant";
    }
    {
      Name = "Brave";
      URLTemplate = "https://search.brave.com/search?q={searchTerms}";
      Method = "GET";
      IconURL = "https://brave.com/favicon.ico";
      Alias = "@brave";
      Description = "Search with Brave";
    }
    {
      Name = "Home manager options";
      URLTemplate = "https://home-manager-options.extranix.com/?query={searchTerms}";
      Method = "GET";
      IconURL = "https://nixos.org/favicon.ico";
      Alias = "@hmo";
      Description = "Home manager options";
    }
    {
      Name = "Google Scholar";
      URLTemplate = "https://scholar.google.com/scholar?q={searchTerms}";
      Method = "GET";
      IconURL = "https://scholar.google.com/favicon.ico";
      Alias = "@scholar";
      Description = "Search in Google Scholar";
    }
    {
      Name = "Youtube";
      URLTemplate = "https://www.youtube.com/results?search_query={searchTerms}";
      Method = "GET";
      IconURL = "https://www.youtube.com/favicon.ico";
      Alias = "@yt";
      Description = "Search in Youtube";
    }
  ];
  common-params = {
    PromptForDownloadLocation = true;
    DontCheckDefaultBrowser = true;
    DisableFormHistory = true;
    DisableProfileImport = true;
    DisableTelemetry = true;
    DisableFirefoxStudies = true;
    EnableTrackingProtection = {
      Value = true;
      Cryptomining = true;
      Fingerprinting = true;
      EmailTracking = true;
      SuspectedFingerprinting = true;
    };
    FirefoxHome = {
      TopSites = false;
      SponsoredTopSites = false;
    };
    RequestedLocales = [ "en-GB" ];
    Homepage = {
      StartPage = "previous-session";
    };
    GenerativeAI = {
      Enabled = false; # Disables everything by default
      Locked = true;
    };
    AutofillAddressEnabled = false;
    AutofillCreditCardEnabled = false;
    PasswordManagerEnabled = false;
    Preferences = {
      "geo.enabled" = false;
    };
  };
in
with lib;
{
  options.hm-modules.firefox = {
    enable = mkEnableOption "firefox";
  };

  options.hm-modules.librewolf = {
    enable = mkEnableOption "librewolf";
  };

  config = mkMerge [
    (mkIf cfgff.enable {
      programs.firefox = {
        enable = true;
        languagePacks = [ "en-GB" ];
        policies = {
          ExtensionSettings = extensions // {
            "78272b6fa58f4a1abaac99321d503a20@proton.me" = {
              installation_mode = "normal_installed";
              install_url = "https://addons.mozilla.org/firefox/downloads/latest/proton-pass/latest.xpi";
            };
          };
          SanitizeOnShutdown = {
            Cache = true;
            Cookies = false;
            FormData = true;
            History = false;
            Sessions = false;
            SiteSettings = false;
            Locked = false;
          };
          SearchEngines = {
            Remove = [
              "DuckDuckGo"
              "Bing"
              "Google"
              "Perplexity"
              "eBay"
            ];
            Add = added-engines;
            Default = "Brave";
          };
        }
        // common-params;
      };
    })
    (mkIf cfglw.enable {
      programs.librewolf = {
        enable = true;
        package = pkgs.librewolf-bin;
        languagePacks = [ "en-GB" ];
        policies = {
          ExtensionSettings = extensions;
          SanitizeOnShutdown = true;
          SearchEngines = {
            Remove = [
              "DuckDuckGo"
              "Bing"
              "Google"
              "Perplexity"
              "eBay"
            ];
            Add = added-engines;
            Default = "Brave";
          };
        }
        // common-params;
      };
    })
  ];
}
