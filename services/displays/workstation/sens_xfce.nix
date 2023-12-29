{ config, pkgs, lib, ... }:

{
  gtk = {
    enable = true;
      iconTheme = {
      name = "elementary-Xfce-dark";
      package = pkgs.elementary-xfce-icon-theme;
    };
    theme = {
      name = "zukitre-dark";
      package = pkgs.zuki-themes;
    };
    gtk3.extraConfig = {
      Settings = ''
        gtk-application-prefer-dark-theme=1
      '';
    };
    gtk4.extraConfig = {
      Settings = ''
        gtk-application-prefer-dark-theme=1
      '';
    };
  };

  hardware = {
    pulseaudio.enable = false;
  };

  programs = {
    dconf.enable = true;
    thunar = {
      enable = true;
      plugins = with pkgs.xfce; [
        thunar-archive-plugin
        thunar-media-tags-plugin
        thunar-volman
      ];
    };
  };

  services = {
    blueman.enable = true;
    pipewire = {
      enable = true;
      alsa = {
        enable = true;
        support32Bit = true;
      };
      pulse.enable = true;
    };
    xserver = {
      enable = true;
      excludePackages = with pkgs; [
        xterm
      ];
      displayManager = {
        lightdm = {
          enable = true;
          greeters.slick = {
            enable = true;
            theme.name = "Zukitre-dark";
          };
        };
      };
      desktopManager.xfce.enable = true;
    };
  };

  sound = {
    enable = true;
    mediaKeys.enable = true;
  };
}