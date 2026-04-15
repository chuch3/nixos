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
      display-management = {
        displays = lib.mkOption {
          description = "The displays available for this system";
          type = lib.types.attrsOf (lib.types.submodule {
            options = {
              pixel-size.width = lib.mkOption {
                type = lib.types.int;
                description = "the width of this display in physical (not logical) pixels";
              };
              pixel-size.height = lib.mkOption {
                type = lib.types.int;
                description = "the height of this display in physical (not logical) pixels";
              };
              scale.xorg = lib.mkOption {
                type = lib.types.float;
                description = "the scale of this display on x.org systems";
              };
              scale.wayland = lib.mkOption {
                type = lib.types.float;
                description = "the scale of this display on wayland systems";
              };
            };
          });
        };
        profiles = lib.mkOption {
          description = "The display profiles available for this system (e.g., for autorandr)";
          type = lib.types.attrsOf (lib.types.attrsOf (lib.types.submodule {
            options = {
              position = lib.mkOption {
                description = "the position of this display in logical pixels";
                example = "1366x0";
              };
              primary = lib.mkEnableOption "whether this is the primary display in the profile";
            };
          }));
        };
      };
    };
  };
}
