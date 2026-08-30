# Umbriel Layout — Noctalia v5 prototype

This version is adapted to the actual output of:

    umbriel workspaces --json

Example entry:

    {
      "active": true,
      "focused": true,
      "id": "DP-1:2",
      "index": 2,
      "layout": "dwindle",
      "name": "II",
      "output": "DP-1"
    }

The widget scans the returned array for the object where:

    focused == true

and shows only:

    workspace.layout

So, with the supplied JSON, the bar displays:

    dwindle

## Why `focused`, not `active`?

Umbriel can have one active workspace per output. In the supplied example both
`eDP-1:1` and `DP-1:2` are active, but only `DP-1:2` is focused.

Therefore `focused == true` is the right field for a single global bar text
representing the workspace the user is currently interacting with.

`active == true` is kept only as a defensive fallback.

## Files

- `plugin.toml`
- `widget.luau`

## Prototype behaviour

- Runs `umbriel workspaces --json`
- Polls every 750 ms
- Finds the workspace with `"focused": true`
- Displays its `"layout"` as plain text
- Falls back to an active workspace if no focused workspace is reported
- Shows `umbriel?` on command failure
- Shows `layout?` if the JSON cannot be interpreted

Once Umbriel exposes an event/IPC stream for workspace or layout changes, this
can be changed from polling to event-driven updates.
