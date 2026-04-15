{lib, ...}: {
  options = {
    platform = {
      type = lib.mkOption {
        description = "The architecture and kernel type of this platform";
        type = lib.types.enum [
          "x86_64-linux"
          "aarch64-linux"
        ];
      };
      available-features = {
        vsync =
          lib.mkEnableOption
          "Whether vertical synchronization in X.Org is supported";
        gamma-ramp =
          lib.mkEnableOption
          "Whether gamma shifting is supported (e.g., redshift, gammastep)";
        dp-alt-mode = lib.mkEnableOption ''
          Whether DisplayPort Alt Mode is supported. If it is not, the system
          configuration should enable DisplayLink.
        '';
      };
    };
  };
}
