{
  lib,
  nodejs,
  pnpm,
  stdenv,
}:

stdenv.mkDerivation (finalAttrs: {
  pname = "website";
  version = "1.6.3";

  src = ./.;

  nativeBuildInputs = [
    nodejs
    pnpm.configHook
  ];

  pnpmDeps = pnpm.fetchDeps {
    inherit (finalAttrs) pname version src;
    hash = "sha256-btieDnflhY0SBBdVrP+pCEUkfz2CBQTtXBnw/CvZsaM=";
    fetcherVersion = 2;
  };

  buildPhase = "pnpm build";

  installPhase = ''
    mkdir -p $out
    cp -r dist/* $out
  '';

  meta = {
    description = "My website";
    homepage = "https://github.com/SchweGELBin/website";
    changelog = "https://github.com/SchweGELBin/website/blob/v${finalAttrs.version}/docs/CHANGELOG.md";
    license = lib.licenses.mit;
    mainProgram = finalAttrs.pname;
    maintainers = with lib.maintainers; [ SchweGELBin ];
  };
})
