{ config, ... }:

{
  services = {
      tailscale = {
        enable = true;
        permitCertUid = "OptimisticShaggy@github";
      };
  };
}