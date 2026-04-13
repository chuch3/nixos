# /etc/nixos/configuration.nix
#
# `configuration.nix` is simply the derivation that takes the configuration and nixpkgs as input to deterministically output the reproducable system.
{
    config,
    pkgs,
    ...
}: {
    imports = [
        # Include the results of the hardware scan.
        ./hardware-configuration.nix
    ];

    # Limit list of versions during boot
    boot.loader.systemd-boot.configurationLimit = 10;

    # Enable the Flakes feature and the accompanying new nix command-line tool
    nix.settings.experimental-features = ["nix-command" "flakes"];

    environment.systemPackages = with pkgs; [
        # Flakes clones its dependencies through the git command,
        # so git must be installed first
        git
        nvim
        wget
    ];
    # Set the default editor to vim
    environment.variables.EDITOR = "nvim";

    # Perform garbage collection weekly to maintain low disk usage
    nix.gc = {
        automatic = true;
        dates = "weekly";
        options = "--delete-older-than 7d";
    };

    # Optimize storage
    # You can also manually optimize the store via:
    #    nix-store --optimise
    # Refer to the following link for more details:
    # https://nixos.org/manual/nix/stable/command-ref/conf-file.html#conf-auto-optimise-store

    nix.settings.auto-optimise-store = true;
}
