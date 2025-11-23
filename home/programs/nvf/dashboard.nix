{
  programs.nvf.settings.vim.utility = {
    snacks-nvim = {
      enable = true;

      setupOpts = {
        dashboard = {
          sections = [
            {
              section = "header";
              padding = 3;
            }
            {
              icon = " ";
              key = "f";
              desc = "Find File";
              action = ":Telescope find_files";
              padding = 1;
            }
            {
              icon = "";
              key = "n";
              desc = "New File";
              action = ":ene | startinsert";
              padding = 1;
            }
            {
              icon = " ";
              key = "g";
              desc = "Find Text";
              action = ":lua Snacks.dashboard.pick('live_grep')";
              padding = 1;
            }
            {
              icon = " ";
              key = "r";
              desc = "Recent Files";
              action = ":lua Snacks.dashboard.pick('oldfiles')";
              padding = 1;
            }
            {
              icon = "󰠮";
              key = "i";
              desc = "Neorg Index";
              action = ":Neorg index";
              padding = 1;
            }
            {
              icon = "󰍃";
              key = "q";
              desc = "Quit";
              action = ":qa";
              padding = 2;
            }
            {
              icon = " ";
              title = "Projects";
              section = "projects";
              indent = 2;
            }
            {
              padding = [0 2];
              footer = "Don't you dare go hollow.";
            }
          ];
        };
      };
    };
  };
}
