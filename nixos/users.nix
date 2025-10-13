{
  config,
  pkgs,
  ...
}: let
  username = config.var.username;
in {
  programs.fish.enable = true;
  users = {
    defaultUserShell = pkgs.fish;

    users.${username} = {
      isNormalUser = true;
      extraGroups = ["networkmanager" "wheel"];
      hashedPassword = config.var.password;
    };
  };
}
