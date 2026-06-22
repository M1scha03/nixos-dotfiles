{ config, ... }:
let
  dotfiles = "${config.home.homeDirectory}/nixos-dotfiles/config";
  create_symlink = path: config.lib.file.mkOutOfStoreSymlink path;
  configs = {
    niri = "niri";
    nvim = "nvim";
    kitty = "kitty";
  };
in

{
  imports = [
    ./shell.nix
    ./programming.nix
    ./tmux.nix
  ];

  home.username = "mischa";
  home.homeDirectory = "/home/mischa";
  home.stateVersion = "26.05";

  programs.git.enable = true;

  xdg.configFile = builtins.mapAttrs (name: subpath: {
    source = create_symlink "${dotfiles}/${subpath}";
    recursive = true;
  }) configs;
}
