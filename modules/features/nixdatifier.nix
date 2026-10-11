{ inputs, ... }:
{
  mercer.nixdatifier = {
    homeManager = {
      imports = [ inputs.nixdatifier.homeManagerModules.default ];

      programs.nixdatifier = {
        enable = true;
        autostart = true;
      };
    };
  };
}
