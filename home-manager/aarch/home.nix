# This is your home-manager configuration file
# Use this to configure your home environment (it replaces ~/.config/nixpkgs/home.nix)

{ inputs, outputs, lib, config, pkgs, ... }: {
  # You can import other home-manager modules here
  imports = [
    # If you want to use modules your own flake exports (from modules/home-manager):
    # outputs.homeManagerModules.example

    # Or modules exported from other flakes (such as nix-colors):
    # inputs.nix-colors.homeManagerModules.default

    # You can also split up your configuration and import pieces of it here:
    # ./nvim.nix
  ];

  config = {

    nixpkgs = {
      config = {
        # Disable if you don't want unfree packages
        allowUnfree = true;
        # Workaround for https://github.com/nix-community/home-manager/issues/2942
        allowUnfreePredicate = (_: true);
      };
    };

    home = {
      username = "frame";
      homeDirectory = "/home/frame";
      packages = [
        pkgs.tree
        pkgs.psmisc
        pkgs.wget2
        pkgs.coreutils
        pkgs.duplicati
        pkgs.sops
        pkgs.ssh-to-age
        pkgs.ssh-to-pgp
        pkgs.age
        pkgs.htop
        pkgs.tailscale
        pkgs.yubico-pam
        pkgs.terminator
        pkgs.yubikey-agent
        pkgs.age-plugin-yubikey
        pkgs.pcsclite
        pkgs.gnupg
        pkgs.jmtpfs
        pkgs.parted
        pkgs.p7zip
        pkgs.nixos-generators
        pkgs.glances
       ];
      stateVersion = "23.11";
    };

    programs = {
      home-manager.enable = true;
      ssh.enable = true;
      git.enable = true;
    };

    # Nicely reload system units when changing configs
    systemd.user.startServices = "sd-switch";
  };
}

### Windows Vulnerabiltity
