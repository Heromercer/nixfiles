let
  firelink = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAINqiIbjHHUjJbwFoguYYZiOSgf+HQ6ZtPc2Wx3lJgPGL";
  tower = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIJzzP5Z39ueSDJAp/UuSaN45j+kXaZ8NsNmEGRyMbkoW";
in
{
  "cloudflare-api-key.age".publicKeys = [
    tower
    firelink
  ];
}
