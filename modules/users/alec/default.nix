{ inputs, ... }:
{
  flake.modules.nixos.alec = {
    users.users.alec = {
      isNoramlUser = true;
      extraGroups = [
        "networkmanager"
        "wheel"
      ];
    };
  };
}
