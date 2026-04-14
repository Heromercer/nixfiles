{ den, lib, ... }:
{
  mercer.gaming = {
    nixos =
      { pkgs, ... }:
      {
        programs.steam = {
          enable = true;
          gamescopeSession.enable = true;
          protontricks.enable = true;
        };

        programs.gamemode.enable = true;

        environment.systemPackages = with pkgs; [
          desmume
          faugus-launcher
          mangohud
          prismlauncher
          protonup-qt
          rpcs3
          shadps4
          wine
          (wine.override { wineBuild = "wine64"; })
          wine64
          wineWowPackages.stable
          wineWowPackages.waylandFull
          winetricks
          xdelta
          xorg.xrandr
        ];
      };
  };
}
