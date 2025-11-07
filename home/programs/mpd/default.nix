{
  config,
  inputs,
  pkgs,
  ...
}: {
  services.mpd = {
    enable = true;
    musicDirectory = "/mnt/archive/Music";
  };
}
