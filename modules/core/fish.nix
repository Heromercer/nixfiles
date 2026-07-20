{
  den,
  lib,
  mercer,
  ...
}:
{
  den.schema.user.includes = [ mercer.fish ];

  mercer.fish = {
    homeManager =
      { pkgs, ... }:
      {
        programs.fish = {
          enable = true;

          interactiveShellInit = ''
            set fish_greeting
          '';

          shellAliases = {
            nhs = "nh os switch";
            nhsu = "nh os switch -u";
            nhc = "nh clean all --keep 10 --ask";
            check = "sudo nix flake check";
            nf = "cd .nixfiles && nvim";
          };
        };
        home.packages = with pkgs; [
          fishPlugins.tide
        ];
      };
  };
}
