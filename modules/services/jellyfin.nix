{
  mercer.services.provides.jellyfin = {
    nixos = {
      services.jellyfin = {
        enable = true;
        openFirewall = true;
      };
    };
  };
}
