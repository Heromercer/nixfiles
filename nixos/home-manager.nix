{
  inputs,
  nixpkgs-unstable,
  ...
}: {
  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    backupFilExtension = "backup";
    extraSpecialArgs = {
      inherit inputs;
      pkgs-unstable = import nixpkgs-unstable {
        system = "x86_64-linux";
        config.allowUnfree = true;
      };
    };
  };
}
