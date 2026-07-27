{
  mercer.services.provides.qbittorrent = {
    nixos =
      { pkgs, ... }:
      {
        services.qbittorrent = {
          enable = true;
        };
        environment.systemPackages = with pkgs; [
          qbittorrent
        ];
      };
  };
}
