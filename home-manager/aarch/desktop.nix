{ inputs, outputs, lib, config, pkgs, ... }: 

{
  config = {
    services.flameshot = {
      enable = true;
    };
    
    home = {
      packages = [
        pkgs.psmisc
        pkgs.duplicati
        pkgs.firefox
        pkgs.virt-manager
        pkgs.thunderbird
        pkgs.syncthing
        pkgs.yubioath-flutter
        pkgs.yubikey-touch-detector
        pkgs.yubikey-personalization-gui
        pkgs.yubikey-manager-qt
        pkgs.yubico-piv-tool
        pkgs.yubikey-manager
        pkgs.gimp-with-plugins
        pkgs.vscodium-fhs
        pkgs.vscode-extensions.maximedenes.vscoq
        pkgs.vscode-extensions.jnoortheen.nix-ide
        pkgs.vscode-extensions.arrterian.nix-env-selector
        pkgs.vscode-extensions.ms-python.vscode-pylance
        pkgs.vscode-extensions.bbenoist.nix
        pkgs.vscode-extensions.mkhl.direnv
        #pkgs.qbittorrent - Don't Need!
        #pkgs.discord - Not Available...
        ];
    };

  };
}
