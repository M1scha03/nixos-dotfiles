{
  inputs,
  ...
}:
{
  imports = [
    inputs.zen-browser.homeModules.beta
  ];

  programs.zen-browser = {
    enable = true;
    setAsDefaultBrowser = true;

    profiles.default = {
      settings = {
        "ui.systemUsesDarkTheme" = 1;
        "extensions.autoDisableScopes" = 0;
        "extensions.showRecommendations" = false;
        "zen.welcome-screen.seen" = true;
      };

      search = {
        force = true; # Enforce declared search engines on each rebuild
        default = "brave";
        engines = {
          youtube = {
            name = "Youtube";
            urls = [
              {
                template = "https://www.youtube.com/results?search_query={searchTerms}";
              }
            ];
            definedAliases = [ "@yt" ];
          };
          github = {
            name = "GitHub Search";
            urls = [
              {
                template = "https://github.com/search?q={searchTerms}";
              }
            ];
            definedAliases = [ "@gh" ];
          };
          brave = {
            urls = [
              {
                template = "https://search.brave.com/search?q={searchTerms}";
              }
            ];
            definedAliases = [ "@b" ];
          };
        };
      };
    };
    # policies =
    #   let
    #     mkExtensionSettings = builtins.mapAttrs (
    #       _: slug: {
    #         install_url = "https://addons.mozilla.org/firefox/downloads/latest/${slug}/latest.xpi";
    #         installation_mode = "force_installed";
    #       }
    #     );
    #   in
    #   {
    #     ExtensionSettings = mkExtensionSettings {
    #       "uBlock0@raymondhill.net" = "ublock-origin";
    #       "{446900e4-71c2-419f-a6a7-df9c091e268b}" = "bitwarden-password-manager";
    #       "{d7742d87-e61d-4b78-b8a1-b469842139fa}" = "vimium-ff";
    #     };
    #   };
  };
}
