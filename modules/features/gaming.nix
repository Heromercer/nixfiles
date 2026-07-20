{ inputs, ... }:
{
  mercer.gaming = {
    nixos =
      {
        pkgs,
        lib,
        ...
      }:
      {
        nixpkgs.overlays = [ inputs.millennium.overlays.default ];
        programs.steam = {
          enable = true;
          gamescopeSession.enable = true;
          protontricks.enable = true;
          package = pkgs.millennium-steam;
          extraPackages = [
            pkgs.hidapi # for steam controller
          ];
        };

        hardware.steam-hardware.enable = true;

        programs.gamemode.enable = true;
        environment.systemPackages = with pkgs; [
          desmume
          dusklight # twilight princess emulator tool
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
