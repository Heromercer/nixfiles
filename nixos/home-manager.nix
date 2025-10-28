{
  inputs,
  nixpkgs-unstable,
  ...
}: {
  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    backupFileExtension = "backup";
    extraSpecialArgs = {
      inherit inputs;
      pkgs-unstable = import nixpkgs-unstable {
        system = "x86_64-linux";
        config.allowUnfree = true;
      };
    };
  };
}
