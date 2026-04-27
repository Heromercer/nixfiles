{
  mercer.kdeConnect = {
    nixos =
      { pkgs, ... }:
      {
        programs.kdeconnect = {
          enable = true;
          package = pkgs.valent;
        };
      };
  };
}
