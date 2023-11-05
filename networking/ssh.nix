{ config, ... }:

{
  services.openssh = {
    enable = true;
    banner = "Welcome to Server! :\)";
    settings.X11Forwarding = true;
  };
}