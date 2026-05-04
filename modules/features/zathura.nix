{
  mercer.zathura = {
    homeManager = {
      programs.zathura = {
        enable = true;
      };
      xdg.mimeApps.defaultApplications = {
        "application/pdf" = [ "zathura.desktop" ];
      };
    };
  };
}
