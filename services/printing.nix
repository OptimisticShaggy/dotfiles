{ config, lib, pkgs, ... }:

{
  # Enable zero-configuration to be able to discover network printers.
  services.avahi = {
    enable = false;
    nssmdns = true;
  };

  # Enable CUPS to print documents.
  services.printing = {
    enable = true;
    drivers = with pkgs; [ hplipWithPlugin ];
  };

  programs.system-config-printer.enable = true;
}