{
  __findFile,
  ...
}:
{
  den.homes.x86_64-linux.alec = { };

  den.aspects.alec = {
    includes = [
    ];

    nixos =
      { pkgs, lib, ... }:
      {
        users.users.alec = {
          isNormalUser = true;
          extraGroups = [
            "wheel"
            "networkmanager"
          ];
        };
      };
  };
}
