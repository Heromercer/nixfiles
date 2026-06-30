{ inputs, ... }:
{
  mercer.surge = {
    nixos = { pkgs, ... }: {
      environment.systemPackages = [
        inputs.surge.packages.${pkgs.system}.default
      ];
    };
  };
}
