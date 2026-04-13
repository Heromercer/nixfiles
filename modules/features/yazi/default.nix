{
  den,
  lib,
  mercer,
  ...
}:
{
  den.ctx.user.includes = [ mercer.yazi ];

  mercer.yazi = {
    homeManager =
      { pkgs, ... }:
      {
        programs.yazi = {
          enable = true;
          plugins = {
            chmod = pkgs.yaziPlugins.chmod;
          };
          enableFishIntegration = true;
          settings.mgr = {
            show_hidden = true;
          };
          keymap = {
            mgr.prepend_keymap = [
              {
                run = "cd /mnt/archive/disk/";
                on = [
                  "g"
                  "m"
                  "1"
                ];
              }

              {
                run = "cd /mnt/gamesHDD/";
                on = [
                  "g"
                  "m"
                  "2"
                ];
              }

              {
                run = "cd /mnt/media/";
                on = [
                  "g"
                  "m"
                  "3"
                ];
              }

              {
                run = "cd /mnt/games/disk/";
                on = [
                  "g"
                  "m"
                  "4"
                ];
              }

              {
                run = "plugin chmod";
                on = [
                  "c"
                  "m"
                ];
              }

            ];
          };
        };
      };
  };
}
