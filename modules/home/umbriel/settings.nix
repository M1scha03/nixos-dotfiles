{ ... }:

{
  programs.umbriel.settings = {
    general = {
      autostart = [ "noctalia" ];
      xwayland = true;
      show_cheatsheet = false;
      focus_on_activate = false;
    };

    appearance = {
      prefer_no_csd = true;
      border_width = 2;
      outer_border_width = 0;
      corner_radius = 0;

      shadow = {
        enabled = false;
        softness = 10;
        offset_x = 2;
        offset_y = 2;
        color = "#0000007F";
      };

      blur = {
        enabled = true;
        optimized = true;
        passes = 3;
        radius = 5;
        noise = 0.0;
        brightness = 0.9;
        contrast = 1.1;
        saturation = 1.2;
      };
    };

    hot_corners.top_left = {
      enabled = true;
      delay_ms = 500;
      action = "overview-toggle";
    };
  };

  home.sessionVariables = {
    XDG_CURRENT_DESKTOP = "Umbriel";
    XDG_SESSION_TYPE = "wayland";
    XDG_SESSION_DESKTOP = "Umbriel";
  };
}
