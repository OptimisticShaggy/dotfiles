{ inputs, outputs, lib, config, pkgs, ... }: 

{
  config = {
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
        pkgs.vscode-extensions.ms-vscode-remote.remote-ssh
        pkgs.vscode-extensions.maximedenes.vscoq
        pkgs.vscode-extensions.ms-python.python
        pkgs.vscode-extensions.jnoortheen.nix-ide
        pkgs.vscode-extensions.arrterian.nix-env-selector
        pkgs.vscode-extensions.ms-python.vscode-pylance
        #pkgs.vscode-extensions.ms-vscode-remote.remote-ssh-edit - Unavailable due to not in Nix Store.
        #pkgs.vscode-extensions.ms-vscode.remote-explorer - Unavailable due to not in Nix Store.
        pkgs.vscode-extensions.bbenoist.nix
        #pkgs.vscode-extensions.kelvin.vscode-sshfs - Unavailable due to not in Nix Store.
        #pkgs.vscode-extensions.yutengjing.vscode-archive - Unavailable due to not in Nix Store.
        pkgs.vscode-extensions.mkhl.direnv
        pkgs.qbittorrent
        pkgs.discord
        ];
    };

  };
}
