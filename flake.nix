# /etc/nixos/flake.nix
# Reference Config : https://github.com/breitnw/nixos/blob/7aa877c3f0d2b0949c09ef2398d883c19b209dbf/flake.nix
{
    description = "polych's nixos";

    inputs = {
        # CORE (packages, system, etc) =============================================

        nixpkgs.url = "github:nixos/nixpkgs/nixos-25.11";
        nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";
        home-manager = {
            url = "github:nix-community/home-manager/release-25.11";
            inputs.nixpkgs.follows = "nixpkgs";
        };
        # THEMING ==================================================================

        # system-wide theming
        nix-colors.url = "github:misterio77/nix-colors"; # palettes
        nix-rice.url = "github:bertof/nix-rice"; # utils
        # theming for firefox
        firefox-native-base16.url = "github:GnRlLeclerc/firefox-native-base16";
        # cozette built from source
        cozette.url = "github:breitnw/cozette/dev-current";
        # cozette with modifications for use of glyphs with terminus
        bitmap-glyphs-12.url = "github:breitnw/bitmap-glyphs-12";
        bitmap-glyphs-12.inputs.cozette.follows = "cozette";
        # greybird with custom accent support
        greybird.url = "github:breitnw/Greybird/master";
        # temporarily convert symlinks to real files
        hm-ricing-mode.url = "github:Markus328/hm-ricing-mode/fix-hm-module";
        # flakified icon theme
        buuf-icon-theme.url = "github:breitnw/buuf-gnome";
        # niri window manager
        niri-flake.url = "github:sodiboo/niri-flake";
        niri-flake.inputs.nixpkgs.follows = "nixpkgs";
        # cursor theme
        hackneyed.url = "github:owm111/hackneyed-x11-cursors";

        # PROGRAMS AND UTILS =======================================================

        # search for files (e.g., headers) in nixpkgs
        nix-index-database = {
            url = "github:nix-community/nix-index-database";
            inputs.nixpkgs.follows = "nixpkgs";
        };

        # NON-FLAKE ================================================================

        base16-alacritty = {
            url = "github:aarowill/base16-alacritty";
            flake = false;
        };
    };
    output = inputs @ {
        self,
        nixpkgs,
        home-manager,
        ...
    }: {
        nixosConfigurations = {
            chu = nixpkgs.lib.nixosSystem {
                system = "x86_64";
                modules = [
                    # Import the previous configuration.nix we used,
                    # so the old configuration file still takes effect
                    ./configuration.nix
                    home-manager.nixosModules.home-manager
                    {
                        home-manager = {
                            useGlobalPkgs = true;
                            home-manager.useUserPackages = true;
                            user.polych = import ./home.nix;
                            backupFileExtension = "backup";
                        };
                    }
                ];
            };
        };
    };
}
