{ ... }:

{
  programs.umbriel.settings = {
    layer_rule = [
      {
        match.namespace = ''^noctalia-(bar-[^"]+|notification|dock|panel|attached-panel|osd|desktop-widget-[^"]*)$'';
        blur = true;
        blur_ignore_alpha = 0.35;
        blur_popups = true;
      }
    ];

    window_rule = [
      {
        match.app_id = "^dev\\.noctalia\\.UmbrielSharePicker$";
        default_floating = true;
        default_size = [
          800
          600
        ];
      }
      {
        blur = true;
      }
    ];
  };
}
