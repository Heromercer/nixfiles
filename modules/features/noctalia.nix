{ __findFile, inputs, ... }:
{
  mercer.noctalia = {
    includes = [ <mercer/services/power-mngmt> ];

    nixos = {
      imports = [
        inputs.noctalia.nixosModules.default
        inputs.noctalia-greeter.nixosModules.default
      ];

      programs.noctalia = {
        enable = true;

        recommendedServices.enable = true;
      };

      programs.noctalia-greeter = {
        enable = true;
        greeter-args = "";
        settings = {

        };
      };
    };
  };
}
