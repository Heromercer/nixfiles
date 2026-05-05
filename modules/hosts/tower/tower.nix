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
      virtualisation.docker = {
        enable = true;
      };
      users.users.alec = {
        extraGroups = [ "docker" ];
      };

      imports = [ ./_tower-hardware.nix ];
    };
  };
}
