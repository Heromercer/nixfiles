{
  config,
  pkgs,
  ...
}: {
  programs.fish.enable = true;
  users = {
    defaultUserShell = pkgs.fish;

    users.alec = {
      isNormalUser = true;
      extraGroups = ["wheel"];
      packages = with pkgs; [
        tree
      ];
    };
  };
}

