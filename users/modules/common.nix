{config, ...}: {
  imports = [
    ./programs
    ./services
    ./desktops
    ./themes
    ./keybinds
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

    home.sessionVariables = {
      # config directory for nh
      NH_FLAKE = "${config.home.homeDirectory}/Config/nixos";

      # TODO: Change default graphical and TUI editor with nvim?

      # VISUAL = "${config.programs.emacs.package}/bin/emacsclient";
      # EDITOR = "${config.programs.emacs.package}/bin.emacsclient -nw";
    };
  };
}
