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

    "/mnt/nvme1" = {
      device = "/dev/disk/by-uuid/1cc34972-f2a2-45ca-a685-ad1ad611603e";
      fsType = "ext4";
      options = ["defaults" "nofail"];
    };

    "/mnt/nvme2" = {
      device = "/dev/disk/by-uuid/1b173f9a-8f25-45b5-95f2-cb36e131b6d7";
      fsType = "ext4";
      options = ["defaults" "nofail"];
    };

    "/mnt/nvme3" = {
      device = "/dev/disk/by-uuid/96172ded-e955-450c-a9c6-9b2a42812088";
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
