{
  pkgs,
  inputs,
  ...
}:
{

  imports = [ inputs.umbriel.nixosModules.default ];
  programs.umbriel = {
    enable = true;
  };

  services.desktopManager.gnome.enable = true;

  # programs.niri.enable = true;

  xdg.portal = {
    enable = true;
    extraPortals = with pkgs; [
      xdg-desktop-portal-gtk
      xdg-desktop-portal-gnome
    ];

    config = {
      # niri = {
      #   "org.freedesktop.impl.portal.ScreenCast" = "gnome";
      #   "org.freedesktop.impl.portal.Screenshot" = "gnome";
      # };
      umbriel = {
        "org.freedesktop.impl.portal.ScreenCast" = [ "umbriel" ];
        "org.freedesktop.impl.portal.Screenshot" = [ "umbriel" ];
      };
    };
  };
  environment.systemPackages = with pkgs; [
    # Software
    kitty
    bitwarden-desktop
    obsidian
    bibata-cursors
    # Desktop
    xwayland-satellite
    noctalia
  ];
}
