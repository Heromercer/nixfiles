{config, ...}: {
  programs.git = {
    enable = true;
    userName = "alec";
    userEmail = "150299829+Heromercer@users.noreply.github.com";
    extraConfig = {
      init.defaultBranch = "main";
      pull.rebase = "false";
    };
  };
}
