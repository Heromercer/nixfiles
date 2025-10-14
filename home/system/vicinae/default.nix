{inputs, ...}: {
  imports = [inputs.vicinae.homeManagerModules.default];

  services.vicinae = {
    enable = true;
    autStart = true;
  };

  wayland.windowManger.hyprland.settings.exec-once = ["systemctl enable --now --user viciae.service"];
}
