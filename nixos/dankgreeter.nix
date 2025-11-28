{
  inputs,
  config,
  ...
}: {
  imports = [
    inputs.dankMaterialShell.nixosModules.greeter
  ];
  programs.dankMaterialShell.greeter = {
    enable = true;
    compositor.name = "niri";
    configHome = "/home/alec";
    quickshell.package = inputs.nixpkgs-unstable.legacyPackages.x86_64-linux.quickshell;
  };
}
