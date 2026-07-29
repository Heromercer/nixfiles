{
  mercer.services.provides.navidrome = {
    nixos =
      { pkgs, ... }:
      {
        services.navidrome = {
          enable = true;
          user = "alec";
          group = "users";
          settings = {
            Address = "0.0.0.0";
            MusicFolder = "/music/";
          };
        };
        networking.firewall.allowedTCPPorts = [ 4533 ];
      };
  };
}
