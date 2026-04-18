{
  mercer.services.provides.tailscale = {
    nixos = {
      services.tailscale = {
        enable = true;
      };
    };
  };
}
