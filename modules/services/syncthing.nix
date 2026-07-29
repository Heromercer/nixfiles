{
  mercer.services.provides.syncthing = {
    nixos = {
      services.syncthing = {
        enable = true;
        openDefaultPorts = true;
        user = "alec";
        group = "users";
        configDir = "/home/alec/.config/syncthing";
        overrideDevices = true;
        overrideFolders = true;
      };
    };
  };
}
