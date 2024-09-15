{
  pkgs ? import <nixpgs> { },
}:
pkgs.mkShell {
  name = "fabric-shell";
  packages = with pkgs; [
    texlab
    tex-fmt
    just
    zathura
  ];
}

