{
  lib,
  stdenvNoCC,
  fetchzip,
}:

stdenvNoCC.mkDerivation {
  pname = "openclaw-app";
  version = "2026.5.22";

  src = fetchzip {
    url = "https://github.com/openclaw/openclaw/releases/download/v2026.5.22/OpenClaw-2026.5.22.zip";
    hash = "sha256-ho1umFS/hlmoV96niF/Ni/BYPVe72JnC2tUz2JwRG7M=";
    stripRoot = false;
  };

  dontUnpack = true;

  installPhase = "${../scripts/openclaw-app-install.sh}";

  meta = with lib; {
    description = "OpenClaw macOS app bundle";
    homepage = "https://github.com/openclaw/openclaw";
    license = licenses.mit;
    platforms = platforms.darwin;
  };
}
