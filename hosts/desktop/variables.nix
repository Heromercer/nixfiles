{ config, lib, ... }: {

  config.var = {
    hostname = "The-Bunker";
    username = "alec";
  };

  options = {
    var = lib.mkOption {
      type = lib.types.attrs;
      default = {};
    };
  };
}
