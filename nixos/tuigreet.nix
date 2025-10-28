{pkgs, ...}: {
  services.greetd = {
    enable = true;
    settings = {
      default_session = {
        command = "${pkgs.greetd.tuigreet}/bin/tuigreet --remember --remember-user-session --asterisks --container-padding 2 --cmd hyprland";
        user = "greeter";
      };
    };
  };
}
