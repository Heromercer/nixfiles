{
  pkgs,
  config,
  lib,
  ...
}: {
  programs.nvf = {
    enable = true;
    settings = {
      vim.theme = {
        enable = true;
        name = "catppuccin";
        style = "mocha";
      };

      vim.lsp = {
        enable = true;
        formatOnSave = true;
      };

      vim.languages = {
        nix.enable = true;
        nix.format.enable = true;
      };

      vim.statusline.lualine.enable = true;
      vim.autocomplete.nvim-cmp.enable = true;
    };
  };
}
