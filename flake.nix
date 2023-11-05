{
  description = "Primary Nix Configurations";

  inputs = {
    # Nixpkgs
    nixpkgs.url = "github:nixos/nixpkgs/nixos-23.05";
    # You can access packages and modules from different nixpkgs revs
    # at the same time. Here's an working example:
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";
    
    # Home manager
    
    home-manager = {
      url = "github:nix-community/home-manager/release-23.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    
    nixos-generators = {
      url = "github:nix-community/nixos-generators";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    
    nix-colors = {
      url = "github:misterio77/nix-colors";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    
    sops-nix = {
      url = "github:Mic92/sops-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager,  nixos-generators, sops-nix, ...}@inputs:
    let
      inherit (self) outputs;
      forAllSystems = nixpkgs.lib.genAttrs [
        "aarch64-linux"
        "i686-linux"
        "x86_64-linux"
        "aarch64-darwin"
        "x86_64-darwin"
      ];
    in
    rec {
    
      # NixOS Modules

      nixosModules = {
        aarch64-linux = {config, ... }: {
          imports = [
            nixos-generators.nixosModules.all-formats
          ];
          nixpkgs.hostPlatform = "aarch64-linux";
        };
        
        x86_64-linux = {config, ... }: {
          imports = [
            nixos-generators.nixosModules.all-formats
          ];
          nixpkgs.hostPlatform = "x86_64-linux";
        };

        shared = {config, ... }: {
          imports = [ 
            ./secrets/default.nix
          ];
        };

        virtualization = {config, ... }: {
            imports = [
                ./services/virtualization/default.nix
                ./services/virtualization/waydroid.nix
            ];
        };
        
      };

      # NixOS Configurations

      nixosConfigurations = {
        
        estushlpse = nixpkgs.lib.nixosSystem {
          specialArgs = { inherit inputs outputs; };
          
          modules = [
            # > Our main nixos configuration file <
            ./hosts/default.nix
            ./hosts/estushlpse/configuration.nix
            #vscode-server.nixosModules.default
            self.nixosModules.virtualization
            self.nixosModules.x86_64-linux
            self.nixosModules.shared
            home-manager.nixosModules.home-manager {
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;
              home-manager.users.frame = {
                imports = [
                  ./home-manager/home.nix
                  ./home-manager/desktop.nix
                ];
              };
            }
          ];
        };
      
        estuspdash = nixpkgs.lib.nixosSystem {
          specialArgs = { inherit inputs outputs; };
          
          modules = [
            # > Our main nixos configuration file <
            ./hosts/default.nix
            ./hosts/estuspdash/configuration.nix
            self.nixosModules.aarch64-linux
            self.nixosModules.shared
            home-manager.nixosModules.home-manager {
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;
              home-manager.users.frame = {
                imports = [
                  ./home-manager/aarch/home.nix
                  ./home-manager/aarch/desktop.nix
                ];
              };
            }
          ];
        };
        
      };
    };
}