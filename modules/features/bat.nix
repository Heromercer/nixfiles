{
  mercer,
  ...
}:
{
  mercer.bat = {
    homeManager =
      { pkgs, ... }:
      {
        programs.bat = {
          enable = true;
          config = {
            theme = "Catppuccin Macchiato";
          };
          extraPackages = with pkgs.bat-extras; [
            batdiff
            batman
            batgrep
            batwatch
          ];
        };
      };
  };
}
