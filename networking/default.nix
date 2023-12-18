{ config, pkgs, ... }:

{
  imports = [
    ./ssh.nix
  ];
  
  networking = {
      firewall = {
        checkReversePath = "loose";
        enable = true;
      };
  };
}