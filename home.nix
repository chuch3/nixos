{
    config,
    pkgs,
    ...
}: {
    home.username = "chu";
    home.homeDirectory = "/home/chu";

    # Import files from the current configuration directory into the Nix store,
    # and create symbolic links pointing to those store files in the Home directory.

    # home.file.".config/i3/wallpaper.jpg".source = ./wallpaper.jpg;

    # Import the scripts directory into the Nix store,
    # and recursively generate symbolic links in the Home directory pointing to the files in the store.
    # home.file.".config/i3/scripts" = {
    #   source = ./scripts;
    #   recursive = true;   # link recursively
    #   executable = true;  # make all files executable
    # };

    # encode the file content in nix configuration file directly
    # home.file.".xxx".text = ''
    #     xxx
    # '';

    # Packages that should be installed to the user profile.
    home.packages = with pkgs; [
        # here is some command line tools I use frequently
        # feel free to add your own or remove some of them

        zsh
        neofetch
        yazi

        # archives
        zip
        unzip

        # utils
        fzf # A command-line fuzzy finder

        # networking tools
        nmap # A utility for network discovery and security auditing

        # nix related
        #
        # it provides the command `nom` works just like `nix`
        # with more details log output
        nix-output-monitor

        # productivity
        hugo # static site generator
        btop # replacement of htop/nmon

        # system tools
        usbutils # lsusb
    ];

    # basic configuration of git, please change to your own
    programs.git = {
        enable = true;
        userName = "";
        userEmail = "xiaoyin_c@qq.com";
    };

    # alacritty - a cross-platform, GPU-accelerated terminal emulator
    programs.alacritty = {
        enable = true;
        # custom settings
        settings = {
            env.TERM = "xterm-256color";
            font = {
                size = 12;
                draw_bold_text_with_bright_colors = true;
            };
            scrolling.multiplier = 5;
            selection.save_to_clipboard = true;
        };
    };

    programs.zsh = {
        enable = true;
        enableCompletion = true;

        # set some aliases, feel free to add more or remove some
        shellAliases = {
            k = "kubectl";
        };
    };

    # This value determines the home Manager release that your
    # configuration is compatible with. This helps avoid breakage
    # when a new home Manager release introduces backwards
    # incompatible changes.
    #
    # You can update home Manager without changing this value. See
    # the home Manager release notes for a list of state version
    # changes in each release.
    home.stateVersion = "25.11";
}
