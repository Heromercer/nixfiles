{
  mercer,
  ...
}:
{
  den.schema.user.includes = [ mercer.fish ];

  mercer.fish = {
    includes = [ mercer.bat ];
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
            check = "sudo nix flake check --no-build";
            nf = "cd .nixfiles && nvim";
            rebuild-tower = "nixos-rebuild switch --flake .#tower --target-host alec@192.168.0.4 --sudo --ask-sudo-password";
          };
        };

        home.packages = with pkgs; [
          fishPlugins.tide
        ];
      };
  };
}
