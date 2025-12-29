{
  pkgs ? import <nixpkgs> { },
}:

pkgs.stdenv.mkDerivation rec {
  name = "hcos-generate";
  version = "0.0.1";

  # If you have a downloaded tacallPackagerball, you'd use pkgs.fetchurl or similar
  src = ./.;

  installPhase = ''
    mkdir -p $out/bin
    cp bin $out/bin/hcos-generate
    chmod +x $out/bin/hcos-generate
  '';
}
