{
  config,
  pkgs,
  ...
}: {
  xdg.userDirs = {
    createDirectories = true;
    documents = "${config.home.homeDirectory}/Documents";
  };
}
