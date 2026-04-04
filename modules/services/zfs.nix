{
  mercer.services.provides.zfs = {
    nixos = {
      services.zfs = {
        autoScrub.enable = true;
        trim.enable = true;
      };
    };
  };
}
