{ ... }:
let
  # Monitors
  laptopmonitor = "eDP-1";
  externalMonitor = "DP-1";
in
{
  programs.umbriel.settings = {
    output.${laptopmonitor} = {
      mode = "1920x1200@60";
      position = [
        2048
        0
      ];
      scale = 1.25;
      vrr = "fullscreen";
      hdr = "off";
      enabled = true;
      workspaces = 9;
    };

    output.${externalMonitor} = {
      mode = "2560x1440@179.952";
      position = [
        0
        0
      ];
      scale = 1.25;
      vrr = "fullscreen";
      hdr = "off";
      enabled = true;
      workspaces = 9;
    };
  };
}
