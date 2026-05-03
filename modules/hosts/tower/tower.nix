{ mercer, ... }:
{
  den.aspects.tower = {
    provides.to-users =
      { user, ... }:
      {
        includes = with mercer; [
          server
        ];
      };
    nixos = {
      networking = {
        interfaces.enp8s0.ipv4.addresses = [
          {
            address = "192.168.50.3";
            prefixLength = 24;
          }
        ];
        defaultGateway = "192.168.50.1";
        nameservers = [ "8.8.8.8" ];
      };
    };
  };
}
