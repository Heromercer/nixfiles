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
    wineWowPackages.stable
    wineWowPackages.waylandFull
    winetricks
    xdelta
  ];
}
