{ den, __findFile, ... }:
{
  mercer = {
    desktop.includes = [
      <mercer/appimage>
      <mercer/audio>
      <mercer/bluetooth>
      <mercer/discord>
      <mercer/fastfetch>
      <mercer/firefox>
      <mercer/gaming>
      <mercer/hardware>
      <mercer/imv>
      <mercer/mpv>
      <mercer/services/mysql>
      <mercer/services/udisks>
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
  };
}
