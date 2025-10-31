{
  config,
  pkgs,
  lib,
  ...
}: let
  hostname = config.var.hostname;
in {
  home.packages = with pkgs;
    [
      ani-cli
      caligula
      catppuccin-cursors.latteLight
      qt5.qtwayland
      qt6.qtwayland
      libsForQt5.qt5ct
      qt6ct
      hyprshot
      hyprpicker
      swappy
      imv
      wf-recorder
      wlr-randr
      wl-clipboard
      brightnessctl
      gnome-themes-extra
      libva
      dconf
      wayland-utils
      wayland-protocols
      glib
      direnv
      meson
      matugen
      cava
      cliphist
      btop
      xwayland-satellite
      nitch
      ntfs3g
      xdg-user-dirs
    ]
    ++ lib.optionals (hostname == "firelink") [
      atlauncher
    ];
}
