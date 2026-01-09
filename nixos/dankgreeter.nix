{
  inputs,
  config,
  ...
}: {
  imports = [
    inputs.dms.nixosModules.greeter
  ];
  programs.dank-material-shell.greeter = {
    enable = true;
    compositor.name = "niri";
    configHome = "/home/alec";
    quickshell.package = inputs.nixpkgs-unstable.legacyPackages.x86_64-linux.quickshell;
  };
}
