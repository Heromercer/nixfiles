{
  config,
  lib,
  ...
}: {
  config.var = {
    hostname = "The-Bunker";
    username = "alec";

    location = "Boston";
    timeZone = "America/New_York";

    autoUpgrade = false;
    autoGarbageCollector = true;
  };

  options = {
    var = lib.mkOption {
      type = lib.types.attrs;
      default = {};
    };
  };
}
