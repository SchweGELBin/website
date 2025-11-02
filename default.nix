{
  lib,
  nodejs,
  pnpm,
  stdenv,
}:

stdenv.mkDerivation (finalAttrs: {
  pname = "website";
  version = "1.6.4";

  src = ./.;

  nativeBuildInputs = [
    nodejs
    pnpm.configHook
  ];

  pnpmDeps = pnpm.fetchDeps {
    inherit (finalAttrs) pname version src;
    hash = "sha256-Tqrj5m14G7KInbWOIJTHZG5bNW6g1AL2zzGnw4cP6kA=";
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
