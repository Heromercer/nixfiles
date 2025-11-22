{pkgs, ...}: {
  home.pointerCursor = {
    package = pkgs.catppuccin-cursors.latteLight;
    name = "catppuccin-latte-light-cursors";
    gtk.enable = true;
    x11.enable = true;
    size = 24;
  };
}
