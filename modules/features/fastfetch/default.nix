{
  mercer.fastfetch = {
    homeManager = {
      programs.fastfetch = {
        enable = true;
      };
      xdg.configFile."fastfetch/config.jsonc".source = ./_config.jsonc;
    };
  };
}
