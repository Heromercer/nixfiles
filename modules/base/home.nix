{ config, ... }:
{
  flake.homeModules.base =
    { config, pkgs, ... }:
    {
      home.username = "alec";
      home.homeDirectory = "/home/alec";
      home.stateVersion = "25.05";
    };
}
