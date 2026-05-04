{ den, __findFile, ... }:
{
  mercer = {
    desktop.includes = [
      <mercer/appimage>
      <mercer/audio>
      <mercer/bluetooth>
      <mercer/discord>
      <mercer/fastfetch>
      <mercer/gaming>
      <mercer/hardware>
      <mercer/imv>
      <mercer/mpv>
      <mercer/plymouth>
      <mercer/services/mysql>
      <mercer/services/tailscale>
      <mercer/services/udisks>
      <mercer/services/vpn>
      <mercer/services/zfs>
      <mercer/xdg>
    ];
    laptop.includes = [
      <mercer/appimage>
      <mercer/audio>
      <mercer/bluetooth>
      <mercer/discord>
      <mercer/fastfetch>
      <mercer/firefox>
      <mercer/imv>
      <mercer/mpv>
      <mercer/services/power-mngmt>
      <mercer/services/udisks>
      <mercer/xdg>
    ];
    server.includes = [
      <mercer/services/navidrome>
      <mercer/services/tailscale>
    ];
  };
}
