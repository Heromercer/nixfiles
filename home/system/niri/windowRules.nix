{
  programs.niri.settings.window-rules = [
    {
      matches = [
        {is-active = false;}
      ];
      excludes = [
        {app-id = "firefox";}
      ];
      opacity = 0.9;
    }

    {
      matches = [
        {app-id = "kitty";}
      ];
      draw-border-with-background = false;
    }

    {
      matches = [];
      geometry-corner-radius = {
        top-left = 12.0;
        top-right = 12.0;
        bottom-left = 12.0;
        bottom-right = 12.0;
      };
      clip-to-geometry = true;
    }

    {
      matches = [
        {app-id = "^org\\.gnome\\.";}
      ];
      draw-border-with-background = false;
      geometry-corner-radius = {
        top-left = 12.0;
        top-right = 12.0;
        bottom-left = 12.0;
        bottom-right = 12.0;
      };
      clip-to-geometry = true;
    }

    {
      matches = [
        {app-id = "org.quickshell$";}
      ];
      open-floating = true;
    }

    {
      matches = [
        {app-id = "firefox";}
        {app-id = "vesktop";}
      ];
      open-maximized = true;
      open-on-output = "DP-3";
    }

    {
      matches = [
        {title = "Steam";}
      ];
      open-maximized = true;
      open-on-output = "DP-1";
    }

    {
      matches = [
        {app-id = "steam";}
      ];
      excludes = [
        {title = "Steam";}
      ];
      open-floating = true;
      open-on-output = "DP-1";
    }
  ];
}
