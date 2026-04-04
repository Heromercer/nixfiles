{ den, lib, ... }:
{
  den.aspects.alec = {
    includes = [
      den.provides.define-user
      den.provides.primary-user
      (den.provides.user-shell "fish")
    ];
    homeManager =
      { pkgs, ... }:
      {
        home.packages = [ pkgs.cowsay ];
      };
  };
}
