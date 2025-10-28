{
  pkgs,
  config,
  ...
}: {
  wayland.windowManager.hyprland.settings.exec-once = [
    "systemctl --user start hyprpolkitagent"
    "bash -c 'wl-paste --watch cliphist store &'"
    "dms run"
  ];

  home.packages = with pkgs; [hyprpolkitagent];
}
