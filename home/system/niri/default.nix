{
  pkgs,
  inputs,
  ...
}: {
  imports = [
    inputs.niri.homeModules.config
  ];
}
