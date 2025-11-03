{
  pkgs,
  config,
  lib,
  inputs,
  ...
}: {
  imports = [
    inputs.nvf.homeManagerModules.default
  ];
  programs.nvf = {
    enable = true;
    settings = {
      vim = {
        assistant = {
          codecompanion-nvim.enable = true;
        };

        autopairs = {
          nvim-autopairs.enable = true;
        };

        autocomplete.nvim-cmp.enable = true;

        binds = {
          whichKey.enable = true;
        };

        clipboard = {
          enable = true;
        };

        dashboard = {
          alpha = {
            enable = false;
          };
        };

        formatter = {
          conform-nvim.enable = true;
        };

        languages = {
          nix.enable = true;
          markdown.enable = true;
          python.enable = true;
          nix.format.enable = true;
        };

        lsp = {
          enable = true;
          formatOnSave = true;
        };

        notes = {
          neorg = {
            enable = true;
            treesitter.enable = true;
            setupOpts = {
              load = {
                "core.defaults".enable = true;
                "core.concealer".config = {
                  folds = true;
                  icon_preset = "basic";
                };
                "core.dirman".config = {
                  workspaces = {
                    notes = "~/Documents/wiki";
                  };
                  default_workspace = "notes";
                };
              };
            };
          };
        };

        options = {
          signcolumn = "yes";
          termguicolors = true;
          conceallevel = 2;
        };

        searchCase = "smart";

        statusline.lualine.enable = true;

        tabline = {
          nvimBufferline.enable = true;
        };

        telescope = {
          enable = true;
        };

        theme = {
          enable = true;
          name = "catppuccin";
          style = "mocha";
        };

        treesitter.enable = true;

        ui = {
          noice.enable = true;
        };

        undoFile.enable = true;

        terminal.toggleterm = {
          enable = true;
          lazygit.enable = true;
        };

        utility = {
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
          yazi-nvim.enable = true;
        };
      };
    };
  };
}
