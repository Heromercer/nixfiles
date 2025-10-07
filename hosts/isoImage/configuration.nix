{
  pkgs,
  modulesPath,
  ...
}: {
  imports = [
    "${modulesPath}/installer/cd-dvd/installation-cd-minimal.nix"
  ];

  environment.systemPackages = with pkgs; [
    neovim
    disko
    git
    cfdisk
  ];

  nix.settings.experimental-features = ["nix-command" "flakes"];

  nixpkgs.hostPlatform = "x86_64-linux";
}
