{
  lib,
  nodejs,
  pnpm,
  stdenv,
}:

stdenv.mkDerivation (finalAttrs: {
  pname = "website";
  version = "0.1.0";

  src = ./.;

  nativeBuildInputs = [
    nodejs
    pnpm.configHook
  ];

  pnpmDeps = pnpm.fetchDeps {
    inherit (finalAttrs) pname version src;
    hash = "sha256-Aanki+d4pQmn1sYYTOttMfw5FyM8dY26GU/k0iu5r0E=";
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
