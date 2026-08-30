{ inputs, ... }:

{
  imports = [
    inputs.umbriel.homeModules.default
    ./animations.nix
    ./input.nix
    ./keybinds.nix
    ./layout.nix
    ./outputs.nix
    ./rules.nix
    ./settings.nix
    ./umbriel-include-files.nix
  ];

  programs.umbriel.enable = true;
}
