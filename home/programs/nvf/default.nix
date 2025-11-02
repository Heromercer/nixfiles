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
    enable = false;
    settings = {
      vim.theme = {
        enable = true;
        name = "catppuccin";
        style = "mocha";
      };

      vim.options = {
        signcolumn = "yes";
        termguicolors = true;
      };

      vim.autopairs = {
        nvim-autopairs.enable = true;
      };

      vim.clipboard = {
        enable = true;
      };

      vim.undoFile.enable = true;

      vim.searchCase = "smart";

      vim.dashboard = {
        alpha = {
          enable = false;
        };
      };

      vim.formatter = {
        conform-nvim.enable = true;
      };

      vim.treesitter.enable = true;

      vim.lsp = {
        enable = true;
        formatOnSave = true;
      };

      vim.tabline = {
        nvimBufferline.enable = true;
      };

      vim.languages = {
        nix.enable = true;
        markdown.enable = true;
        python.enable = true;
        nix.format.enable = true;
      };

      vim.assistant = {
        codecompanion-nvim.enable = true;
      };

      vim.notes = {
        neorg.enable = true;
      };

      vim.ui = {
        noice.enable = true;
      };

      vim.utility = {
        snacks-nvim = {
          enable = true;
          setupOpts = {
          };
        };
        yazi-nvim.enable = true;
      };

      vim.statusline.lualine.enable = true;
      vim.autocomplete.nvim-cmp.enable = true;
    };
  };
}
