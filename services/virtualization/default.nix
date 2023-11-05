{ config, lib, pkgs, ... }: 

{

    config = {
      networking.nat = {
        enable = true;
        internalInterfaces = ["vb-+"];
        externalInterface = "tailscale0";
        # Lazy IPv6 connectivity for the container
        enableIPv6 = true;
      };

      boot = {
        binfmt = {
          emulatedSystems = [
            "x86_64-windows"
            "aarch64-linux"
          ];
        };
      };

      environment = {
        systemPackages = [
          pkgs.spice-gtk
          pkgs.qemu
        ];
      };
      
      virtualisation = {
        libvirtd = {
          enable = true;
          onShutdown = "suspend";
        };
      };

      programs.dconf.enable = true;
    };
  }