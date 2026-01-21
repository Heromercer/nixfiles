{
  inputs,
  ...
}:
{
  imports = [
    inputs.nvf.homeManagerModules.default

    ./dashboard.nix
    ./notes.nix
    ./options.nix
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

        autocomplete = {
          nvim-cmp = {
            enable = true;
            sources = {
              nvim_lsp = "[LSP]";
              path = "[Path]";
              buffer = "[Buffer]";
              treesitter = "[Treesitter]";
            };
          };
        };

        binds = {
          whichKey.enable = true;
        };

        clipboard = {
          enable = true;
          registers = "unnamedplus";
        };

        comments.comment-nvim = {
          enable = true;
        };

        git.gitsigns.enable = true;

        formatter = {
          conform-nvim.enable = true;
        };

        languages = {
          nix.enable = true;
          markdown.enable = true;
          python.enable = true;
        };

        lsp = {
          enable = true;
          formatOnSave = true;
        };

        searchCase = "smart";

        statusline.lualine.enable = true;

        tabline = {
          nvimBufferline = {
            enable = true;
            mappings = {
              cycleNext = "<S-l>";
              cyclePrevious = "<S-h>";
              closeCurrent = "<leader>bd";
            };
          };
        };

        telescope = {
          enable = true;
        };

        theme = {
          enable = true;
          name = "catppuccin";
          style = "mocha";
        };

        treesitter = {
          enable = true;
          indent.enable = false;
        };

        ui = {
          noice.enable = true;
        };

        undoFile.enable = true;

        terminal.toggleterm = {
          enable = true;
          mappings = {
            open = "<c-/>";
          };
          setupOpts = {
            direction = "float";
          };
          lazygit.enable = true;
        };

        utility = {
          yazi-nvim.enable = true;
        };
      };
    };
  };
}
