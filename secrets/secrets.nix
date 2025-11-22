let
  firelink = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAINqiIbjHHUjJbwFoguYYZiOSgf+HQ6ZtPc2Wx3lJgPGL";
in {
  "secrets1.age".publicKeys = [firelink];
}
