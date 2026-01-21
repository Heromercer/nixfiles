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
    ./tabline.nix
    ./terminal.nix
    ./theme.nix
  ];
  programs.nvf = {
    enable = true;
    settings = {
      vim = {
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

        telescope = {
          enable = true;
        };

        treesitter = {
          enable = true;
          indent.enable = false;
        };

        ui = {
          noice.enable = true;
        };

        undoFile.enable = true;

        utility = {
          yazi-nvim.enable = true;
        };
      };
    };
  };
}
