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
    protontricks
    protonup-qt
    wineWowPackages.waylandFull
    winetricks
    xdelta
  ];
}
