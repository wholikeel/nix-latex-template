{ pkgs ? import <nixpkgs> { }, ... }:

pkgs.stdenv.mkDerivation rec {
  name = "my-document";
  src = ./.;
  buildInputs = with pkgs; [
    texliveFull
  ];
  buildPhase = ''
    mkdir -p .cache/latex
    latexmk -interaction=nonstopmode -auxdir=.cache/latex -pdf main.tex
  '';
  installPhase = ''
    mkdir -p $out
    cp main.pdf $out/${name}.pdf
  '';
}
