
{ config, lib, pkgs, ... }: 

{
  imports = [
    ../../networking/default.nix
    ../../networking/bluetooth.nix
    ../../networking/tailscale.nix
  ];

  config = {

    boot = {
      kernelPackages = pkgs.linuxKernel.packages.linux_rpi4;
      initrd = {
        availableKernelModules = [ "xhci_pci" "usbhid" "usb_storage" ];
        network.ssh.enable = true;
      };
      loader = {
        grub.enable = false;
        generic-extlinux-compatible.enable = true;
      };
    };

    hardware.enableRedistributableFirmware = true;

    fileSystems = {
      "/" = {
        device = "/dev/disk/by-label/NIXOS_SD";
        fsType = "ext4";
        options = [ "noatime" ];
      };
    };

    networking = {
      hostName = "estuspdash";
    };
      
    # Set your system kind (needed for flakes)
    nixpkgs.hostPlatform = "aarch64-linux";
  };
}