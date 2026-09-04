{ inputs, mercer, ... }:
{
  mercer.emacs = {
    den.schema.host.includes = [ mercer.emacs ];

    homeManager =
      { pkgs, ... }:
      {
        imports = [ inputs.nix-doom-emacs-unstraightened.homeModule ];

        programs.fd.enable = true;
        programs.ripgrep.enable = true;

        programs.doom-emacs = {
          enable = true;
          provideEmacs = true;
          doomDir = ./doom.d;
          emacs = pkgs.emacs-pgtk;

          experimentalFetchTree = true;
        };
      };
  };
}
