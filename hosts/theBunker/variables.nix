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

    password = "$y$j9T$D1J7uKkSYEh78Cteb0E/x0$kFPnCCE5MR.St6JXm6L1U4ma4jkROxI3uOeJDKJj4TD";

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
