{ inputs, outputs, lib, config, pkgs, nixpkgs, ... }:
{
  imports = [
    ./vpsadminos.nix

    ../../services/virtualization/default.nix
    ../../services/virtualization/waydroid.nix
  ];

  config = {
    system.stateVersion = "23.11";
    
    nixpkgs = {
    # Configure your nixpkgs instance
      config = {
        # Disable if you don't want unfree packages
        allowUnfree = true;
      };
    };

    nix = {
      # This will add each flake input as a registry
      # To make nix3 commands consistent with your flake
      registry = lib.mapAttrs (_: value: { flake = value; }) inputs;

      # This will additionally add your inputs to the system's legacy channels
      # Making legacy nix commands consistent as well, awesome!
      nixPath = lib.mapAttrsToList (key: value: "${key}=${value.to.path}") config.nix.registry;

      settings = {
        # Enable flakes and new 'nix' command
        experimental-features = "nix-command flakes";
        # Deduplicate and optimize nix store
        auto-optimise-store = true;
      };
    };
    
    services = {
      openssh = {
        settings.PermitRootLogin = "yes";
      };
      tailscale = {
        useRoutingFeatures = "both";
      };
    };

    systemd.extraConfig = ''
      DefaultTimeoutStartSec=900s
    '';

    time.timeZone = "Europe/Amsterdam";

  };
}
