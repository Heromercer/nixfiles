{
  mercer.services.provides.vpn = {
    nixos =
      { pkgs, ... }:
      {
        services.mullvad-vpn = {
          enable = true;
          package = pkgs.mullvad-vpn;
        };
      };
  };
}
