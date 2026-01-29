{
  config,
  lib,
  ...
}: {
  config.var = {
    hostname = "majula";
    username = "alec";

    location = "Boston";
    timeZone = "America/New_York";

    password = "$y$j9T$D1J7uKkSYEh78Cteb0E/x0$kFPnCCE5MR.St6JXm6L1U4ma4jkROxI3uOeJDKJj4TD";

    hostId = "3bf2b882";

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
