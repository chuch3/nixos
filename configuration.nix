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
}
