{
  mercer.services.provides.power-mngmt = {
    nixos = {
      services = {
        tuned.enable = true;
        upower.enable = true;
      };
    };
  };
}
