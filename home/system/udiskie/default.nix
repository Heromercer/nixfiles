{
  config,
  pkgs,
  ...
}: {
  services.udiskie = {
    enable = true;
    automount = true;
    tray = "auto";
    notify = true;
  };
}
