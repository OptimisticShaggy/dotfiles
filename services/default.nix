{ inputs, outputs, config, ...}:

{
  imports = [
    ./syncthing.nix
    ./printing.nix
  ];
}