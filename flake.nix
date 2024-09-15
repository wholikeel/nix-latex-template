{
  description = "Simple LaTeX template";
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/24.05";
    flake-utils.url = "github:numtide/flake-utils";
    tex-fmt.url = "github:wholikeel/tex-fmt";
  };

  outputs = { nixpkgs, flake-utils, tex-fmt, ... }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = nixpkgs.legacyPackages.${system}.extend (
            tex-fmt.overlays.default
        );
      in
      {
        formatter = pkgs.nixfmt-rfc-style;
        devShells = {
          default = pkgs.callPackage ./shell.nix { };
        };
        packages.default = pkgs.callPackage ./default.nix { };
      });
}

