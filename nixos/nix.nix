{
  config,
  inputs,
  pkgs,
  ...
}:
let
  autoGarbageCollector = config.var.autoGarbageCollector;
in
{
  nixpkgs.config = {
    allowUnfree = true;
    allowBroken = false;
  };

  nix = {
    settings = {
      auto-optimise-store = true;
      experimental-features = [
        "nix-command"
        "flakes"
      ];
    };
    gc = {
      automatic = autoGarbageCollector;
      persistent = true;
      dates = "weekly";
      options = "--delete-older-than 7d";
    };
  };

  programs.nix-ld.enable = true;
  programs.nix-ld.libraries = with pkgs; [
  ];
}
