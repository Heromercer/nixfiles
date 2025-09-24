{
  security.rtkit.enable = true;
  services.pulseaudio.enable = false;

  services.pipewire = {
    enable = true;
    alsa.enable = true;
    #alsa.support32bit = true;
    pulse.enable = true;
    jack.enable = true;
  };
}
