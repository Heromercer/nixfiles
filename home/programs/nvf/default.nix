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
      vim.theme = {
        enable = true;
        name = "catppuccin";
        style = "mocha";
      };

      vim.treesitter.enable = true;

      vim.lsp = {
        enable = true;
        formatOnSave = true;
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

      vim.ui = {
        noice.enable = true;
      };

      vim.statusline.lualine.enable = true;
      vim.autocomplete.nvim-cmp.enable = true;
    };
  };
}
