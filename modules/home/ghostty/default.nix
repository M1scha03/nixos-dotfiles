{
  pkgs,
  ...
}:
{
  programs.ghostty = {
    enable = true;
    package = pkgs.ghostty;
    settings = {
      # UI
      background-opacity = 0.85;
      window-padding-x = 5;
      window-padding-y = 5;

      theme = "noctalia";
      custom-shader = "${./cursor-warp.glsl}";

      # font
      adjust-cell-height = 3;
      font-family = "Maple Mono NF";
      font-style = "Regular";
      font-size = 11;
    };
  };
}
