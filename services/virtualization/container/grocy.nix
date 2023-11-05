{ config, pkgs, ... }

{
    containers.grocy = {
        privateNetwork = true;
        hostBridge = "tailscale0";
        localAddress = "10.231.137.2";
        config = { config, pkgs, ... }: {
            services.grocy = {
                hostName = "";  
            };
        };
    };
}