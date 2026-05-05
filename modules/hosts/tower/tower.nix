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
    nixos =
      { pkgs, ... }:
      {
        virtualisation.docker = {
          enable = true;
        };
        users.users.alec = {
          extraGroups = [ "docker" ];
        };

        environment.systemPackages = with pkgs; [
          vivaldi
        ];

        imports = [ ./_tower-hardware.nix ];
      };
  };
}
