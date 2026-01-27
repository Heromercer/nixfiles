{
  config,
  pkgs,
  ...
}:
{
  fileSystems = {
    "/mnt/gamesHDD" = {
      device = "/dev/disk/by-uuid/0d946588-87ee-45d0-8b4f-2214199cd264";
      fsType = "ext4";
      options = [
        "defaults"
        "nofail"
      ];
    };

    "/mnt/archive" = {
      device = "/dev/disk/by-uuid/2b318b3c-5cff-4c00-84a7-0a10fb310058";
      fsType = "ext4";
      options = [
        "defaults"
        "nofail"
      ];
    };

    "/mnt/media" = {
      device = "/dev/disk/by-uuid/fbbe779f-985b-4a97-b8f6-fbb37eb0dc43";
      fsType = "ext4";
      options = [
        "defaults"
        "nofail"
      ];
    };
  };
}
