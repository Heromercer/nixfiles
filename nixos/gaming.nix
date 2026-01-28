{
  config,
  pkgs,
  ...
}:
{
  programs.steam = {
    enable = true;
    gamescopeSession.enable = true;
    protontricks.enable = true;
  };

  programs.gamemode.enable = true;

  environment.systemPackages = with pkgs; [
    faugus-launcher
    mangohud
    protonup-qt
    wine
    (wine.override { wineBuild = "wine64"; })
    wine64
    wineWowPackages.stable
    wineWowPackages.waylandFull
    winetricks
    xdelta
  ];
}
