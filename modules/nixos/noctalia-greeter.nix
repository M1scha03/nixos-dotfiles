{
  inputs,
  pkgs,
  pkgs-unstable,
  ...
}:

{
  imports = [
    inputs.noctalia-greeter.nixosModules.default
  ];

  programs.noctalia-greeter = {
    enable = true;

    package = pkgs-unstable.noctalia-greeter;

    greeter-args = "";

    settings = {
      cursor = {
        theme = "Bibata-Modern-Ice";
        size = 24;
        path = "${pkgs.bibata-cursors}/share/icons";
      };
    };
  };
}
