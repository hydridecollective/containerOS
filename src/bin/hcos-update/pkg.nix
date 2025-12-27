{
  pkgs ? import <nixpkgs> { },
}:

pkgs.stdenv.mkDerivation rec {
  name = "hcos-update";
  version = "0.0.1";

  # If you have a downloaded tacallPackagerball, you'd use pkgs.fetchurl or similar
  src = ./.;

  installPhase = ''
    mkdir -p $out/bin
    cp bin $out/bin/hcos-update
    chmod +x $out/bin/hcos-update
  '';
}
