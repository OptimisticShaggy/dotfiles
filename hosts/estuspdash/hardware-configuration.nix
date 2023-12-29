
{ config, lib, pkgs, ... }: 

{
  imports = [
    ../../networking/default.nix
    ../../networking/bluetooth.nix
    ../../networking/tailscale.nix
  ];

  config = {

    boot = {
      kernelPackages = pkgs.linuxKernel.packages.linux_rpi3;
      initrd = {
        availableKernelModules = [ "usbhid" "usb_storage" ];
      };
      loader = {
        grub.enable = false;
        generic-extlinux-compatible.enable = true;
      };
    };

    # hardware.enableRedistributableFirmware = true;
    powerManagement.cpuFreqGovernor = lib.mkDefault "ondemand";

    fileSystems = {
      "/" = {
        device = "/dev/disk/by-label/NIXOS_SD";
        fsType = "ext4";
      };
    };

    networking = {
      hostName = "estuspdash";
    };
  };
}