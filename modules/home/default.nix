{ config, pkgs, ... }:
let
  dotfiles = "${config.home.homeDirectory}/nixos-dotfiles/config";
  create_symlink = path: config.lib.file.mkOutOfStoreSymlink path;
  configs = {
    niri = "niri";
    nvim = "nvim";
    kitty = "kitty";
    noctalia = "noctalia";
  };
in

{
  imports = [
    ./shell.nix
    ./programming.nix
    ./tmux.nix
    ./herdr.nix
    ./git.nix
    ./music.nix
    ./zen.nix
    ./ghostty
    ./umbriel
  ];

  home.username = "mischa";
  home.homeDirectory = "/home/mischa";
  home.stateVersion = "26.05";

  gtk = {
    enable = true;
    iconTheme = {
      name = "Colloid-Catppuccin-Dark";
      package = pkgs.colloid-icon-theme.override {
        schemeVariants = [ "catppuccin" ];
      };
    };
  };

  home.pointerCursor = {
    enable = true;
    package = pkgs.bibata-cursors;
    name = "Bibata-Modern-Ice";
    size = 24;
  };

  xdg.configFile = builtins.mapAttrs (name: subpath: {
    source = create_symlink "${dotfiles}/${subpath}";
    recursive = true;
  }) configs;
}
