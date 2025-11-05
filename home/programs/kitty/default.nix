{
  programs.kitty = {
    enable = true;
    settings = {
      scrollback_lines = 1000;
      enable_audio_bell = false;
      confirm_os_window_close = "0";
      cursor_shape = "Underline";
      bold_font = "auto";
      italic_font = "auto";
      bold_italic_fomt = "auto";
    };
    font = {
      name = "JetBrainsMono Nerd Font";
      size = 12;
    };
    extraConfig = ''
      include dank-tabs.conf
      include dank-theme.conf
    '';
  };
}
