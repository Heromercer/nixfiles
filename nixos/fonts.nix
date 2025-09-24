{ pkgs, ... }:
{
  fonts = {
    packages = with pkgs; [
      roboto
      work-sans
      noto-fonts
      noto-fonts-cjk-sans
      noto-fonts-emoji
      nerd-fonts.fira-code
      nerd-fonts.jetbrains-mono
    ];
  };
}
