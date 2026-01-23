{
  config,
  pkgs,
  ...
}:
{
  programs.steam = {
    enable = true;
    gamescopeSession.enable = true;
  };

  programs.gamemode.enable = true;

  environment.systemPackages = with pkgs; [
    faugus-launcher
    mangohud
    protontricks
    wineWowPackages.waylandFull
    winetricks
  ];
}
