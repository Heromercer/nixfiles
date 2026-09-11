{ __findFile, inputs, ... }:
{
  mercer.noctalia = {
    includes = [
      <mercer/services/power-mngmt>
      <mercer/cursor>
    ];

    nixos =
      { pkgs, ... }:
      {
        imports = [
          inputs.noctalia.nixosModules.default
          inputs.noctalia-greeter.nixosModules.default
        ];

        programs.noctalia = {
          enable = true;
          systemd.enable = true;

          recommendedServices.enable = true;
        };

        programs.noctalia-greeter = {
          enable = true;
          settings = {
            cursor = {
              theme = "catppuccin-latte-light-cursors";
              size = 24;
              path = "${pkgs.catppuccin-cursors.latteLight}/share/icons";
            };
          };
        };

        nix.settings = {
          extra-substituters = [ "https://noctalia.cachix.org" ];
          extra-trusted-public-keys = [
            "noctalia.cachix.org-1:pCOR47nnMEo5thcxNDtzWpOxNFQsBRglJzxWPp3dkU4="
          ];
        };
      };

    homeManager = {
      imports = [ inputs.noctalia.homeModules.default ];

      programs.noctalia = {

        settings = {

        };
      };
    };
  };
}
