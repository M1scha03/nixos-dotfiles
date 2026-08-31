{ ... }:

{
  programs.umbriel.settings = {
    layout = {
      mode = "scrolling";
      gap = 3;
      width_presets = [
        0.333
        0.5
        0.667
      ];
      scrolling = {
        default_width_fraction = 0.5;
        center_underfull_strip = true;
        expand_single_column = true;
      };
    };

    workspaces.back_and_forth = true;
  };
}
