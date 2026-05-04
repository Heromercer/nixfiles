{
  mercer.services.provides.headscale = {
    nixos =
      { pkgs, inputs', ... }:
      {
        services.headscale = {
          enable = true;
          settings = {
            dns.magic_dns = false;
          };
        };

        environment.systemPackages = with inputs'.nixpkgs-unstable.legacyPackages; [
        ];
      };
  };
}
