{ stdenv, gnumake, gcc-arm-embedded, python3 }:

stdenv.mkDerivation rec {
  pname = "libopencm3";
  version = "0.1.0";
  src = ./.;

  nativeBuildInputs = [ gnumake gcc-arm-embedded python3 ];
  # TODO use this variable as the one to override for the build
  device = "";
  dontPatch = true;
  dontFixup = true;
  dontStrip = true;
  installPhase = ''
    mkdir -p $out/lib
    find . -maxdepth 2 -type f -name "*.a" -exec cp {} $out/lib \;
  '';
}