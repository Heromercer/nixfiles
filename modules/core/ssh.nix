{ mercer, ... }:
{
  den.schema.host.includes = [ mercer.services._.ssh ];

  mercer.services.provides.ssh = {
    nixos = {
      services.openssh = {
        enable = true;
      };
    };
  };
}
