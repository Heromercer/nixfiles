{ den, lib, ... }:
{
  mercer.services.provides.udisks = {
    nixos = {
      services.udisks2.enable = true;
    };

    homeManager =
      { pkgs, ... }:
      {
        services.udiskie = {
          enable = true;
          automount = true;
          tray = "auto";
          notify = true;
        };
      };
  };
}
