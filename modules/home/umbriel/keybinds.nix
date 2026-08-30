{
  lib,
  ...
}:
let
  inherit (lib)
    nameValuePair
    listToAttrs
    range
    ;
  # Applications
  terminal = "ghostty";
  browser = "zen-beta";
  launcher = "noctalia msg panel-toggle launcher";
  settings = "noctalia msg settings-toggle";
  clipboard = "noctalia msg panel-toggle clipboard";
  notes = "noctalia msg panel-toggle noctalia/notes:panel";
  session = "noctalia msg panel-toggle session";
  screenshotregion = "noctalia msg screenshot-region";
  screenshotfull = "noctalia msg screenshot-fullscreen";

  # Workspaces
  workspaces = map toString (range 1 9);

  workspaceBinds = listToAttrs (
    map (ws: nameValuePair "Mod+${ws}" "workspace-switch:${ws}") workspaces
  );

  workspaceMoveBinds = listToAttrs (
    map (ws: nameValuePair "Mod+Shift+${ws}" "window-move-to-workspace:${ws}") workspaces
  );
in
{
  programs.umbriel.settings.keybinds = {
    # Applications
    "Mod+Return" = "spawn:${terminal}";
    "Mod+B" = "spawn:${browser}";
    "Mod+G" = "spawn:${launcher}";
    "Mod+Slash" = "spawn:${settings}";
    "Mod+V" = "spawn:${clipboard}";
    "Mod+N" = "spawn:${notes}";
    "Mod+Escape" = "spawn:${session}";
    "Print" = "spawn:${screenshotregion}";
    "Shift+Print" = "spawn:${screenshotfull}";

    # Umbriel
    "Mod+O" = "overview-toggle";
    "Mod+Tab" = "workspace-set-layout:toggle";

    # Window Movement
    "Mod+A" = "window-focus-left";
    "Mod+D" = "window-focus-right";
    "Mod+W" = "window-focus-up";
    "Mod+S" = "window-focus-down";
    "Mod+Shift+A" = "column-move-left";
    "Mod+Shift+D" = "column-move-right";
    "Mod+Shift+W" = "window-move-up";
    "Mod+Shift+S" = "window-move-down";

    # Window state
    "Mod+Q" = "window-close";
    "Mod+F" = "window-toggle-maximize";
    "Mod+Shift+F" = "window-toggle-fullscreen";
    "Mod+T" = "window-toggle-floating";
    "Mod+Y" = "window-modify-width:-0.1";
    "Mod+P" = "window-modify-width:+0.1";
    "Mod+Comma" = "window-consume-or-expel-left";
    "Mod+Period" = "window-consume-or-expel-right";

    # Workspaces up/down
    "Mod+I" = "workspace-previous";
    "Mod+U" = "workspace-next";
    "Mod+Shift+I" = "window-move-to-workspace-previous";
    "Mod+Shift+U" = "window-move-to-workspace-next";

    # Monitors
    "Mod+H" = "output-focus-left";
    "Mod+L" = "output-focus-right";
    "Mod+Shift+H" = "window-move-to-output-left";
    "Mod+Shift+L" = "window-move-to-output-right";

    # Laptop stuff
    # Volume (via Noctalia OSD)
    "XF86AudioRaiseVolume" = "spawn:noctalia msg volume-up 2%";
    "XF86AudioLowerVolume" = "spawn:noctalia msg volume-down 2%";
    "Mod+XF86AudioMute" = "spawn:wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle";

    # Media playback (playerctl)
    "XF86AudioPlay" = "spawn:playerctl play-pause";
    "XF86AudioNext" = "spawn:playerctl next";
    "XF86AudioPrev" = "spawn:playerctl previous";

    # Brightness
    "XF86MonBrightnessUp" = "spawn:brightnessctl set +5%";
    "XF86MonBrightnessDown" = "spawn:brightnessctl set 5%-";

    "Mod+Shift+M" = "window-move-to-scratchpad";
    "Mod+M" = "scratchpad-toggle";
    "Mod+Ctrl+M" = "window-restore-from-scratchpad";
  }
  // workspaceBinds
  // workspaceMoveBinds;
}
