{pkgs, profiles, ...}:
{
    imports = 
    [
        profiles.environment.desktop.gnome.default
    ];

    services.xserver.displayManager = {
        job.preStart = "sleep 5";
        autoLogin.enable = true;
        autoLogin.user = "francisco";
    };
}