{ pkgs, config, ... }:
{
  programs.rmpc = {
    enable = true;
  };

  services.mpd = {
    enable = true;
    musicDirectory = "${config.home.homeDirectory}/Music";
    playlistDirectory = "${config.home.homeDirectory}/Music";

    extraConfig = ''
      audio_output {
        type    "pipewire"
        name    "MPD PipeWire"
        mixer_type "software"
      }
    '';
  };

  services.mpd-mpris.enable = true;
  home.packages = [ pkgs.playerctl ];
}
