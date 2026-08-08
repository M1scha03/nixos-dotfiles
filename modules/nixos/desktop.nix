{
  pkgs,
  pkgs-unstable,
  inputs,
  ...
}:
{
  services.desktopManager.plasma6.enable = true;

  programs.niri.enable = true;

  xdg.portal = {
    enable = true;
    extraPortals = with pkgs; [
      xdg-desktop-portal-gtk
      xdg-desktop-portal-gnome
    ];

    config = {
      niri = {
        "org.freedesktop.impl.portal.ScreenCast" = "gnome";
        "org.freedesktop.impl.portal.Screenshot" = "gnome";
      };
    };
  };
  environment.systemPackages = with pkgs; [
    # Software
    kitty
    ghostty
    brave
    obsidian
    # Desktop
    xwayland-satellite
    papirus-icon-theme
    # inputs.noctalia.packages.${pkgs.stdenv.hostPlatform.system}.default
    pkgs-unstable.noctalia
  ];
}
