{
  den,
  lib,
  mercer,
  ...
}:
{
  den.ctx.user.includes = [ mercer.nix-helper ];

  mercer.nix-helper = {
    homeManager = {
      programs.nh = {
        enable = true;
        clean.enable = true;
        clean.extraArgs = "--keep-since 4d --keep 3";
        flake = "/home/alec/.nixfiles";
        homeFlake = "/home/alec/.nixfiles";
      };
    };
  };
}
