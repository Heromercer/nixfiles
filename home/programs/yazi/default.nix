{
  pkgs,
  config,
  ...
}: {
  programs.yazi = {
    enable = true;
    enableFishIntegration = true;
    settings.mgr = {
      show_hidden = true;
    };
    keymap = {
      mgr.prepend_keymap = [
        {
          run = "cd /mnt/archive/disk/";
          on = ["g" "m" "1"];
        }

        {
          run = "cd /mnt/gamesHDD/";
          on = ["g" "m" "2"];
        }

        {
          run = "cd /mnt/media/";
          on = ["g" "m" "3"];
        }

        {
          run = "cd /mnt/games/disk/";
          on = ["g" "m" "4"];
        }
      ];
    };
  };
}
