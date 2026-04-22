{
  mercer.plymouth = {
    nixos =
      { pkgs, ... }:
      {
        boot = {
          plymouth = {
            enable = true;
            theme = "nixos-bgrt";
            themePackages = with pkgs; [
              nixos-bgrt-plymouth
            ];
          };
          consoleLogLevel = 2;
          initrd.verbose = false;
          kernelParams = [
            "quiet"
            "udev.log_level=3"
            "systemd.show_status=auto"
          ];

        };
      };
  };
}
