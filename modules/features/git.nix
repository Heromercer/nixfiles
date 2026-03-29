{ den, lib, ... }:
{
  den.aspects.git = {
    nixos =
      { pkgs, ... }:
      {
        environment.systemPackages = with pkgs; [
          git
        ];
      };
    homeManager =
      { config, pkgs, ... }:
      {
        home.packages = with pkgs; [
          lazygit
        ];
        programs.git = {
          enable = true;
          settings = {
            init.defaultBranch = "main";
            pull.rebase = "false";
            user = {
              name = "alec";
              email = "150299829+Heromercer@users.noreply.github.com";
            };
          };
        };
      };
  };
}
