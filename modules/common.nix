{config, ...}:
# MODULE ROOT AND UNIVERSAL CONFIGURATION
{
  imports = [
    ./programs
    ./desktops
  ];

  config = {
    nixpkgs = {
      config = {
        allowUnfree = true;
        allowUnfreePredicate = _: true;
      };
    };

    # enable home-manager (needs bootstrap)
    programs.home-manager.enable = true;

    # reload systemd units on home-manager switch
    systemd.user.startServices = "sd-switch";

    # default applications
    xdg.mimeApps.enable = true;
  };
}
