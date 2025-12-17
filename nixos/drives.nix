{
  config,
  pkgs,
  ...
}: {
  fileSystems = {
    "/mnt/gamesHDD" = {
      device = "/dev/disk/by-uuid/0d946588-87ee-45d0-8b4f-2214199cd264";
      fsType = "ext4";
      options = ["defaults" "nofail"];
    };

    "/mnt/archive" = {
      device = "/dev/disk/by-uuid/2b318b3c-5cff-4c00-84a7-0a10fb310058";
      fsType = "ext4";
      options = ["defaults" "nofail"];
    };

    "/mnt/media" = {
      device = "/dev/disk/by-uuid/2AB838C3B8388F77";
      fsType = "ntfs-3g";
      options = ["rw" "uid=1000" "gid=100" "nofail"];
    };
  };
}
