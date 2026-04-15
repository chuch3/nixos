{
  config,
  pkgs,
  ...
}: {
  # default applications
  xdg.mimeApps = {
    defaultApplicationPackages = with pkgs; [
      # 1: VIEWERS ==================================
      mupdf # pdf reader
      xfce.thunar # file manager
      viewnior # image viewer
      vlc # media player

      # 2: EDITORS ==================================
      libreoffice-qt6 # work :(
      krita # paint
      gimp # advanced image editing
      picard # music metadata editor
    ];
  };

  home = {
    username = "chu";
    homeDirectory = "/home/chu";

    packages = let
      system = pkgs.stdenv.hostPlatform.system;
    in
      with pkgs;
        [
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

          # GUI PROGRAMS ================================
          # Note that file viewers and editors should instead be
          # configured in xdg.mimeApps.defaultApplicationPackages!
          qbittorrent # dw about it
          audacious # music player

          # universal tray applets...
          networkmanagerapplet

          # CLI PROGRAMS ================================
          unzip
          ripgrep
          bat
          killall
          fzf
          ffmpeg
          yt-dlp
          nh # nix helper

          # FONTS AND OTHER =============================
          etBook
          times-newer-roman
          mplus-outline-fonts.githubRelease
        ]
        ++ config.xdg.mimeApps.defaultApplicationPackages;
  };

  # custom modules
  modules.alacritty.enable = true;
  modules.firefox.enable = true;
  modules.music.enable = false;

  # desktop environments (see desktops/default.nix)
  modules.desktops = {
    primary_display_server = "xorg";
    wayland.enable = false;
    xorg.enable = true;
  };

  # global theme
  # themes can be previewed at https://tinted-theming.github.io/tinted-gallery/
  modules.themes = {
    # dark themes
    # themeName = "eris"; #                    dark blue city lights
    # themeName = "pico"; #                    highkey ugly but maybe redeemable
    # themeName = "tarot"; #                   very reddish purply
    # themeName = "kimber"; #                  nordish but more red
    # themeName = "embers"; #                  who dimmed the lights
    # themeName = "stella"; #                  purple, pale-ish
    # themeName = "zenburn"; #               ⋆ grey but in an endearing way
    # themeName = "onedark"; #                 atom propaganda
    # themeName = "darcula"; #               ⋆ jetbrains propaganda
    # themeName = "darkmoss"; #                cool blue-green
    # themeName = "gigavolt"; #                dark, vibrant, and purply
    # themeName = "kanagawa"; #              ⋆ blue with yellowed text
    # themeName = "mountain"; #              ⋆ dark and moody
    # themeName = "spacemacs"; #             ⋆ inoffensively dark and vibrant
    # themeName = "darktooth"; #             ⋆ gruvbox but more purply
    # themeName = "treehouse"; #             ⋆ summercamp, darker and purpler
    # themeName = "elemental"; #             ⋆ earthy and muted
    # themeName = "earthsong"; #               elemental but a little less muted
    # themeName = "everforest"; #              greenish and groovy
    # themeName = "summercamp"; #            ⋆ earthy but vibrant
    # themeName = "ic-green-ppl"; #            i see green people? who knows
    # themeName = "horizon-dark"; #            vaporwavey
    # themeName = "grayscale-dark"; #          jesse i need to lock in NOW
    # themeName = "oxocarbon-dark"; #        ⋆ dark and vibrant
    # themeName = "terracotta-dark"; #       ⋆ chocolatey and dark
    # themeName = "tokyo-night-storm"; #        blue and purple
    # themeName = "gruvbox-dark-medium"; #   ⋆ a classic
    # themeName = "catppuccin-macchiato"; #    purple pastel
    themeName = "floraverse";

    # light themes
    # themeName = "dirtysea"; #                greeeen and gray
    # themeName = "earl-grey"; #               the coziest to ever do it
    # themeName = "flatwhite"; #               why is it highlighted? idk
    # themeName = "ayu-light"; #               kinda pastel
    # themeName = "sagelight"; #               more pastel
    # themeName = "terracotta"; #              earthy and bright
    # themeName = "horizon-light"; #           vaporwavey
    # themeName = "classic-light"; #           basic and visible
    # themeName = "rose-pine-dawn"; #          cozy yellow and purple
    # themeName = "humanoid-light"; #          basic, visible, a lil yellowed
    # themeName = "solarized-light"; #       ⋆ very much yellowed
  };

  # do not touch
  home.stateVersion = "24.05";
}
