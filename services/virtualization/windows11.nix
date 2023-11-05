{ config, lib, pkgs, ... }: 

{
    virtualisation = {
        libvirtd.enable = true;
        libvirtd.qemu = {
            package = pkgs.qemu_kvm;
            runAsRoot = true;
            swtpm.enable = true;
            ovmf = {
                enable = true;
                packages = [
                    (import <nixpkgs> {}).ovmf.override {
                        secureBoot = true;
                        tpmSupport = true;
                    }
                ];
            };
        };
    };
}