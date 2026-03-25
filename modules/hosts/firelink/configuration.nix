{ self, inputs, ... }:
{
  flake.nixosModules.firelinkConfiguration =
    { pkgs, lib, ... }:
    {
      imports = [
        self.nixosModules.firelinkHardware
      ];

      nix.settings.experimental-features = [
        "nix-command"
        "flakes"
      ];

      environment.systemPackages = with pkgs; [
        firefox
        vim
      ];
    };
}
