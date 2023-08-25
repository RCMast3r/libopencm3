{ stdenv, cmake, gnumake, gcc-arm-embedded }:

stdenv.mkDerivation rec {
  pname = "libopencm3";
  version = "0.1.0";
  src = ./.;

  nativeBuildInputs = [ cmake gnumake gcc-arm-embedded ];

  # TODO use this variable as the one to override for the build
  device = "";


  # TODO
  # cmakeFlags = [
  #   "-DENABLE_TESTING=OFF"
  #   "-DENABLE_INSTALL=ON"
  # ];

  
}