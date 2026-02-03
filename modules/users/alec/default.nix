{ inputs, ... }:
{
  flake.nixosModules.alec = {
    users.users.alec = {
      isNormalUser = true;
      extraGroups = [
        "networkmanager"
        "wheel"
      ];
    };
  };
}
