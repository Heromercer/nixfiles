{
  mercer.services.provides.mysql = {
    nixos =
      { pkgs, ... }:
      {
        services.mysql = {
          enable = true;
          package = pkgs.mariadb;
        };
      };
  };
}
