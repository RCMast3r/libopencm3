{
  description = "asdf";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-23.05";
    utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, utils, ... }:
    {
      overlays.default = final: prev: {

        # The "correct" approach is to use final (and/or prev) to construct your package
        # Notice that pkgs is not involved at all.
        libopencm3 = final.callPackage ./default.nix { };

      };

      packages.x86_64-linux =
        let

          # So-called "legacy" packages, extended by your overlay.
          pkgs = import nixpkgs {
            system = "x86_64-linux";
            overlays = [ self.overlays.default ];
          };

        in
        rec {
          # Now you can just export libopencm3 from pkgs
          libopencm3 = pkgs.libopencm3;
          default = libopencm3;

          devShell = pkgs.mkShell rec {
            name = "yeet";

            packages = with pkgs; [
              # Development Tools
              gnumake
              gcc-arm-embedded
              python3
            ];
          };
        };
    };

}
