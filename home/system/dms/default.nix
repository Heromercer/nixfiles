{
  pkgs,
  config,
  inputs,
  ...
}: {
  imports = [
    inputs.dankMaterialShell.homeModules.dankMaterialShell.default
    inputs.dankMaterialShell.homeModules.dankMaterialShell.niri
  ];

  programs.dankMaterialShell = {
    enable = true;
    quickshell.package = inputs.nixpkgs-unstable.legacyPackages.x86_64-linux.quickshell;
    plugins = {
      PowerUsage.src = "${inputs.dankMaterialShell}/PLUGINS/PowerUsage";
    };
  };
}
