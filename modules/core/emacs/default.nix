{
  inputs,
  mercer,
  ...
}:
{
  den.schema.user.includes = [ mercer.emacs ];

  mercer.emacs = {

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

        # packages for dirvish
        home.packages = with pkgs; [
          imagemagick
          poppler
          ffmpegthumbnailer
          mediainfo
          vips
        ];
      };
  };
}
