{
  programs.nvf.settings.vim.notes = {
    neorg = {
      enable = true;
      treesitter.enable = true;
      setupOpts = {
        load = {
          "core.defaults".enable = true;
          "core.keybinds".enable = true;
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
}
