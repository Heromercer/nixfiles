{
  mercer.gaming = {
    nixos =
      { pkgs, lib, ... }:
      {
        programs.steam = {
          enable = true;
          gamescopeSession.enable = true;
          protontricks.enable = true;
          extraPackages = [
            pkgs.hidapi # for steam controller
          ];
        };
        programs.gamemode.enable = true;
        environment.systemPackages = with pkgs; [
          desmume
          mangohud
          mgba
          prismlauncher
          protonup-qt
          (rpcs3.overrideAttrs (prev: {
            cmakeFlags = prev.cmakeFlags ++ [ (lib.cmakeBool "BUILD_SHARED_LIBS" false) ];
          }))
          shadps4
          wine
          (wine.override { wineBuild = "wine64"; })
          wine64
          wineWow64Packages.stable
          wineWow64Packages.waylandFull
          winetricks
          xdelta
          xrandr
        ];
      };
  };
}
