{
  config,
  inputs,
  pkgs,
  ...
}:
{
  services.mpd = {
    enable = true;
    musicDirectory = "/mnt/archive/disk/Music";
    dataDir = "${config.home.homeDirectory}/.config/mpd/";
    extraConfig = ''
      auto_update "yes"

      audio_output {
      type    "pipewire"
      name    "Pipewire Sound Server"
      }

      audio_output {
      type    "fifo"
      name    "ncmpcpp visualizer"
      path    "/tmp/mpd.fifo"
      format  "44100:16:1"
      }
    '';
  };
}
