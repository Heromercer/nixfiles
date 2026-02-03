{ inputs, ... }:
{
  flake.modules.nixos.alec = {
    users.users.alec = {
      isNormalUser = true;
      extraGroups = [
        "networkmanager"
        "wheel"
      ];
    };
  };
}
