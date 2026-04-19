{
  mercer.starship = {
    homeManager = {
      programs.starship = {
        enable = true;
        enableFishIntegration = true;
        settings = {
          add_newline = false;
          format = "╭─ $os$directory$git_branch\n╰─$character";
          os = {
            disabled = false;
            style = "bold blue";
            symbols = {
              NixOS = " ";
            };
          };
          directory = {
            truncation_length = 4;
            truncation_symbol = "../";
          };
        };
      };
    };
  };
}
