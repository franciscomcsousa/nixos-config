{pkgs, profiles, ...}:
{
    imports = 
    [
        profiles.environment.desktop.gnome.default
    ];

    services.displayManager = {
        preStart = "sleep 5";
        autoLogin.enable = true;
        autoLogin.user = "francisco";
        
    };
    services.xserver.displayManager.gdm.wayland = false;
}
