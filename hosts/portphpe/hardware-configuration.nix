
{ config, lib, pkgs, ... }: 

{

  imports = [
    ../../networking/default.nix
    ../../networking/tailscale.nix
    ../../networking/hidden_wifi_net.nix
    ../../networking/bluetooth.nix
  ];

  config = {
    boot = {
      loader = {
        systemd-boot.enable = true;
        efi.canTouchEfiVariables = true;
      };
      
      initrd = {
        availableKernelModules = [ "xhci_pci" "ahci" "usb_storage" "sd_mod" ];
        network.ssh.enable = true;
        kernelModules = [ ];
      };
    };
    fileSystems = {
      "/" = {
        device = "/dev/disk/by-label/root";
        fsType = "ext4";
      };
      "home" = {
        device = "/dev/disk/by-label/home";
        fsType = "ext4";
      };
      "boot" = {
        device = "/dev/disk/by-label/boot";
        fsType = "fat32";
      };
    };
    networking = {
      hostName = "portphpe";
    };
    
    hardware.cpu.amd.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
  };
}
