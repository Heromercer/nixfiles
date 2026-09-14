{
  den,
  lib,
  mercer,
  inputs,
  ...
}:
{
  den.schema.host.includes = [ mercer.nix ];

  mercer.nix = {
    nixos = { pkgs, ... }: {
      imports = [ inputs.nix-index-database.nixosModules.default ];
      programs = {
        nix-index-database.comma.enable = true;
        nix-ld = {
          enable = true;
          libraries = with pkgs; [
            icu
            fontconfig
            libICE
            libSM
            libX11
          ];
        };
      };

      nixpkgs.config = {
        allowUnfree = true;
        allowBroken = false;
      };

      nix = {
        settings = {
          auto-optimise-store = true;
          experimental-features = [
            "nix-command"
            "flakes"
          ];
        };
      };

      environment.systemPackages = [ pkgs.nixfmt ];
    };
  };
}
