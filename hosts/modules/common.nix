{
  pkgs,
  inputs,
  lib,
  config,
  ...
}: {
  imports = [
    ./output
    ./desktops
  ];

  powerManagement.enable = true;

  hardware.graphics.enable = true;
  hardware.graphics.package = pkgs.mesa;

  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = false;

  # Bluetooth
  hardware.bluetooth.enable = true;
  hardware.bluetooth.powerOnBoot = true;

  # Set your time zone.
  time.timeZone = "Asia/Kuala_Lumpur";

  # Enable CUPS to print documents.
  services.printing.enable = true;

  nix = {
    # Enable flakes
    settings.experimental-features = ["nix-command" "flakes"];
    # Enable automatic garbage collection
    gc = {
      automatic = true;
      options = "--delete-older-than 30d";
    };
    # Enable automatic optimization
    optimise.automatic = true;
    # ensure that nixpkgs path aligns with nixpkgs flake input
    nixPath = ["nixpkgs=${inputs.nixpkgs}:nixpkgs-unstable=${inputs.nixpkgs-unstable}"];
  };

  # Enable the OpenSSH daemon.
  services.openssh = {
    enable = true;
    settings = {PasswordAuthentication = false;};
  };

  # Open ports in the firewall
  networking.firewall = {
    enable = true;
    allowedTCPPorts = [57110];
  };
}
