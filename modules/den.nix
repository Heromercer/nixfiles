{
  inputs,
  den,
  lib,
  ...
}:
{
  _module.args.__findFile = den.lib.__findFile;

  imports = [
    inputs.den.flakeModule
    (inputs.den.namespace "mercer" false)
  ];

  systems = import inputs.systems;

  den.schema.user.classes = lib.mkDefault [ "homeManager" ];

  den.schema.user.includes = [ den._.mutual-provider ];

  den.schema.hm-host.nixos.home-manager.useGlobalPkgs = true;
  den.schema.hm-host.nixos.home-manager.useUserPackages = true;
  den.schema.hm-host.nixos.home-manager.backupFileExtension = "backup";
}
