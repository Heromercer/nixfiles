{ input, config, ... }:
{
  flake.modules.homeManager.git =
    { config, ... }:
    {
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
}
